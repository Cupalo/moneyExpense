import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../common/card_container.dart';
import '../common/app_shadows.dart';
import '../../helpers/currency_formatter.dart';
import '../../constants/app_spacing.dart';

/// A reusable card widget for displaying expense statistics.
class ExpenseStatCard extends StatelessWidget {
  final String title;
  final double amount;
  final Color backgroundColor;
  final Color textColor;
  final Color subtitleColor;

  const ExpenseStatCard({
    super.key,
    required this.title,
    required this.amount,
    required this.backgroundColor,
    this.textColor = Colors.white,
    this.subtitleColor = Colors.white70,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: CardContainer(
        backgroundColor: backgroundColor,
        boxShadow: AppShadows.cardShadow,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
              child: Text(title, style: TextStyle(color: subtitleColor)),
            ),
            AppSpace.sm.height,
            Text(
              CurrencyFormatter.format(amount),
              style: TextStyle(
                color: textColor,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Predefined expense stat cards for common use cases.
class ExpenseStatCards {
  /// Today's expense card.
  static Widget todayExpense({required double amount}) {
    return ExpenseStatCard(
      title: 'Pengeluaranmu hari ini',
      amount: amount,
      backgroundColor: AppColors.primaryTeal,
    );
  }

  /// This month's expense card.
  static Widget monthExpense({required double amount}) {
    return ExpenseStatCard(
      title: 'Pengeluaranmu bulan ini',
      amount: amount,
      backgroundColor: AppColors.primaryBlue,
    );
  }
}
