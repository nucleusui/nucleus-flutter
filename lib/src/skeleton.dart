import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/extension/context.dart';
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
    this.baseColor,
    this.highlightColor,
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
  final Color? baseColor;

  /// The highlight shimmer color.
  final Color? highlightColor;

  /// Optional margin around the skeleton.
  final EdgeInsetsGeometry? margin;

  /// Optional padding inside the skeleton.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    // Use theme-aware colors for better dark mode support
    final defaultBaseColor = context.color.brightness == Brightness.dark
        ? context.color.grey80
        : context.color.bgMuted;

    final defaultHighlightColor = context.color.brightness == Brightness.dark
        ? context.color.grey70
        : const Color(0xFFF5F5F5);

    return Shimmer.fromColors(
      baseColor: baseColor ?? defaultBaseColor,
      highlightColor: highlightColor ?? defaultHighlightColor,
      child: Container(
        margin: margin,
        padding: padding,
        width: width,
        height: height,
        decoration: BoxDecoration(
          color: context.color.brightness == Brightness.dark
              ? const Color(0xFF2F3133)
              : Colors.white,
          borderRadius: borderRadius,
        ),
      ),
    );
  }
}
