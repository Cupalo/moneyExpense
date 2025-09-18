import 'package:flutter/material.dart';

import '../../../app/data/models/category.dart';
import '../common/card_container.dart';
import '../common/app_typography.dart';
import '../common/category_icon.dart';
import '../../helpers/currency_formatter.dart';
import '../../constants/app_spacing.dart';

/// A reusable card widget for displaying category information.
class CategoryCard extends StatelessWidget {
  final Category category;
  final double totalAmount;

  const CategoryCard({
    super.key,
    required this.category,
    required this.totalAmount,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 120,
      child: CardContainer(
        padding: AppSpace.md.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CategoryIcon.withBackground(category: category),
            const Spacer(),
            Text(category.name, style: AppTypography.categoryName),
            Text(
              CurrencyFormatter.format(totalAmount),
              style: AppTypography.categoryAmount,
            ),
          ],
        ),
      ),
    );
  }
}
