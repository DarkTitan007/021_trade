import 'package:equatable/equatable.dart';
import '../models/stock_model.dart';

/// Base class for all watchlist states.
sealed class WatchlistState extends Equatable {
  const WatchlistState();

  @override
  List<Object?> get props => [];
}

/// Initial state before any data is fetched.
final class WatchlistInitial extends WatchlistState {
  const WatchlistInitial();
}

/// Emitted while the repository is loading data.
final class WatchlistLoadInProgress extends WatchlistState {
  const WatchlistLoadInProgress();
}

/// Emitted when stock data has been successfully loaded/reordered.
final class WatchlistLoadSuccess extends WatchlistState {
  const WatchlistLoadSuccess({required this.stocks});

  /// The ordered list of stocks in the watchlist.
  final List<Stock> stocks;

  /// Returns a new state with the provided stocks list.
  WatchlistLoadSuccess copyWith({List<Stock>? stocks}) {
    return WatchlistLoadSuccess(stocks: stocks ?? this.stocks);
  }

  @override
  List<Object?> get props => [stocks];
}

/// Emitted when data loading fails.
final class WatchlistLoadFailure extends WatchlistState {
  const WatchlistLoadFailure({required this.message});

  final String message;

  @override
  List<Object?> get props => [message];
}
