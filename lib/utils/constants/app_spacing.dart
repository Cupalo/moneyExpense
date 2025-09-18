import 'package:flutter/material.dart';

/// Centralized spacing system using enum for type safety and consistency.
enum AppSpace {
  xs(4.0),
  sm(8.0),
  md(12.0),
  lg(16.0),
  xl(20.0),
  xxl(24.0);

  const AppSpace(this.value);

  final double value;

  // Spacing widgets
  SizedBox get height => SizedBox(height: value);
  SizedBox get width => SizedBox(width: value);

  // Padding
  EdgeInsets get padding => EdgeInsets.all(value);
  EdgeInsets get paddingBottom => EdgeInsets.only(bottom: value);
  EdgeInsets get paddingTop => EdgeInsets.only(top: value);
  EdgeInsets get paddingLeft => EdgeInsets.only(left: value);
  EdgeInsets get paddingRight => EdgeInsets.only(right: value);
  EdgeInsets get paddingHorizontal => EdgeInsets.symmetric(horizontal: value);
  EdgeInsets get paddingVertical => EdgeInsets.symmetric(vertical: value);
}
