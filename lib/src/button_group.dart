import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable button group component that displays a row of connected button options.
///
/// The ButtonGroup widget provides a horizontal arrangement of buttons that share borders
/// and appear as a single connected unit. It's commonly used for mutually exclusive options,
/// navigation sections, or view toggles.
///
/// Features:
/// - Supports custom styling for buttons
/// - Optional icons for each button option
/// - Customizable border radius and background color
/// - Maintains consistent spacing and alignment
class ButtonGroup extends StatelessWidget {
  const ButtonGroup({
    super.key,
    required this.options,
    required this.onOptionSelected,
    this.textStyle,
    this.radius = 100,
    this.backgroundColor,
  });

  /// The list of options to display in the button group.
  /// Each option is represented by a [ButtonGroupOption] which includes
  /// a label and an optional icon.
  final List<ButtonGroupOption> options;

  /// Callback function that is called when an option is selected.
  /// The index of the selected option is passed as an argument.
  final void Function(int) onOptionSelected;

  /// Custom text style for the button labels.
  /// If not provided, defaults to [AppFonts.semiBold14] with accent color.
  final TextStyle? textStyle;

  /// The border radius of the button group's outer corners.
  /// Defaults to 100, creating fully rounded corners.
  final double radius;

  /// The background color of the buttons.
  /// If not provided, buttons will use their default background color.
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        border: Border.all(
          color: Colors.grey.shade300,
        ),
      ),
      clipBehavior: Clip.antiAlias,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: List.generate(
          options.length,
          (index) => _buildOption(context, index),
        ).toList(),
      ),
    );
  }

  Widget _buildOption(BuildContext context, int index) {
    final textColor = context.color.accentModerate;
    final option = options[index];
    final isFirst = index == 0;
    final isLast = index == options.length - 1;

    final borderRadius = BorderRadius.horizontal(
      left: isFirst ? Radius.circular(radius) : Radius.zero,
      right: isLast ? Radius.circular(radius) : Radius.zero,
    );

    return InkWell(
      onTap: () => onOptionSelected(index),
      borderRadius: borderRadius,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: borderRadius,
          border: !isFirst
              ? Border(left: BorderSide(color: Colors.grey.shade300))
              : null,
        ),
        child: Row(
          spacing: 8,
          mainAxisSize: MainAxisSize.min,
          children: [
            if (option.icon != null) option.icon!,
            Text(
              option.label,
              style: textStyle ??
                  AppFonts.semiBold14.copyWith(
                    color: textColor,
                  ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Represents a single option within a ButtonGroup.
///
/// Each option consists of a required label and an optional icon that will be
/// displayed within the button group segment.
class ButtonGroupOption {
  const ButtonGroupOption({required this.label, this.icon});

  /// The text label to display for this option.
  final String label;

  /// An optional icon widget to display before the label.
  /// If null, only the label will be shown.
  final Widget? icon;
}
