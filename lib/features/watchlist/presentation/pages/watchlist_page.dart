import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../bloc/watchlist_bloc.dart';
import '../../bloc/watchlist_event.dart';
import '../../bloc/watchlist_state.dart';
import '../../data/watchlist_repository.dart';
import '../widgets/stock_tile.dart';
import '../widgets/watchlist_header.dart';
import '../../../../core/theme/app_colors.dart';

/// The main watchlist screen that displays stocks in a reorderable list.
class WatchlistPage extends StatelessWidget {
  const WatchlistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WatchlistBloc(
        repository: const WatchlistRepository(),
      )..add(const WatchlistStarted()),
      child: const WatchlistView(),
    );
  }
}

class WatchlistView extends StatelessWidget {
  const WatchlistView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<WatchlistBloc, WatchlistState>(
        builder: (context, state) {
          return Column(
            children: [
              // Custom Header
              WatchlistHeader(
                stockCount:
                    state is WatchlistLoadSuccess ? state.stocks.length : 0,
              ),
              // Main Content
              Expanded(
                child: _buildContent(context, state),
              ),
            ],
          );
        },
      ),
    );
  }

  Widget _buildContent(BuildContext context, WatchlistState state) {
    return switch (state) {
      WatchlistInitial() || WatchlistLoadInProgress() => const Center(
          child: CircularProgressIndicator(
            color: AppColors.accent,
            strokeWidth: 3,
          ),
        ),
      WatchlistLoadFailure(:final message) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.error_outline, color: AppColors.loss, size: 48),
              const SizedBox(height: 16),
              Text(
                'Failed to load watchlist',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              Text(
                message,
                style: Theme.of(context).textTheme.bodySmall,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () =>
                    context.read<WatchlistBloc>().add(const WatchlistStarted()),
                child: const Text('Retry'),
              ),
            ],
          ),
        ),
      WatchlistLoadSuccess(:final stocks) => ReorderableListView.builder(
          padding: const EdgeInsets.only(top: 12, bottom: 32),
          itemCount: stocks.length,
          onReorder: (oldIndex, newIndex) {
            context.read<WatchlistBloc>().add(
                  WatchlistStockMoved(
                    stock: stocks[oldIndex],
                    oldIndex: oldIndex,
                    newIndex: newIndex,
                  ),
                );
          },
          proxyDecorator: (child, index, animation) {
            return AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                final animValue = Curves.easeInOut.transform(animation.value);
                final elevation = animValue * 12.0;
                final scale = 1.0 + (animValue * 0.03);

                return Transform.scale(
                  scale: scale,
                  child: Material(
                    elevation: elevation,
                    color: Colors.transparent,
                    shadowColor: AppColors.dragShadow,
                    child: child,
                  ),
                );
              },
              child: child,
            );
          },
          itemBuilder: (context, index) {
            return StockTile(
              key: ValueKey(stocks[index].id),
              stock: stocks[index],
              index: index,
            );
          },
        ),
    };
  }
}
