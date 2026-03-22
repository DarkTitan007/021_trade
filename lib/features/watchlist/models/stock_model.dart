import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

/// Immutable data class representing a stock in the watchlist.
final class Stock extends Equatable {
  const Stock({
    required this.id,
    required this.symbol,
    required this.companyName,
    required this.currentPrice,
    required this.change,
    required this.changePercent,
    required this.high,
    required this.low,
    required this.volume,
    required this.logoColor,
  });

  final String id;
  final String symbol;
  final String companyName;

  /// Current trading price in USD.
  final double currentPrice;

  /// Absolute price change from previous close.
  final double change;

  /// Percentage price change from previous close.
  final double changePercent;

  /// Day's high price.
  final double high;

  /// Day's low price.
  final double low;

  /// Trading volume (number of shares).
  final int volume;

  /// Brand color used as the logo/avatar background.
  final Color logoColor;

  // ── Derived Helpers ──────────────────────────────────────────────────────

  bool get isGain => changePercent >= 0;

  String get formattedPrice => '\$${currentPrice.toStringAsFixed(2)}';

  String get formattedChange {
    final sign = change >= 0 ? '+' : '';
    return '$sign${change.toStringAsFixed(2)}';
  }

  String get formattedChangePercent {
    final sign = changePercent >= 0 ? '+' : '';
    return '$sign${changePercent.toStringAsFixed(2)}%';
  }

  String get formattedVolume {
    if (volume >= 1_000_000) {
      return '${(volume / 1_000_000).toStringAsFixed(1)}M';
    } else if (volume >= 1_000) {
      return '${(volume / 1_000).toStringAsFixed(1)}K';
    }
    return volume.toString();
  }

  Stock copyWith({
    String? id,
    String? symbol,
    String? companyName,
    double? currentPrice,
    double? change,
    double? changePercent,
    double? high,
    double? low,
    int? volume,
    Color? logoColor,
  }) {
    return Stock(
      id: id ?? this.id,
      symbol: symbol ?? this.symbol,
      companyName: companyName ?? this.companyName,
      currentPrice: currentPrice ?? this.currentPrice,
      change: change ?? this.change,
      changePercent: changePercent ?? this.changePercent,
      high: high ?? this.high,
      low: low ?? this.low,
      volume: volume ?? this.volume,
      logoColor: logoColor ?? this.logoColor,
    );
  }

  @override
  List<Object?> get props => [
        id,
        symbol,
        companyName,
        currentPrice,
        change,
        changePercent,
        high,
        low,
        volume,
        logoColor,
      ];
}
