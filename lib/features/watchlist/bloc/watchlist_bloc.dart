import 'package:flutter_bloc/flutter_bloc.dart';
import '../data/watchlist_repository.dart';
import 'watchlist_event.dart';
import 'watchlist_state.dart';

/// Manages the state of the stock watchlist.
///
/// Handles:
/// - [WatchlistStarted]    → loads stocks from [WatchlistRepository]
/// - [WatchlistStockMoved] → reorders the stock list and emits updated state
final class WatchlistBloc extends Bloc<WatchlistEvent, WatchlistState> {
  WatchlistBloc({required WatchlistRepository repository})
      : _repository = repository,
        super(const WatchlistInitial()) {
    on<WatchlistStarted>(_onStarted);
    on<WatchlistStockMoved>(_onStockMoved);
  }

  final WatchlistRepository _repository;

  // ── Event Handlers ────────────────────────────────────────────────────────

  Future<void> _onStarted(
    WatchlistStarted event,
    Emitter<WatchlistState> emit,
  ) async {
    emit(const WatchlistLoadInProgress());
    try {
      // Simulate a short async fetch to demonstrate loading state.
      await Future<void>.delayed(const Duration(milliseconds: 400));
      final stocks = _repository.getWatchlist();
      emit(WatchlistLoadSuccess(stocks: stocks));
    } catch (error) {
      emit(WatchlistLoadFailure(message: error.toString()));
    }
  }

  void _onStockMoved(
    WatchlistStockMoved event,
    Emitter<WatchlistState> emit,
  ) {
    final currentState = state;
    if (currentState is! WatchlistLoadSuccess) return;

    final stocks = List.of(currentState.stocks);

    // ReorderableListView passes newIndex after removal, so adjust if needed.
    final adjustedNewIndex =
        event.newIndex > event.oldIndex ? event.newIndex - 1 : event.newIndex;

    stocks.removeAt(event.oldIndex);
    stocks.insert(adjustedNewIndex, event.stock);

    emit(currentState.copyWith(stocks: stocks));
  }
}
