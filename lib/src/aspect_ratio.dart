import 'package:flutter/material.dart';

/// A widget that maintains a specific aspect ratio for its child.
///
/// The `RatioBox` widget ensures that its child maintains a specific width-to-height ratio,
/// regardless of the available space. This is useful for creating responsive UI elements
/// that need to maintain specific proportions.
///
/// Example usage:
/// ```dart
/// RatioBox(
///   ratio: 16 / 9,
///   child: Image.network('https://picsum.photos/1024'),
/// )
/// ```
class RatioBox extends StatelessWidget {
  /// Creates an `RatioBox` widget.
  ///
  /// The [ratio] parameter is required and specifies the desired aspect ratio (width / height).
  /// The [child] parameter is required and specifies the widget to be sized.
  const RatioBox({
    super.key,
    required this.ratio,
    required this.child,
    this.clipBehavior = Clip.none,
    this.borderRadius,
  });

  /// The aspect ratio to enforce.
  ///
  /// The aspect ratio is expressed as a ratio of width to height. For example,
  /// a 16:9 aspect ratio would be expressed as `16 / 9`.
  final double ratio;

  /// The widget to size according to the specified aspect ratio.
  final Widget child;

  /// How to clip the child.
  ///
  /// Defaults to [Clip.none].
  final Clip clipBehavior;

  /// The border radius to apply to the widget.
  ///
  /// This is useful for creating rounded corners or circular shapes.
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      clipBehavior: clipBehavior,
      borderRadius: borderRadius ?? BorderRadius.circular(0),
      child: AspectRatio(
        aspectRatio: ratio,
        child: child,
      ),
    );
  }
}
