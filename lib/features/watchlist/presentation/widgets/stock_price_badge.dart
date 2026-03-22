import 'package:flutter/material.dart';
import '../../models/stock_model.dart';
import '../../../../core/theme/app_colors.dart';

/// A pill-shaped badge displaying the stock's current price and
/// percentage change. Colors adapt for gains (green) and losses (red).
class StockPriceBadge extends StatelessWidget {
  const StockPriceBadge({
    super.key,
    required this.stock,
  });

  final Stock stock;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final backgroundColor =
        stock.isGain ? AppColors.gainBackground : AppColors.lossBackground;
    final borderColor =
        stock.isGain ? AppColors.gainBorder : AppColors.lossBorder;
    final textColor = stock.isGain ? AppColors.gain : AppColors.loss;
    final icon = stock.isGain ? Icons.arrow_drop_up : Icons.arrow_drop_down;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisSize: MainAxisSize.min,
      children: [
        // Current Price
        Text(
          stock.formattedPrice,
          style: textTheme.titleMedium?.copyWith(
            color: AppColors.textPrimary,
            fontWeight: FontWeight.w700,
            fontSize: 16,
          ),
        ),
        const SizedBox(height: 4),
        // % Change Badge
        DecoratedBox(
          decoration: BoxDecoration(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: borderColor, width: 0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(icon, color: textColor, size: 14),
                Text(
                  stock.formattedChangePercent,
                  style: textTheme.labelLarge?.copyWith(
                    color: textColor,
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
