import 'package:flutter/material.dart';

/// Centralized typography definitions for consistent text styling.
class AppTypography {
  // Private constructor to prevent instantiation.
  AppTypography._();

  /// Large title text style.
  static const TextStyle largeTitle = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.w700,
  );

  /// Section header text style.
  static const TextStyle sectionHeader = TextStyle(
    fontSize: 14,
    fontWeight: FontWeight.w600,
  );

  /// Subtitle text style.
  static const TextStyle subtitle = TextStyle(color: Colors.grey);

  /// Category name text style.
  static const TextStyle categoryName = TextStyle(fontSize: 12);

  /// Category amount text style.
  static const TextStyle categoryAmount = TextStyle(
    fontWeight: FontWeight.w600,
  );

  /// Modal title text style.
  static const TextStyle modalTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
  );

  /// Button text style.
  static const TextStyle button = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
}
