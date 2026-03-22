import 'package:equatable/equatable.dart';
import '../models/stock_model.dart';

/// Base class for all watchlist events.
sealed class WatchlistEvent extends Equatable {
  const WatchlistEvent();

  @override
  List<Object?> get props => [];
}

/// Triggers the initial load of the watchlist data.
final class WatchlistStarted extends WatchlistEvent {
  const WatchlistStarted();
}

/// Fired when the user drags a stock tile to a new position.
final class WatchlistStockMoved extends WatchlistEvent {
  const WatchlistStockMoved({
    required this.stock,
    required this.oldIndex,
    required this.newIndex,
  });

  /// The stock being moved.
  final Stock stock;

  /// Original position in the list (0-based).
  final int oldIndex;

  /// Target position in the list (0-based).
  final int newIndex;

  @override
  List<Object?> get props => [stock, oldIndex, newIndex];
}
