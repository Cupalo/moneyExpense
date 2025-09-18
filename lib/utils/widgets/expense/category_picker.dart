import 'package:flutter/material.dart';

import '../../../app/data/models/category.dart';
import '../common/app_typography.dart';
import '../common/category_icon.dart';
import '../../constants/app_spacing.dart';

/// A bottom sheet widget for selecting categories.
class CategoryPicker extends StatelessWidget {
  final List<Category> categories;
  final Function(Category) onCategorySelected;

  const CategoryPicker({
    super.key,
    required this.categories,
    required this.onCategorySelected,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: AppSpace.lg.padding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Pilih Kategori', style: AppTypography.modalTitle),
            AppSpace.xl.height,
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
                childAspectRatio: 1.5,
              ),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                final category = categories[index];
                return InkWell(
                  onTap: () {
                    onCategorySelected(category);
                    Navigator.pop(context);
                  },
                  child: Column(
                    children: [
                      CategoryIcon.withBackground(category: category),
                      AppSpace.xs.height,
                      Text(
                        category.name,
                        style: AppTypography.categoryName,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
