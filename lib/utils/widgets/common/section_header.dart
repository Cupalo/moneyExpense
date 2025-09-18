import 'package:flutter/material.dart';

import 'app_typography.dart';
import '../../constants/app_spacing.dart';

/// A reusable section header widget for consistent styling.
class SectionHeader extends StatelessWidget {
  final String title;
  final Widget? trailing;

  const SectionHeader({super.key, required this.title, this.trailing});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: AppTypography.sectionHeader),
        if (trailing != null) trailing!,
      ],
    );
  }
}

/// A section header with spacing below it.
class SectionHeaderWithSpacing extends StatelessWidget {
  final String title;
  final Widget? trailing;
  final Widget child;

  const SectionHeaderWithSpacing({
    super.key,
    required this.title,
    this.trailing,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SectionHeader(title: title, trailing: trailing),
        AppSpace.sm.height,
        child,
      ],
    );
  }
}
