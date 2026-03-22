import 'package:flutter/material.dart';
import 'core/theme/app_theme.dart';
import 'features/watchlist/presentation/pages/watchlist_page.dart';

/// The root widget of the 021 Trade application.
class TradeApp extends StatelessWidget {
  const TradeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '021 Trade',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.dark,
      home: const WatchlistPage(),
    );
  }
}
