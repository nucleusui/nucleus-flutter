import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable progress bar widget with optional labels and alignment.
///
/// The `Progress` widget supports displaying a progress bar with optional
/// primary and secondary labels. It allows customization of colors, height,
/// border radius, and alignment.
///
/// Example usage:
/// ```dart
/// Progress(
///   value: 50,
///   label: 'Progress',
///   secondaryLabel: '50%',
///   color: Colors.blue,
/// )
/// ```
class Progress extends StatelessWidget {
  /// Creates a `Progress` widget.
  ///
  /// The [value] parameter is required and specifies the progress percentage (0-100).
  const Progress({
    super.key,
    required this.value,
    this.label,
    this.secondaryLabel,
    this.backgroundColor,
    this.color,
    this.valueColor,
    this.minHeight = 8,
    this.borderRadius = const BorderRadius.all(Radius.circular(999)),
    this.stopIndicatorColor,
    this.stopIndicatorRadius,
    this.trackGap,
    this.verticalPadding = 24,
    this.alignment = Alignment.bottomLeft,
  });

  /// The progress value as a percentage (0-100).
  final double value;

  /// The primary label displayed alongside the progress bar.
  final String? label;

  /// The secondary label displayed alongside the progress bar.
  final String? secondaryLabel;

  /// The background color of the progress bar.
  final Color? backgroundColor;

  /// The color of the progress indicator.
  final Color? color;

  /// The animation for the progress indicator color.
  final Animation<Color?>? valueColor;

  /// The minimum height of the progress bar.
  final double minHeight;

  /// The border radius of the progress bar.
  final BorderRadiusGeometry? borderRadius;

  /// The color of the stop indicator.
  final Color? stopIndicatorColor;

  /// The radius of the stop indicator.
  final double? stopIndicatorRadius;

  /// The gap between the progress track and the stop indicator.
  final double? trackGap;

  /// The vertical padding around the progress bar.
  final double verticalPadding;

  /// The alignment of the progress bar and labels.
  final AlignmentGeometry alignment;

  @override
  Widget build(BuildContext context) {
    if (alignment == Alignment.center &&
        label != null &&
        secondaryLabel != null) {
      return Row(
        children: [
          Text(
            label!,
            style: AppFonts.bodySm.copyWith(
              color: context.color.fgColorReverse,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: _buildProgress(context)),
          const SizedBox(width: 8),
          Text(
            secondaryLabel!,
            style: AppFonts.bodySm.copyWith(
              color: context.color.fgColorReverse,
            ),
          ),
        ],
      );
    }

    if (alignment == Alignment.centerLeft && label != null) {
      return Row(
        children: [
          Text(
            label!,
            style: AppFonts.bodySm.copyWith(
              color: context.color.fgColorReverse,
            ),
          ),
          const SizedBox(width: 8),
          Expanded(child: _buildProgress(context)),
        ],
      );
    }

    if (alignment == Alignment.centerRight && label != null) {
      return Row(
        children: [
          Expanded(child: _buildProgress(context)),
          const SizedBox(width: 8),
          Text(
            label!,
            style: AppFonts.bodySm.copyWith(
              color: context.color.fgColorReverse,
            ),
          ),
        ],
      );
    }

    return Stack(
      alignment: alignment,
      children: [
        _buildProgress(context),
        if (label != null) _buildLabel(context),
      ],
    );
  }

  /// Builds the label row with optional primary and secondary labels.
  Row _buildLabel(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          label!,
          style: AppFonts.bodySm.copyWith(
            color: context.color.fgColorReverse,
          ),
        ),
        if (secondaryLabel != null) ...[
          const Spacer(),
          Text(
            secondaryLabel!,
            style: AppFonts.bodySm.copyWith(
              color: context.color.fgColorReverse,
            ),
          ),
        ],
      ],
    );
  }

  /// Builds the progress bar with the specified properties.
  Padding _buildProgress(BuildContext context) {
    return Padding(
      padding: label == null
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(vertical: verticalPadding),
      child: LinearProgressIndicator(
        value: value / 100,
        backgroundColor: backgroundColor ?? context.color.bgMuted,
        color: color ?? context.color.accentModerate,
        minHeight: minHeight,
        borderRadius: borderRadius,
        stopIndicatorColor: stopIndicatorColor,
        stopIndicatorRadius: stopIndicatorRadius,
        trackGap: trackGap,
      ),
    );
  }
}
