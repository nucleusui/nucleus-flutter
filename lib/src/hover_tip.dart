import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/package/tooltip/tooltip.dart';

class HoverTip extends StatelessWidget {
  const HoverTip({
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

  final String? message;
  final Widget child;
  final Widget? content;
  final void Function()? onDismiss;
  final void Function()? onShow;
  final TooltipController? controller;
  final bool isModal;
  final Duration? waitDuration;
  final Duration? showDuration;
  final TooltipTriggerMode? triggerMode;
  final bool barrierDismissible;
  final Color barrierColor;
  final Widget Function(BuildContext, Animation<double>, void Function())?
      barrierBuilder;
  final bool? enableFeedback;
  final Duration? hoverShowDuration;
  final Duration fadeInDuration;
  final Duration fadeOutDuration;
  final AxisDirection direction;
  final Curve curve;
  final Curve reverseCurve;
  final EdgeInsetsGeometry margin;
  final double offset;
  final double elevation;
  final BorderRadiusGeometry borderRadius;
  final double tailLength;
  final double tailBaseWidth;
  final Path Function(Offset, Offset, Offset) tailBuilder;
  final Widget Function(BuildContext, Animation<double>, Widget?)
      animatedTransitionBuilder;
  final Color? backgroundColor;
  final TextDirection textDirection;
  final Shadow? shadow;
  final bool showWhenUnlinked;
  final ScrollController? scrollController;
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
                  AppFonts.bodySm.copyWith(
                    color: context.color.fgBaseReverse,
                  ),
            ),
          ),
      child: child,
    );
  }
}
