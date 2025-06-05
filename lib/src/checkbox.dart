import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable checkbox widget with optional label and description.
///
/// The `CheckTile` widget provides a checkbox with an optional label and
/// description text. It supports various states including checked, unchecked,
/// indeterminate, error, and read-only states.
///
/// Example usage:
/// ```dart
/// CheckTile(
///   value: true,
///   label: 'Accept terms and conditions',
///   description: 'By checking this box, you agree to our terms',
///   onChanged: (value) {
///     // Handle checkbox state change
///   },
/// )
/// ```
class CheckTile extends StatelessWidget {
  /// Creates a `CheckTile` widget.
  ///
  /// The [value] parameter is required and represents the current state of the checkbox.
  /// Use [onChanged] to handle state changes when the checkbox is tapped.
  /// Set [readOnly] to true to disable user interaction.
  const CheckTile({
    super.key,
    required this.value,
    this.label,
    this.labelStyle,
    this.description,
    this.descriptionStyle,
    this.onChanged,
    this.spacing = 12,
    this.size = 15,
    this.scale = 1,
    this.indeterminate = false,
    this.isError = false,
    this.readOnly = false,
    this.activeColor,
    this.borderColor,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
  });

  /// Called when the checkbox state changes.
  ///
  /// If null, the checkbox will be considered disabled and won't respond to input.
  /// When [readOnly] is true, this callback is ignored.
  final void Function(bool?)? onChanged;

  /// The current value of the checkbox.
  ///
  /// Can be `true` (checked), `false` (unchecked), or `null` (indeterminate).
  /// This parameter is required.
  final bool value;

  /// The text label displayed next to the checkbox.
  ///
  /// If provided, the label will be clickable and will toggle the checkbox state.
  final String? label;

  /// The text style for the label.
  ///
  /// If not provided, uses [AppFonts.regular14].
  final TextStyle? labelStyle;

  /// Additional description text displayed below the label.
  ///
  /// Only shown when [label] is also provided.
  final String? description;

  /// The text style for the description text.
  ///
  /// If not provided, uses [AppFonts.regular12].
  final TextStyle? descriptionStyle;

  /// The spacing between the checkbox and the label/description column.
  ///
  /// Defaults to `12`.
  final double spacing;

  /// The size of the checkbox in logical pixels.
  ///
  /// Defaults to `15`.
  final double size;

  /// The scale factor for the checkbox.
  ///
  /// Values greater than 1.0 make the checkbox larger, values less than 1.0 make it smaller.
  /// Defaults to `1`.
  final double scale;

  /// Whether the checkbox is in an indeterminate state.
  ///
  /// When `true`, the checkbox displays a dash instead of a checkmark,
  /// regardless of the [value]. Defaults to `false`.
  final bool indeterminate;

  /// Whether the checkbox is in an error state.
  ///
  /// When `true`, the checkbox displays with error styling (typically red).
  /// Defaults to `false`.
  final bool isError;

  /// Whether the checkbox is read-only.
  ///
  /// When `true`, the checkbox cannot be interacted with and appears disabled.
  /// The [onChanged] callback will be ignored. Defaults to `false`.
  final bool readOnly;

  /// The color of the checkbox when it's checked or indeterminate.
  ///
  /// If not provided, uses theme-based colors depending on the current state.
  final Color? activeColor;

  /// The color of the checkbox border.
  ///
  /// If not provided, uses theme-based colors depending on the current state.
  final Color? borderColor;

  /// The border radius of the checkbox.
  ///
  /// Defaults to `BorderRadius.all(Radius.circular(4))`.
  final BorderRadiusGeometry borderRadius;

  @override
  Widget build(BuildContext context) {
    final color = isError
        ? context.color.fgDanger
        : (readOnly ? context.color.grey40 : context.color.accentModerate);
    return Row(
      spacing: spacing,
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          width: size,
          height: size,
          child: Transform.scale(
            scale: scale,
            child: Checkbox(
              fillColor: WidgetStateProperty.resolveWith<Color?>(
                (Set<WidgetState> states) {
                  if (readOnly) return context.color.grey40;
                  if (!value && !indeterminate) {
                    return Colors.transparent;
                  }
                  return color;
                },
              ),
              value: indeterminate ? null : value,
              tristate: indeterminate,
              onChanged: readOnly ? null : onChanged,
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              activeColor: activeColor ?? color,
              shape: RoundedRectangleBorder(borderRadius: borderRadius),
              side: BorderSide(color: borderColor ?? color),
            ),
          ),
        ),
        if (label != null)
          InkWell(
            onTap: readOnly ? null : () => onChanged?.call(!value),
            hoverColor: Colors.transparent,
            highlightColor: Colors.transparent,
            splashColor: Colors.transparent,
            focusColor: Colors.transparent,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  label!,
                  style: labelStyle ?? AppFonts.regular14.copyWith(height: 1),
                ),
                if (description != null)
                  Text(
                    description!,
                    style: descriptionStyle ??
                        AppFonts.regular12
                            .copyWith(color: context.color.fgSubtle),
                  ),
              ],
            ),
          ),
      ],
    );
  }
}
