import 'package:flutter/material.dart';

/// Centralized border radius constants for consistent UI styling.
/// Keep this focused only on border radius for better organization.
class AppBorderRadius {
  // Private constructor to prevent instantiation.
  AppBorderRadius._();

  /// Small border radius (8px).
  static const BorderRadius small = BorderRadius.all(Radius.circular(8));

  /// Medium border radius (12px).
  static const BorderRadius medium = BorderRadius.all(Radius.circular(12));

  /// Large border radius (16px).
  static const BorderRadius large = BorderRadius.all(Radius.circular(16));

  /// Extra large border radius (20px).
  static const BorderRadius xlarge = BorderRadius.all(Radius.circular(20));
}
