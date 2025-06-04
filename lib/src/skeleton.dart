import 'package:flutter/material.dart';
import 'package:nucleus_ui/src/shimmer.dart';

/// A customizable skeleton placeholder for loading UI.
///
/// Example usage:
/// ```dart
/// Skeleton(
///   width: 120,
///   height: 16,
///   borderRadius: BorderRadius.circular(4),
/// )
/// ```
class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.baseColor = const Color(0xFFE0E0E0),
    this.highlightColor = const Color(0xFFF5F5F5),
    this.margin,
    this.padding,
  });

  /// The width of the skeleton box.
  final double width;

  /// The height of the skeleton box.
  final double height;

  /// The border radius of the skeleton box.
  final BorderRadius borderRadius;

  /// The base shimmer color.
  final Color baseColor;

  /// The highlight shimmer color.
  final Color highlightColor;

  /// Optional margin around the skeleton.
  final EdgeInsetsGeometry? margin;

  /// Optional padding inside the skeleton.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: Container(
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
