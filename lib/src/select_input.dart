/// A customizable dropdown input component for selecting values from a list.
///
/// The [SelectInput] widget provides a flexible and reusable UI for dropdown inputs
/// with customizable labels, icons, styles, and validation. It supports both enabled
/// and disabled states, and integrates seamlessly with form validation.
///
/// Features:
/// - Customizable width, labels, icons, and styles.
/// - Supports validation, error messages, and initial values.
/// - Integrates with [DropdownMenuFormField] for consistent dropdown behavior.
/// - Handles focus and controller states internally.
///
/// Example usage:
/// ```dart
/// SelectInput<String>(
///   label: 'Select an option',
///   dropdownMenuEntries: [
///     DropdownMenuEntry(value: 'Option 1', label: Text('Option 1')),
///     DropdownMenuEntry(value: 'Option 2', label: Text('Option 2')),
///   ],
///   onSelected: (value) => print('Selected: $value'),
/// )
/// ```
///
/// See also:
/// - [DropdownMenuFormField] for the underlying dropdown implementation.
library;

import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:nucleus_ui/src/dropdown_menu_form_field.dart';

class SelectInput<T> extends StatefulWidget {
  const SelectInput({
    super.key,
    this.width = 400,
    this.label,
    this.selectedLabel,
    this.labelStyle,
    this.disabled = false,
    this.showLabel = false,
    this.icon,
    this.selectedIcon,
    required this.dropdownMenuEntries,
    this.onSelected,
    this.focusNode,
    this.controller,
    this.errorText,
    this.validator,
    this.initialValue,
    this.inputDecorationTheme,
  });

  /// The width of the dropdown input.
  /// Defaults to 400.
  final double width;

  /// The label text displayed when no value is selected.
  final String? label;

  /// The label text displayed when a value is selected.
  /// If null, falls back to [label].
  final String? selectedLabel;

  /// Custom text style for the label.
  final TextStyle? labelStyle;

  /// Whether the dropdown input is disabled.
  /// Defaults to false.
  final bool disabled;

  /// Whether to show the label above the dropdown input.
  /// Defaults to false.
  final bool showLabel;

  /// Custom icon displayed as the trailing icon in the dropdown.
  final Widget? icon;

  /// Custom icon displayed as the trailing icon when a value is selected.
  /// If null, falls back to [icon].
  final Widget? selectedIcon;

  /// The list of dropdown menu entries to display.
  final List<DropdownMenuEntry<T>> dropdownMenuEntries;

  /// Callback function triggered when a value is selected.
  final void Function(T?)? onSelected;

  /// The focus node for managing focus state.
  final FocusNode? focusNode;

  /// The text editing controller for managing the input value.
  final TextEditingController? controller;

  /// The error text displayed below the dropdown input.
  final String? errorText;

  /// Validator function for validating the selected value.
  final String? Function(T?)? validator;

  /// The initial value of the dropdown input.
  final T? initialValue;

  /// Custom input decoration theme for styling the dropdown input.
  final InputDecorationTheme? inputDecorationTheme;

  @override
  State<SelectInput<T>> createState() => _SelectInputState<T>();
}

class _SelectInputState<T> extends State<SelectInput<T>> {
  late final FocusNode focusNode;
  late final TextEditingController controller;

  @override
  void initState() {
    super.initState();
    focusNode = widget.focusNode ?? FocusNode();
    controller = widget.controller ?? TextEditingController();

    // Add listener to update UI when controller value changes
    controller.addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    focusNode.dispose();
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AbsorbPointer(
      absorbing: widget.disabled,
      child: DropdownMenuFormField<T>(
        width: widget.width,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        dropdownMenuEntries: widget.dropdownMenuEntries,
        onSelected: widget.onSelected,
        controller: controller,
        validator: widget.validator,
        focusNode: widget.focusNode,
        initialSelection:
            widget.controller == null ? widget.initialValue : null,
        requestFocusOnTap: true,
        expandedInsets: EdgeInsets.zero,
        trailingIcon:
            widget.icon ?? const Icon(Icons.keyboard_arrow_down, size: 22),
        selectedTrailingIcon: widget.selectedIcon ??
            const Icon(Icons.keyboard_arrow_up, size: 22),
        label: Text(
          controller.text.isNotEmpty
              ? (widget.selectedLabel ?? widget.label ?? '')
              : (widget.label ?? ''),
          style: widget.labelStyle ??
              AppFonts.regular16.copyWith(
                color: widget.disabled
                    ? context.color.grey40
                    : context.color.fgBase,
              ),
        ),
        menuStyle: MenuStyle(
          alignment: Alignment.bottomLeft,
          elevation: const WidgetStatePropertyAll<double>(0),
          fixedSize: WidgetStatePropertyAll(Size.fromWidth(widget.width)),
          backgroundColor: const WidgetStatePropertyAll(Colors.transparent),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
            side: BorderSide(color: context.color.grey50),
          )),
          side: WidgetStatePropertyAll(BorderSide(color: context.color.grey50)),
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
        ),
        inputDecorationTheme: widget.inputDecorationTheme ??
            InputDecorationTheme(
              isDense: true,
              floatingLabelBehavior: widget.showLabel
                  ? FloatingLabelBehavior.auto
                  : FloatingLabelBehavior.never,
              floatingLabelStyle:
                  AppFonts.regular12.copyWith(color: context.color.fgMuted),
              filled: widget.disabled,
              fillColor: widget.disabled
                  ? const Color(0xFFE6E9EB)
                  : Colors.transparent,
              contentPadding: widget.showLabel &&
                      (focusNode.hasPrimaryFocus ||
                          focusNode.hasFocus ||
                          controller.text.isNotEmpty)
                  ? const EdgeInsets.fromLTRB(16, 10, 16, 6)
                  : const EdgeInsets.fromLTRB(16, 8, 16, 8),
              border: CustomOutlineBorder(
                borderSide: BorderSide(
                  width: 1.5,
                  color: widget.disabled
                      ? context.color.borderDisabled
                      : context.color.grey40,
                ),
              ),
              enabledBorder: widget.showLabel
                  ? CustomOutlineBorder(
                      borderSide: BorderSide(
                          width: 1.5,
                          color: widget.disabled
                              ? context.color.borderDisabled
                              : context.color.grey40),
                    )
                  : OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        width: 1.5,
                        color: widget.disabled
                            ? context.color.borderDisabled
                            : context.color.grey40,
                      ),
                    ),
              focusedBorder: widget.showLabel
                  ? CustomOutlineBorder(
                      borderSide: BorderSide(
                      color: context.color.accentModerate,
                      width: 2,
                    ))
                  : OutlineInputBorder(
                      borderRadius: const BorderRadius.all(Radius.circular(8)),
                      borderSide: BorderSide(
                        color: context.color.accentModerate,
                        width: 2,
                      ),
                    ),
              errorBorder: CustomOutlineBorder(
                borderSide: BorderSide(
                  color: context.color.borderError,
                  width: 2,
                ),
              ),
            ),
      ),
    );
  }
}

class CustomOutlineBorder extends UnderlineInputBorder {
  const CustomOutlineBorder({
    super.borderSide,
    super.borderRadius = const BorderRadius.all(Radius.circular(8)),
  });

  @override
  void paint(
    Canvas canvas,
    Rect rect, {
    double? gapStart,
    double gapExtent = 0.0,
    double gapPercentage = 0.0,
    TextDirection? textDirection,
  }) {
    final paint = borderSide.toPaint();
    final outer = borderRadius.toRRect(rect);
    final center = outer.deflate(borderSide.width / 2.0);
    canvas.drawRRect(center, paint);
  }
}
