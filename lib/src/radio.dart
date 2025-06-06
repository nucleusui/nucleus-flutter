import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable radio button widget for single selection from multiple options.
///
/// The `RadioButton` widget provides a circular selection indicator with optional
/// label and description text. It's designed to work in groups where only one
/// option can be selected at a time.
///
/// The widget supports various customization options including size, spacing,
/// styling, error states, and read-only mode.
///
/// Example usage:
/// ```dart
/// enum Option { option1, option2, option3 }
/// Option? selectedOption;
///
/// RadioButton<Option>(
///   value: Option.option1,
///   groupValue: selectedOption,
///   onChanged: (value) => setState(() => selectedOption = value),
///   label: 'Option 1',
///   description: 'This is the first option',
/// )
/// ```
class RadioButton<T> extends StatelessWidget {
  /// Creates a `RadioButton` widget.
  ///
  /// The [value] parameter is required and represents the unique value this
  /// radio button holds. When this value equals [groupValue], the radio
  /// button appears selected.
  ///
  /// The [groupValue] represents the currently selected value in the group.
  /// The [onChanged] callback is called when the radio button is tapped.
  const RadioButton({
    super.key,
    required this.value,
    this.groupValue,
    this.onChanged,
    this.label,
    this.labelStyle,
    this.description,
    this.descriptionStyle,
    this.size = 20,
    this.spacing = 12,
    this.readOnly = false,
    this.isError = false,
  });

  /// The value represented by this radio button.
  ///
  /// When this value equals [groupValue], the radio button appears selected.
  final T value;

  /// The currently selected value for the radio button group.
  ///
  /// When this equals [value], this radio button will appear selected.
  /// Can be null if no option is currently selected.
  final T? groupValue;

  /// Called when the radio button is selected.
  ///
  /// The callback receives the [value] of this radio button.
  /// If null, the radio button will be disabled.
  final ValueChanged<T?>? onChanged;

  /// Optional text label to display next to the radio button.
  final String? label;

  /// Custom text style for the label.
  ///
  /// If not provided, defaults to regular 14pt font.
  final TextStyle? labelStyle;

  /// Optional description text displayed below the label.
  final String? description;

  /// Custom text style for the description text.
  ///
  /// If not provided, defaults to regular 12pt font with subtle color.
  final TextStyle? descriptionStyle;

  /// The size of the radio button circle in logical pixels.
  ///
  /// Defaults to 20.0.
  final double size;

  /// The spacing between the radio button and the text content.
  ///
  /// Defaults to 12.0.
  final double spacing;

  /// Whether the radio button is read-only.
  ///
  /// When true, the radio button cannot be interacted with and appears
  /// in a disabled state. Defaults to false.
  final bool readOnly;

  /// Whether the radio button should display in an error state.
  ///
  /// When true, the radio button uses error colors. Defaults to false.
  final bool isError;

  @override
  Widget build(BuildContext context) {
    final selected = value == groupValue || (value is bool && value == true);
    final color = isError
        ? context.color.fgDanger
        : (readOnly || !selected
            ? context.color.grey40
            : context.color.accentModerate);
    return InkWell(
      onTap: readOnly ? null : () => onChanged?.call(value),
      hoverColor: Colors.transparent,
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Row(
        spacing: spacing,
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: size,
            width: size,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                width: selected ? (size / 3) : 1,
                color: selected || isError ? color : context.color.borderMuted,
              ),
            ),
          ),
          if (label != null || description != null)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (label != null)
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
        ],
      ),
    );
  }
}
