import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable slider component for selecting a single value from a range.
///
/// The DragSlider widget provides a horizontal slider with customizable appearance
/// including track height, thumb radius, colors, and interactive behavior.
/// It wraps Flutter's built-in Slider with consistent styling options.
class DragSlider extends StatelessWidget {
  const DragSlider({
    super.key,
    required this.value,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0,
    this.max = 100,
    this.thumbRadius = 8,
    this.trackHeight = 4,
    this.divisions,
    this.activeColor,
    this.inactiveColor,
    this.secondaryActiveColor,
    this.thumbColor,
    this.overlayColor,
    this.mouseCursor,
    this.focusNode,
    this.autofocus = false,
    this.allowedInteraction,
    this.padding,
  });

  /// The current value of the slider.
  final double value;

  /// Callback function when the slider value changes.
  final void Function(double)? onChanged;

  /// Callback function when the user starts changing the slider value.
  final void Function(double)? onChangeStart;

  /// Callback function when the user finishes changing the slider value.
  final void Function(double)? onChangeEnd;

  /// The minimum value of the slider range.
  final double min;

  /// The maximum value of the slider range.
  final double max;

  /// The radius of the slider thumb in logical pixels.
  final double thumbRadius;

  /// The height of the slider track in logical pixels.
  final double trackHeight;

  /// The number of discrete divisions on the slider track.
  final int? divisions;

  /// The color of the active portion of the slider track.
  final Color? activeColor;

  /// The color of the inactive portion of the slider track.
  final Color? inactiveColor;

  /// The color of the secondary active track (used for additional visual feedback).
  final Color? secondaryActiveColor;

  /// The color of the slider thumb.
  final Color? thumbColor;

  /// The color of the overlay that appears when the slider is pressed.
  final WidgetStateProperty<Color?>? overlayColor;

  /// The cursor to display when hovering over the slider.
  final MouseCursor? mouseCursor;

  /// The focus node for keyboard navigation.
  final FocusNode? focusNode;

  /// Whether the slider should automatically gain focus when the widget is built.
  final bool autofocus;

  /// The types of interaction allowed for the slider.
  final SliderInteraction? allowedInteraction;

  /// The padding around the slider.
  final EdgeInsetsGeometry? padding;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: trackHeight,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: thumbRadius),
      ),
      child: Slider(
        value: value,
        onChanged: onChanged,
        onChangeStart: onChangeStart,
        onChangeEnd: onChangeEnd,
        min: min,
        max: max,
        divisions: divisions,
        activeColor: activeColor ?? context.color.accentModerate,
        inactiveColor: inactiveColor ?? context.color.accentSubtle,
        secondaryActiveColor: secondaryActiveColor,
        thumbColor: thumbColor,
        overlayColor: overlayColor,
        mouseCursor: mouseCursor,
        focusNode: focusNode,
        autofocus: autofocus,
        allowedInteraction: allowedInteraction,
        padding: padding,
      ),
    );
  }
}

/// A customizable range slider component for selecting a range of values.
///
/// The DragRangeSlider widget provides a horizontal slider with two thumbs
/// for selecting a range between minimum and maximum values. It offers
/// customizable appearance including track height, thumb radius, and colors.
/// It wraps Flutter's built-in RangeSlider with consistent styling options.
class DragRangeSlider extends StatelessWidget {
  const DragRangeSlider({
    super.key,
    required this.values,
    required this.onChanged,
    this.onChangeStart,
    this.onChangeEnd,
    this.min = 0,
    this.max = 100,
    this.thumbRadius = 8,
    this.trackHeight = 4,
    this.divisions,
    this.activeColor,
    this.inactiveColor,
    this.overlayColor,
  });

  /// The current values of the range slider (start and end values).
  final RangeValues values;

  /// Callback function when the slider range values change.
  final void Function(RangeValues)? onChanged;

  /// Callback function when the user starts changing the slider range values.
  final void Function(RangeValues)? onChangeStart;

  /// Callback function when the user finishes changing the slider range values.
  final void Function(RangeValues)? onChangeEnd;

  /// The minimum value of the slider range.
  final double min;

  /// The maximum value of the slider range.
  final double max;

  /// The radius of the slider thumbs in logical pixels.
  final double thumbRadius;

  /// The height of the slider track in logical pixels.
  final double trackHeight;

  /// The number of discrete divisions on the slider track.
  final int? divisions;

  /// The color of the active portion of the slider track (between the two thumbs).
  final Color? activeColor;

  /// The color of the inactive portions of the slider track.
  final Color? inactiveColor;

  /// The color of the overlay that appears when the slider thumbs are pressed.
  final WidgetStateProperty<Color?>? overlayColor;

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        trackHeight: trackHeight,
        thumbShape: RoundSliderThumbShape(enabledThumbRadius: thumbRadius),
      ),
      child: RangeSlider(
        values: values,
        onChanged: onChanged,
        onChangeStart: onChangeStart,
        onChangeEnd: onChangeEnd,
        min: min,
        max: max,
        divisions: divisions,
        activeColor: activeColor ?? context.color.accentModerate,
        inactiveColor: inactiveColor ?? context.color.accentSubtle,
        overlayColor: overlayColor,
      ),
    );
  }
}
