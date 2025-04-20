import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:nucleus_ui/package/tooltip/positioned_tooltip.dart';

class AnimatedTooltip extends ImplicitlyAnimatedWidget {
  const AnimatedTooltip({
    super.key,
    required this.child,
    required this.margin,
    required this.target,
    required this.targetSize,
    required this.offset,
    required this.preferredDirection,
    required this.offsetToTarget,
    required this.borderRadius,
    required this.tailBaseWidth,
    required this.tailLength,
    required this.tailBuilder,
    required this.animatedTransitionBuilder,
    required this.textDirection,
    required this.backgroundColor,
    required this.shadow,
    required this.elevation,
    required this.scrollPosition,
    super.curve = Curves.linear,
    required super.duration,
    super.onEnd,
  });

  final Widget child;

  final EdgeInsetsGeometry margin;

  final Offset target;

  final Size targetSize;

  final double offset;

  final AxisDirection preferredDirection;

  final Offset offsetToTarget;

  final BorderRadiusGeometry borderRadius;

  final double tailBaseWidth;

  final double tailLength;

  final TailBuilder tailBuilder;

  final AnimatedTransitionBuilder animatedTransitionBuilder;

  final TextDirection textDirection;

  final Color backgroundColor;

  final Shadow shadow;

  final double elevation;

  final ScrollPosition? scrollPosition;

  @override
  ImplicitlyAnimatedWidgetState<ImplicitlyAnimatedWidget> createState() =>
      _AnimatedTooltipState();

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty<EdgeInsetsGeometry>('margin', margin))
      ..add(DiagnosticsProperty<Offset>('target', target))
      ..add(DiagnosticsProperty<Size>('targetSize', targetSize))
      ..add(DoubleProperty('offset', offset))
      ..add(
        DiagnosticsProperty<AxisDirection>(
          'preferredDirection',
          preferredDirection,
        ),
      )
      ..add(DiagnosticsProperty<Offset>('offsetToTarget', offsetToTarget))
      ..add(
        DiagnosticsProperty<BorderRadiusGeometry>('borderRadius', borderRadius),
      )
      ..add(DoubleProperty('tailBaseWidth', tailBaseWidth))
      ..add(DoubleProperty('tailLength', tailLength))
      ..add(
        DiagnosticsProperty<AnimatedTransitionBuilder>(
          'animatedTransitionBuilder',
          animatedTransitionBuilder,
        ),
      )
      ..add(
        DiagnosticsProperty<TextDirection>('textDirection', textDirection),
      )
      ..add(ColorProperty('backgroundColor', backgroundColor))
      ..add(DiagnosticsProperty<Shadow>('shadow', shadow))
      ..add(DoubleProperty('elevation', elevation))
      ..add(
        DiagnosticsProperty<ScrollPosition>('scrollPosition', scrollPosition),
      )
      ..add(ObjectFlagProperty<TailBuilder>.has('tailBuilder', tailBuilder));
  }
}

class _AnimatedTooltipState
    extends ImplicitlyAnimatedWidgetState<AnimatedTooltip> {
  EdgeInsetsGeometryTween? _margin;
  SizeTween? _targetSize;
  Tween<Offset>? _target;
  Tween<double>? _offset;
  Tween<Offset>? _offsetToTarget;
  BorderRadiusTween? _borderRadius;
  Tween<double>? _tailBaseWidth;
  Tween<double>? _tailLength;
  ColorTween? _backgroundColor;
  Tween<double>? _elevation;

  @override
  void forEachTween(TweenVisitor<dynamic> visitor) {
    _margin = visitor(
      _margin,
      widget.margin,
      (dynamic value) => EdgeInsetsGeometryTween(begin: value as EdgeInsets),
    ) as EdgeInsetsGeometryTween?;
    _targetSize = visitor(
      _targetSize,
      widget.targetSize,
      (dynamic value) => SizeTween(begin: value as Size),
    ) as SizeTween?;
    _target = visitor(
      _target,
      widget.target,
      (dynamic value) => Tween<Offset>(begin: value as Offset),
    ) as Tween<Offset>?;
    _offset = visitor(
      _offset,
      widget.offset,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>?;
    _offsetToTarget = visitor(
      _offsetToTarget,
      widget.offsetToTarget,
      (dynamic value) => Tween<Offset>(begin: value as Offset),
    ) as Tween<Offset>?;
    _borderRadius = visitor(
      _borderRadius,
      widget.borderRadius,
      (dynamic value) => BorderRadiusTween(begin: value as BorderRadius),
    ) as BorderRadiusTween?;
    _tailBaseWidth = visitor(
      _tailBaseWidth,
      widget.tailBaseWidth,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>?;
    _tailLength = visitor(
      _tailLength,
      widget.tailLength,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>?;
    _backgroundColor = visitor(
      _backgroundColor,
      widget.backgroundColor,
      (dynamic value) => ColorTween(begin: value as Color),
    ) as ColorTween?;
    _elevation = visitor(
      _elevation,
      widget.elevation,
      (dynamic value) => Tween<double>(begin: value as double),
    ) as Tween<double>?;
  }

  @override
  Widget build(BuildContext context) {
    return PositionedTooltip(
      margin: _margin?.evaluate(animation) ?? EdgeInsets.zero,
      targetSize: _targetSize?.evaluate(animation) ?? Size.zero,
      target: _target?.evaluate(animation) ?? Offset.zero,
      offset: _offset?.evaluate(animation) ?? 0.0,
      preferredDirection: widget.preferredDirection,
      offsetToTarget: _offsetToTarget?.evaluate(animation) ?? Offset.zero,
      borderRadius: _borderRadius?.evaluate(animation) ?? BorderRadius.zero,
      tailBaseWidth: _tailBaseWidth?.evaluate(animation) ?? 0.0,
      tailLength: _tailLength?.evaluate(animation) ?? 0.0,
      tailBuilder: widget.tailBuilder,
      animatedTransitionBuilder: widget.animatedTransitionBuilder,
      textDirection: widget.textDirection,
      backgroundColor:
          _backgroundColor?.evaluate(animation) ?? Colors.transparent,
      shadow: widget.shadow,
      elevation: _elevation?.evaluate(animation) ?? 0.0,
      scrollPosition: widget.scrollPosition,
      child: widget.child,
    );
  }
}
