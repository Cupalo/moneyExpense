import 'package:flutter/material.dart';

import '../../../app/data/models/category.dart';
import '../../../app/data/models/expense.dart';
import '../common/card_container.dart';
import '../common/category_icon.dart';
import '../../helpers/currency_formatter.dart';
import '../../constants/app_spacing.dart';

/// A reusable widget for displaying individual expense items.
class ExpenseItem extends StatelessWidget {
  final Expense expense;
  final Category category;

  const ExpenseItem({super.key, required this.expense, required this.category});

  @override
  Widget build(BuildContext context) {
    return CardContainer(
      margin: AppSpace.md.paddingBottom,
      padding: AppSpace.md.padding,
      child: Row(
        children: [
          CategoryIcon.withoutBackground(category: category),
          AppSpace.md.width,
          Expanded(child: Text(expense.note)),
          Text(CurrencyFormatter.format(expense.amount)),
        ],
      ),
    );
  }
}
