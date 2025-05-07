import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable separator (divider) widget with optional labels and styling options.
///
/// The `Separator` widget provides visual division between content with
/// customizable variants, orientations, label positions, and sizes.
///
/// Example usage:
/// ```dart
/// Separator(
///   variant: SeparatorVariant.solid,
///   orientation: Axis.horizontal,
///   label: 'Section',
///   labelPosition: LabelPosition.center,
///   size: SeparatorSize.md,
/// )
/// ```
class Separator extends StatelessWidget {
  /// Creates a `Separator` widget.
  const Separator({
    super.key,
    this.variant = SeparatorVariant.solid,
    this.orientation = Axis.horizontal,
    this.label,
    this.labelPosition = LabelPosition.none,
    this.size = SeparatorSize.md,
    this.color,
    this.thickness,
    this.labelStyle,
    this.dashPattern = const [4, 4],
    this.dotSpacing = 8.0,
    this.dotRadius = 1.0,
    this.padding,
  });

  /// The visual style of the separator.
  final SeparatorVariant variant;

  /// The directional layout of the separator.
  final Axis orientation;

  /// Optional text label to display with the separator.
  final String? label;

  /// Position of the label along the separator.
  final LabelPosition labelPosition;

  /// Size category affecting the width/height of the separator.
  final SeparatorSize size;

  /// Custom color for the separator line.
  final Color? color;

  /// Custom thickness for the separator line.
  final double? thickness;

  /// Custom text style for the label.
  final TextStyle? labelStyle;

  /// Pattern for dashed variant [dashLength, gapLength].
  final List<double> dashPattern;

  /// Spacing between dots for dotted variant.
  final double dotSpacing;

  /// Radius of dots for dotted variant.
  final double dotRadius;

  /// Padding around the entire separator.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    final separatorColor = color ?? context.color.borderMuted;
    final separatorThickness = thickness ?? 1.0;

    // If there's no label, just render the divider line
    if (label == null || labelPosition == LabelPosition.none) {
      return Padding(
        padding: padding ??
            (orientation == Axis.horizontal
                ? const EdgeInsets.symmetric(vertical: 16)
                : const EdgeInsets.symmetric(horizontal: 16)),
        child: _buildSeparatorLine(context, separatorColor, separatorThickness),
      );
    }

    // Define text style for label
    final textStyle =
        labelStyle ?? AppFonts.bold12.copyWith(color: context.color.fgSubtle);

    // For center position, we need dividers on both sides of text
    if (labelPosition == LabelPosition.center) {
      return Padding(
        padding: padding ??
            (orientation == Axis.horizontal
                ? const EdgeInsets.symmetric(vertical: 16)
                : const EdgeInsets.symmetric(horizontal: 16)),
        child: orientation == Axis.horizontal
            ? Row(
                children: [
                  Expanded(
                    child: _buildSeparatorLine(
                      context,
                      separatorColor,
                      separatorThickness,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Text(label!, style: textStyle),
                  ),
                  Expanded(
                    child: _buildSeparatorLine(
                      context,
                      separatorColor,
                      separatorThickness,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Expanded(
                    child: _buildSeparatorLine(
                      context,
                      separatorColor,
                      separatorThickness,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8),
                    child: Text(label!, style: textStyle),
                  ),
                  Expanded(
                    child: _buildSeparatorLine(
                      context,
                      separatorColor,
                      separatorThickness,
                    ),
                  ),
                ],
              ),
      );
    }

    // For leading position, text comes first then divider
    if (labelPosition == LabelPosition.leading) {
      return Padding(
        padding: padding ??
            (orientation == Axis.horizontal
                ? const EdgeInsets.symmetric(vertical: 16)
                : const EdgeInsets.symmetric(horizontal: 16)),
        child: orientation == Axis.horizontal
            ? Row(
                children: [
                  Text(label!, style: textStyle),
                  const SizedBox(width: 8),
                  Expanded(
                    child: _buildSeparatorLine(
                      context,
                      separatorColor,
                      separatorThickness,
                    ),
                  ),
                ],
              )
            : Column(
                children: [
                  Text(label!, style: textStyle),
                  const SizedBox(height: 8),
                  Expanded(
                    child: _buildSeparatorLine(
                      context,
                      separatorColor,
                      separatorThickness,
                    ),
                  ),
                ],
              ),
      );
    }

    // For trailing position, divider comes first then text
    return Padding(
      padding: padding ??
          (orientation == Axis.horizontal
              ? const EdgeInsets.symmetric(vertical: 16)
              : const EdgeInsets.symmetric(horizontal: 16)),
      child: orientation == Axis.horizontal
          ? Row(
              children: [
                Expanded(
                  child: _buildSeparatorLine(
                    context,
                    separatorColor,
                    separatorThickness,
                  ),
                ),
                const SizedBox(width: 8),
                Text(label!, style: textStyle),
              ],
            )
          : Column(
              children: [
                Expanded(
                  child: _buildSeparatorLine(
                    context,
                    separatorColor,
                    separatorThickness,
                  ),
                ),
                const SizedBox(height: 8),
                Text(label!, style: textStyle),
              ],
            ),
    );
  }

  /// Builds the appropriate separator line based on the variant.
  Widget _buildSeparatorLine(
      BuildContext context, Color color, double thickness) {
    switch (variant) {
      case SeparatorVariant.solid:
        return orientation == Axis.horizontal
            ? Divider(
                height: thickness,
                thickness: thickness,
                color: color,
              )
            : VerticalDivider(
                width: thickness,
                thickness: thickness,
                color: color,
              );

      case SeparatorVariant.dashed:
        return CustomPaint(
          painter: DashedLinePainter(
            color: color,
            orientation: orientation,
            dashPattern: dashPattern,
            strokeWidth: thickness,
          ),
          size: orientation == Axis.horizontal
              ? Size.fromHeight(thickness)
              : Size.fromWidth(thickness),
        );

      case SeparatorVariant.dotted:
        return CustomPaint(
          painter: DottedLinePainter(
            color: color,
            orientation: orientation,
            dotSpacing: dotSpacing,
            dotRadius: dotRadius,
          ),
          size: orientation == Axis.horizontal
              // Multiply by 2 for dotted to be visible
              ? Size.fromHeight(thickness * 2)
              : Size.fromWidth(thickness * 2),
        );
    }
  }
}

/// Custom painter for drawing dashed line separators.
class DashedLinePainter extends CustomPainter {
  DashedLinePainter({
    required this.color,
    required this.orientation,
    required this.dashPattern,
    required this.strokeWidth,
  });

  final Color color;
  final Axis orientation;
  final List<double> dashPattern;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final path = Path();

    if (orientation == Axis.horizontal) {
      final dashWidth = dashPattern[0];
      final dashSpace = dashPattern[1];
      double startX = 0;
      final width = size.width;
      final y = size.height / 2;

      while (startX < width) {
        path
          ..moveTo(startX, y)
          ..lineTo(startX + dashWidth, y);
        startX += dashWidth + dashSpace;
      }
    } else {
      final dashHeight = dashPattern[0];
      final dashSpace = dashPattern[1];
      double startY = 0;
      final height = size.height;
      final x = size.width / 2;

      while (startY < height) {
        path
          ..moveTo(x, startY)
          ..lineTo(x, startY + dashHeight);
        startY += dashHeight + dashSpace;
      }
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}

/// Custom painter for drawing dotted line separators.
class DottedLinePainter extends CustomPainter {
  DottedLinePainter({
    required this.color,
    required this.orientation,
    required this.dotSpacing,
    required this.dotRadius,
  });

  final Color color;
  final Axis orientation;
  final double dotSpacing;
  final double dotRadius;

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;

    if (orientation == Axis.horizontal) {
      final width = size.width;
      final y = size.height / 2;
      double startX = 0;

      while (startX < width) {
        canvas.drawCircle(Offset(startX, y), dotRadius, paint);
        startX += dotSpacing;
      }
    } else {
      final height = size.height;
      final x = size.width / 2;
      double startY = 0;

      while (startY < height) {
        canvas.drawCircle(Offset(x, startY), dotRadius, paint);
        startY += dotSpacing;
      }
    }
  }
}

/// Separator variants that control how strong or subtle the divider appears.
enum SeparatorVariant { solid, dashed, dotted }

/// Position options for the optional label of a separator.
enum LabelPosition { none, center, leading, trailing }

/// Size options for the separator.
enum SeparatorSize { md, lg }
