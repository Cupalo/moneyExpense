import 'package:flutter/material.dart';

/// Centralized shadow definitions for consistent UI styling.
class AppShadows {
  /// Standard card shadow used throughout the app.
  static const List<BoxShadow> cardShadow = [
    BoxShadow(
      color: Color(0x0D000000), // Colors.black.withOpacity(0.05)
      blurRadius: 10,
      offset: Offset(0, 0),
    ),
  ];

  /// No shadow for cards that don't need elevation.
  static const List<BoxShadow> noShadow = [];

  /// Subtle shadow for floating elements.
  static const List<BoxShadow> floatingShadow = [
    BoxShadow(
      color: Color(0x1A000000), // Colors.black.withOpacity(0.1)
      blurRadius: 8,
      offset: Offset(0, 2),
    ),
  ];

  /// Strong shadow for elevated elements.
  static const List<BoxShadow> elevatedShadow = [
    BoxShadow(
      color: Color(0x1F000000), // Colors.black.withOpacity(0.12)
      blurRadius: 16,
      offset: Offset(0, 8),
    ),
  ];
}
