import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable page control widget with dot and bar variants.
///
/// The `PageControl` widget supports displaying page indicators with dot or bar styles.
/// It allows customization of colors, sizes, spacing, and supports both solid and
/// image backgrounds.
///
/// Example usage:
/// ```dart
/// PageControl(
///   total: 5,
///   current: 2,
/// )
///
/// PageControl.bar(
///   total: 5,
///   current: 2,
/// )
/// ```
class PageControl extends StatelessWidget {
  /// Creates a dot-style `PageControl` widget.
  ///
  /// The [total] and [current] parameters are required.
  /// [current] should be 0-indexed.
  const PageControl({
    super.key,
    required this.total,
    required this.current,
    this.activeColor,
    this.inactiveColor,
    this.dotSize = 8,
    this.spacing = 8,
    this.onPageTapped,
  })  : isBarStyle = false,
        barWidth = 32,
        barHeight = 4;

  /// Creates a bar-style `PageControl` widget.
  ///
  /// The [total] and [current] parameters are required.
  /// [current] should be 0-indexed.
  const PageControl.bar({
    super.key,
    required this.total,
    required this.current,
    this.activeColor,
    this.inactiveColor,
    this.barWidth = 32,
    this.barHeight = 4,
    this.spacing = 8,
    this.onPageTapped,
  })  : isBarStyle = true,
        dotSize = 8;

  /// Whether this is a bar-style page control.
  final bool isBarStyle;

  /// The total number of pages.
  final int total;

  /// The current active page (0-indexed).
  final int current;

  /// The color of the active page indicator.
  final Color? activeColor;

  /// The color of the inactive page indicators.
  final Color? inactiveColor;

  /// The size of the dots (only used for dot style).
  final double dotSize;

  /// The width of the bars (only used for bar style).
  final double barWidth;

  /// The height of the bars (only used for bar style).
  final double barHeight;

  /// The spacing between indicators.
  final double spacing;

  /// Callback when a page indicator is tapped.
  final ValueChanged<int>? onPageTapped;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(
        total,
        (index) => _buildIndicator(context, index),
      ),
    );
  }

  /// Builds a single page indicator (dot or bar).
  Widget _buildIndicator(BuildContext context, int index) {
    final isActive = index == current;
    final color = isActive
        ? (activeColor ?? context.color.accentModerate)
        : (inactiveColor ?? context.color.bgMuted);

    Widget indicator;

    if (isBarStyle) {
      indicator = AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: barWidth,
        height: barHeight,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(barHeight / 2),
        ),
      );
    } else {
      indicator = AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: dotSize,
        height: dotSize,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      );
    }

    var result = indicator;

    if (onPageTapped != null) {
      result = GestureDetector(
        onTap: () => onPageTapped!(index),
        child: indicator,
      );
    }

    if (index < total - 1) {
      result = Padding(
        padding: EdgeInsets.only(right: spacing),
        child: result,
      );
    }

    return result;
  }
}
