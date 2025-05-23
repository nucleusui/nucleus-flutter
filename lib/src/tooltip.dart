import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/package/tooltip/tooltip.dart';

/// A customizable tooltip widget that can display messages or custom content.
///
/// The `QuickTip` widget provides a flexible way to show tooltips with various
/// customization options including animation, positioning, and appearance.
///
/// Example usage:
/// ```dart
/// QuickTip(
///   message: 'Hello world!',
///   child: Icon(Icons.info_outline),
/// )
/// ```
class QuickTip extends StatelessWidget {
  /// Creates a `QuickTip` widget.
  ///
  /// The [child] parameter is required and represents the widget that triggers the tooltip.
  /// The tooltip can display either a [message] or custom [content].
  const QuickTip({
    super.key,
    required this.child,
    this.message,
    this.content,
    this.onDismiss,
    this.onShow,
    this.controller,
    this.isModal = false,
    this.waitDuration,
    this.showDuration,
    this.triggerMode,
    this.barrierDismissible = true,
    this.barrierColor = Colors.transparent,
    this.barrierBuilder,
    this.enableFeedback,
    this.hoverShowDuration,
    this.fadeInDuration = const Duration(milliseconds: 150),
    this.fadeOutDuration = const Duration(milliseconds: 75),
    this.direction = AxisDirection.up,
    this.curve = Curves.easeInOut,
    this.reverseCurve = Curves.easeInOut,
    this.margin = const EdgeInsets.all(8),
    this.offset = 4,
    this.elevation = 4,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
    this.tailLength = 8,
    this.tailBaseWidth = 12,
    this.tailBuilder = HoverInterface.defaultTailBuilder,
    this.animatedTransitionBuilder =
        HoverInterface.defaultAnimatedTransitionBuilder,
    this.backgroundColor,
    this.textDirection = TextDirection.ltr,
    this.shadow,
    this.showWhenUnlinked = false,
    this.scrollController,
    this.textStyle,
  });

  /// The message to display in the tooltip. Ignored if [content] is provided.
  final String? message;

  /// The widget that triggers the tooltip when interacted with.
  final Widget child;

  /// Custom content widget to display in the tooltip instead of [message].
  final Widget? content;

  /// Callback function called when the tooltip is dismissed.
  final void Function()? onDismiss;

  /// Callback function called when the tooltip is shown.
  final void Function()? onShow;

  /// Controller to programmatically show/hide the tooltip.
  final TooltipController? controller;

  /// Whether the tooltip should be displayed as a modal overlay.
  final bool isModal;

  /// Duration to wait before showing the tooltip.
  final Duration? waitDuration;

  /// Duration for which the tooltip remains visible.
  final Duration? showDuration;

  /// Determines how the tooltip is triggered (tap, long press, or hover).
  final TooltipTriggerMode? triggerMode;

  /// Whether clicking outside the tooltip dismisses it.
  final bool barrierDismissible;

  /// Color of the modal barrier when [isModal] is true.
  final Color barrierColor;

  /// Custom builder for the modal barrier.
  final Widget Function(BuildContext, Animation<double>, void Function())?
      barrierBuilder;

  /// Whether to provide haptic feedback when showing the tooltip.
  final bool? enableFeedback;

  /// Duration before showing the tooltip on hover.
  final Duration? hoverShowDuration;

  /// Duration of the fade-in animation.
  final Duration fadeInDuration;

  /// Duration of the fade-out animation.
  final Duration fadeOutDuration;

  /// The preferred direction for the tooltip to appear.
  final AxisDirection direction;

  /// The curve for the show animation.
  final Curve curve;

  /// The curve for the hide animation.
  final Curve reverseCurve;

  /// The margin around the tooltip content.
  final EdgeInsetsGeometry margin;

  /// The offset of the tooltip from the target widget.
  final double offset;

  /// The elevation of the tooltip shadow.
  final double elevation;

  /// The border radius of the tooltip.
  final BorderRadiusGeometry borderRadius;

  /// The length of the tooltip's tail.
  final double tailLength;

  /// The base width of the tooltip's tail.
  final double tailBaseWidth;

  /// Custom builder for the tooltip's tail shape.
  final Path Function(Offset, Offset, Offset) tailBuilder;

  /// Custom builder for the tooltip's transition animation.
  final Widget Function(BuildContext, Animation<double>, Widget?)
      animatedTransitionBuilder;

  /// The background color of the tooltip.
  final Color? backgroundColor;

  /// The text direction for the tooltip content.
  final TextDirection textDirection;

  /// Custom shadow for the tooltip.
  final Shadow? shadow;

  /// Whether to show the tooltip when the target widget is not linked.
  final bool showWhenUnlinked;

  /// ScrollController for scrollable tooltip content.
  final ScrollController? scrollController;

  /// Custom text style for the tooltip message.
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return JustTheTooltip(
      controller: controller,
      onDismiss: onDismiss,
      onShow: onShow,
      isModal: isModal,
      waitDuration: waitDuration,
      showDuration: showDuration,
      triggerMode: triggerMode ?? TooltipTriggerMode.tap,
      barrierDismissible: barrierDismissible,
      barrierColor: barrierColor,
      barrierBuilder: barrierBuilder,
      enableFeedback: enableFeedback,
      hoverShowDuration: hoverShowDuration,
      fadeInDuration: fadeInDuration,
      fadeOutDuration: fadeOutDuration,
      preferredDirection: direction,
      curve: curve,
      reverseCurve: reverseCurve,
      margin: margin,
      offset: tailLength == 0 ? 8 : offset,
      elevation: elevation,
      borderRadius: borderRadius,
      tailLength: tailLength,
      tailBaseWidth: tailBaseWidth,
      tailBuilder: tailBuilder,
      animatedTransitionBuilder: animatedTransitionBuilder,
      backgroundColor: backgroundColor ?? context.color.bgColorReverse,
      textDirection: textDirection,
      shadow: shadow,
      showWhenUnlinked: showWhenUnlinked,
      scrollController: scrollController,
      content: content ??
          Container(
            padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
            decoration: BoxDecoration(
              color: backgroundColor ?? context.color.bgColorReverse,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Text(
              message ?? '',
              style: textStyle ??
                  AppFonts.regular14.copyWith(
                    color: context.color.fgBaseReverse,
                  ),
            ),
          ),
      child: child,
    );
  }
}
