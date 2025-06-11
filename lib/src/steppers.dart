import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/src/grayscale_filter.dart';
import 'package:nucleus_ui/src/nosplash_inkwell.dart';

/// A customizable stepper component for incrementing and decrementing numeric values.
///
/// The Steppers widget provides a flexible UI for numeric input with customizable
/// add/remove buttons, value constraints, and various styling options.
/// It includes multiple static constructors for common stepper styles.
class Steppers extends StatelessWidget {
  const Steppers({
    super.key,
    this.value = 0,
    this.min = 0,
    this.max,
    this.onAdd,
    this.onRemove,
    this.widgetAdd,
    this.widgetRemove,
    this.width = 40,
    this.height,
    this.spacing = 8,
    this.style,
    this.isMinimal = false,
    this.disabled = false,
  }) : assert(max == null || max > min,
            'Max value must be greater than min value or null');

  /// The current numeric value displayed in the stepper.
  final int value;

  /// The minimum value that can be set. Value cannot go below this number.
  final int min;

  /// The maximum value that can be set. If null, there is no upper limit.
  final int? max;

  /// Callback function when the add button is pressed to increment the value.
  final void Function()? onAdd;

  /// Callback function when the remove button is pressed to decrement the value.
  final void Function()? onRemove;

  /// Custom widget to display as the add button. If null, uses default add icon.
  final Widget? widgetAdd;

  /// Custom widget to display as the remove button. If null, uses default remove icon.
  final Widget? widgetRemove;

  /// The width allocated for displaying the numeric value.
  final double width;

  /// The height of the stepper component.
  final double? height;

  /// The spacing between the remove button, value display, and add button.
  final double spacing;

  /// Custom text style for the displayed value.
  final TextStyle? style;

  /// Whether to use minimal style with a vertical divider instead of value display.
  final bool isMinimal;

  /// Whether the stepper is disabled and cannot be interacted with.
  final bool disabled;

  /// Creates an outline stepper with a border and optional background color.
  ///
  /// The outline variant provides a contained stepper with customizable padding,
  /// border, and border radius. When disabled, it shows a gray background.
  /// See [Steppers] constructor for detailed parameter documentation.
  static Widget outline({
    int value = 0,
    int min = 0,
    int? max,
    void Function()? onAdd,
    void Function()? onRemove,
    double? height,
    double width = 40,
    Widget? widgetAdd,
    Widget? widgetRemove,
    BoxBorder? border,
    double spacing = 8,
    EdgeInsetsGeometry? padding = const EdgeInsets.fromLTRB(8, 5, 8, 5),
    BorderRadiusGeometry? borderRadius =
        const BorderRadius.all(Radius.circular(100)),
    TextStyle? style,
    bool disabled = false,
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: disabled ? const Color(0xFFE6E9EB) : null,
        border: border ?? Border.all(color: const Color(0xFFE6E9EB)),
        borderRadius: borderRadius,
      ),
      child: Steppers(
        value: value,
        min: min,
        max: max,
        onAdd: onAdd,
        onRemove: onRemove,
        widgetAdd: widgetAdd,
        widgetRemove: widgetRemove,
        width: width,
        height: height,
        spacing: spacing,
        style: style,
        disabled: disabled,
      ),
    );
  }

  /// Creates a stepper with round circular buttons for add and remove actions.
  ///
  /// The round button variant uses circular avatar buttons with accent colors.
  /// It automatically applies grayscale filter when disabled.
  /// See [Steppers] constructor for detailed parameter documentation.
  static Widget roundButton({
    int value = 0,
    int min = 0,
    int? max,
    void Function()? onAdd,
    void Function()? onRemove,
    double? height,
    double width = 40,
    Widget? widgetAdd,
    Widget? widgetRemove,
    double spacing = 8,
    TextStyle? style,
    bool disabled = false,
  }) {
    return GreyscaleFilter(
      isGrayscale: disabled,
      child: Steppers(
        value: value,
        min: min,
        max: max,
        onAdd: onAdd,
        onRemove: onRemove,
        height: height,
        width: width,
        spacing: spacing,
        style: style,
        disabled: disabled,
        widgetAdd: widgetAdd ??
            const CircleAvatar(
              radius: 10,
              backgroundColor: Color(0xFF846AFB),
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 15,
              ),
            ),
        widgetRemove: widgetAdd ??
            const CircleAvatar(
              radius: 10,
              backgroundColor: Color(0xFF846AFB),
              child: Icon(
                Icons.remove,
                color: Colors.white,
                size: 15,
              ),
            ),
      ),
    );
  }

  /// Creates an outlined stepper with round circular buttons and container styling.
  ///
  /// Combines the outline container style with round button controls.
  /// Uses lighter accent colors for the buttons compared to [roundButton].
  /// See [Steppers] constructor for detailed parameter documentation.
  static Widget outlineRoundButton({
    int value = 0,
    int min = 0,
    int? max,
    void Function()? onAdd,
    void Function()? onRemove,
    double width = 40,
    double? height,
    Widget? widgetAdd,
    Widget? widgetRemove,
    BoxBorder? border,
    double spacing = 8,
    EdgeInsetsGeometry? padding = const EdgeInsets.all(8),
    BorderRadiusGeometry? borderRadius =
        const BorderRadius.all(Radius.circular(100)),
    TextStyle? style,
    bool disabled = false,
  }) {
    return GreyscaleFilter(
      isGrayscale: disabled,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          color: disabled ? const Color(0xFFE6E9EB) : null,
          border: border ?? Border.all(color: const Color(0xFFE6E9EB)),
          borderRadius: borderRadius,
        ),
        child: Steppers(
          value: value,
          min: min,
          max: max,
          onAdd: onAdd,
          onRemove: onRemove,
          height: height,
          width: width,
          spacing: spacing,
          style: style,
          disabled: disabled,
          widgetAdd: widgetAdd ??
              const CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xFFDDD6FF),
                child: Icon(
                  Icons.add,
                  color: Color(0xFF846AFB),
                  size: 15,
                ),
              ),
          widgetRemove: widgetAdd ??
              const CircleAvatar(
                radius: 10,
                backgroundColor: Color(0xFFDDD6FF),
                child: Icon(
                  Icons.remove,
                  color: Color(0xFF846AFB),
                  size: 15,
                ),
              ),
        ),
      ),
    );
  }

  /// Creates a minimal stepper with compact styling and accent background.
  ///
  /// The minimal variant uses a compact design with vertical divider instead
  /// of displaying the numeric value, making it suitable for space-constrained UIs.
  /// See [Steppers] constructor for detailed parameter documentation.
  static Widget minimal({
    int value = 0,
    int min = 0,
    int? max,
    void Function()? onAdd,
    void Function()? onRemove,
    double height = 32,
    double width = 40,
    Widget? widgetAdd,
    Widget? widgetRemove,
    BoxBorder? border,
    double spacing = 0,
    EdgeInsetsGeometry? padding = const EdgeInsets.symmetric(horizontal: 8),
    BorderRadiusGeometry? borderRadius =
        const BorderRadius.all(Radius.circular(100)),
    TextStyle? style,
    bool disabled = false,
  }) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
        color: disabled ? const Color(0xFFE6E9EB) : const Color(0xFFDDD6FF),
        border: border ?? Border.all(color: const Color(0xFFE6E9EB)),
        borderRadius: borderRadius,
      ),
      child: Steppers(
        height: height,
        value: value,
        min: min,
        max: max,
        onAdd: onAdd,
        onRemove: onRemove,
        widgetAdd: widgetAdd,
        widgetRemove: widgetRemove,
        width: width,
        spacing: spacing,
        style: style,
        isMinimal: true,
        disabled: disabled,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final disableAdd = max != null && value >= (max ?? 1);
    final disableRemove = value <= min;
    return SizedBox(
      height: height,
      child: Row(
        spacing: spacing,
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          GreyscaleFilter(
            isGrayscale: disabled || disableRemove,
            child: NoSplashInkWell(
              onTap: disableRemove ? null : onRemove,
              child: widgetRemove ??
                  Icon(
                    Icons.remove,
                    size: 20,
                    color: disabled
                        ? const Color(0xFFC1C4C6)
                        : context.color.accentModerate,
                  ),
            ),
          ),
          Visibility(
            visible: isMinimal,
            replacement: SizedBox(
              width: width,
              child: Text(
                '$value',
                textAlign: TextAlign.center,
                style: style ??
                    AppFonts.medium14.copyWith(
                        color: disabled ? const Color(0xFFC1C4C6) : null),
              ),
            ),
            child: const VerticalDivider(),
          ),
          GreyscaleFilter(
            isGrayscale: disableAdd,
            child: NoSplashInkWell(
              onTap: disabled || disableAdd ? null : onAdd,
              child: widgetAdd ??
                  Icon(
                    Icons.add,
                    size: 20,
                    color: disabled
                        ? const Color(0xFFC1C4C6)
                        : context.color.accentModerate,
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
