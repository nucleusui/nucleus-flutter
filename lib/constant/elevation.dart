import 'package:flutter/material.dart';

class AppElevation {
  static const Color shadow1Color = Color.fromRGBO(20, 20, 20, 0.12);
  static const Color shadow2Low = Color.fromRGBO(20, 20, 20, 0.08);
  static const Color shadow2Medium = Color.fromRGBO(20, 20, 20, 0.08);
  static const Color shadow2High = Color.fromRGBO(20, 20, 20, 0.04);

  static const List<BoxShadow> low = [
    BoxShadow(
      color: shadow1Color,
      blurRadius: 1,
    ),
    BoxShadow(
      color: shadow2Low,
      offset: Offset(0, 1),
      blurRadius: 8,
    ),
  ];

  static const List<BoxShadow> medium = [
    BoxShadow(
      color: shadow1Color,
      blurRadius: 1,
    ),
    BoxShadow(
      color: shadow2Medium,
      offset: Offset(0, 4),
      blurRadius: 12,
      spreadRadius: 2,
    ),
  ];

  static const List<BoxShadow> high = [
    BoxShadow(
      color: shadow1Color,
      blurRadius: 1,
    ),
    BoxShadow(
      color: shadow2High,
      offset: Offset(0, 8),
      blurRadius: 16,
      spreadRadius: 8,
    ),
  ];
}
