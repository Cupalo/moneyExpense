import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../app/data/models/category.dart';

/// A reusable widget for displaying category icons with consistent styling.
class CategoryIcon extends StatelessWidget {
  final Category category;
  final double size;
  final double iconScale;
  final bool showBackground;

  const CategoryIcon._({
    required this.category,
    this.size = 40,
    this.iconScale = 0.5,
    this.showBackground = true,
  });

  /// Factory constructor for icons with background circle (category cards, picker).
  factory CategoryIcon.withBackground({
    required Category category,
    double size = 40,
    double iconScale = 0.5,
  }) {
    return CategoryIcon._(
      category: category,
      size: size,
      iconScale: iconScale,
      showBackground: true,
    );
  }

  /// Factory constructor for icons without background (expense items).
  factory CategoryIcon.withoutBackground({
    required Category category,
    double size = 40,
    double iconScale = 0.6,
  }) {
    return CategoryIcon._(
      category: category,
      size: size,
      iconScale: iconScale,
      showBackground: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    final iconWidget = category.iconAssetPath.isNotEmpty
        ? SvgPicture.asset(
            category.iconAssetPath,
            colorFilter: ColorFilter.mode(
              showBackground ? Colors.white : Color(category.colorHex),
              BlendMode.srcIn,
            ),
            width: size * iconScale,
            height: size * iconScale,
          )
        : const SizedBox.shrink();

    if (!showBackground) return iconWidget;

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: Color(category.colorHex),
        shape: BoxShape.circle,
      ),
      child: Center(child: iconWidget),
    );
  }
}
