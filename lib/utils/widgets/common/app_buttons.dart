import 'package:flutter/material.dart';

import '../../constants/app_colors.dart';
import '../../constants/app_border_radius.dart';

/// Centralized button definitions for consistent UI styling.
class AppButtons {
  // Private constructor to prevent instantiation.
  AppButtons._();

  /// Primary button style used throughout the app.
  static ButtonStyle primary = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryTeal,
    foregroundColor: Colors.white,
    minimumSize: const Size(double.infinity, 52),
    shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.large),
  );

  /// Secondary button style for less prominent actions.
  static ButtonStyle secondary = ElevatedButton.styleFrom(
    backgroundColor: Colors.grey.shade200,
    foregroundColor: Colors.grey.shade800,
    minimumSize: const Size(double.infinity, 52),
    shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.large),
  );

  /// Small button style for compact spaces.
  static ButtonStyle small = ElevatedButton.styleFrom(
    backgroundColor: AppColors.primaryTeal,
    foregroundColor: Colors.white,
    minimumSize: const Size(120, 40),
    shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.medium),
  );

  /// Text button style for minimal actions.
  static ButtonStyle text = TextButton.styleFrom(
    foregroundColor: AppColors.primaryTeal,
    shape: RoundedRectangleBorder(borderRadius: AppBorderRadius.small),
  );
}
