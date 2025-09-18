import 'package:flutter/material.dart';
import 'package:moneyexpense/utils/constants/app_colors.dart';
import 'package:moneyexpense/utils/constants/app_spacing.dart';
import 'package:moneyexpense/utils/widgets/common/category_icon.dart';

import '../../../app/data/models/category.dart';

/// A widget for selecting a category in forms.
class CategorySelector extends StatelessWidget {
  final Category? selectedCategory;
  final VoidCallback onTap;

  const CategorySelector({
    super.key,
    this.selectedCategory,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: InputDecorator(
        decoration: const InputDecoration(
          labelText: 'Kategori',
          border: OutlineInputBorder(),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                if (selectedCategory != null) ...[
                  CategoryIcon.withoutBackground(category: selectedCategory!),
                  AppSpace.lg.width,
                ],
                Text(
                  selectedCategory == null
                      ? 'Pilih Kategori'
                      : selectedCategory!.name,
                ),
              ],
            ),
            Container(
              decoration: BoxDecoration(
                color: AppColors.greyLight,
                shape: BoxShape.circle,
              ),
              child: const Icon(Icons.chevron_right),
            ),
          ],
        ),
      ),
    );
  }
}
