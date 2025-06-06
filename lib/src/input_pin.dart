import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

/// A customizable PIN code input widget for secure numeric entry.
///
/// The `InputPin` widget provides a series of input fields designed for entering
/// PIN codes, OTP codes, or other short numeric sequences. It supports various
/// customization options including field shapes, colors, animations, and validation.
///
/// The widget is commonly used for:
/// - PIN code authentication
/// - OTP (One-Time Password) verification
/// - Security code entry
/// - Passcode input
///
/// Example usage:
/// ```dart
/// InputPin(
///   length: 6,
///   onCompleted: (pin) {
///     print('PIN entered: $pin');
///   },
///   onChanged: (value) {
///     print('Current input: $value');
///   },
/// )
/// ```
class InputPin extends StatelessWidget {
  /// Creates an `InputPin` widget.
  ///
  /// The [length] parameter determines how many PIN input fields to display.
  /// The [onCompleted] callback is triggered when all fields are filled.
  ///
  /// Most parameters have sensible defaults for common PIN input scenarios.
  const InputPin({
    super.key,
    this.onCompleted,
    this.length = 5,
    this.error = false,
    this.autoFocus = true,
    this.enabled = true,
    this.obscureText = true,
    this.keyboardType = TextInputType.number,
    this.textStyle,
    this.inputFormatters = const [],
    this.enableActiveFill = true,
    this.beforeTextPaste,
    this.animationType = AnimationType.none,
    this.animationDuration = const Duration(milliseconds: 300),
    this.pinTheme,
    this.obscuringWidget,
    this.mainAxisAlignment = MainAxisAlignment.center,
    this.fieldOuterPadding = const EdgeInsets.symmetric(horizontal: 8),
    this.fieldWidth = 48,
    this.activeBorderWidth = 1,
    this.selectedBorderWidth = 2.5,
    this.cursorColor = Colors.transparent,
    this.enablePinAutofill = true,
    this.autoDismissKeyboard = true,
    this.autoFocusOnLoad = true,
    this.validator,
    this.shape = PinCodeFieldShape.circle,
    this.activeBoxShadow,
    this.errorTextMargin = EdgeInsets.zero,
    this.selectedFillColor,
    this.activeFillColor,
    this.inactiveFillColor,
    this.selectedColor,
    this.activeColor,
    this.inactiveColor,
    this.errorBorderColor,
    this.disabledColor,
    this.onSubmitted,
    this.onChanged,
    this.onEditingComplete,
    this.controller,
  });

  /// The number of PIN input fields to display.
  ///
  /// Defaults to 5.
  final int length;

  /// Called when all PIN fields are completed.
  ///
  /// Receives the complete PIN string as a parameter.
  final void Function(String)? onCompleted;

  /// Whether the first field should automatically receive focus.
  ///
  /// Defaults to true.
  final bool autoFocus;

  /// Whether the input should display in an error state.
  ///
  /// When true, applies error styling and colors. Defaults to false.
  final bool error;

  /// Whether the input fields are enabled for interaction.
  ///
  /// When false, the fields appear disabled and cannot be edited. Defaults to true.
  final bool enabled;

  /// Whether the input text should be obscured (hidden).
  ///
  /// When true, displays dots or custom obscuring widgets instead of the actual characters.
  /// Useful for sensitive PIN codes. Defaults to true.
  final bool obscureText;

  /// The type of keyboard to display when the field is focused.
  ///
  /// Defaults to TextInputType.number for numeric input.
  final TextInputType keyboardType;

  /// Custom text style for the input text.
  ///
  /// If not provided, uses the default theme styling.
  final TextStyle? textStyle;

  /// List of input formatters to apply to the text input.
  ///
  /// Defaults to an empty list.
  final List<TextInputFormatter> inputFormatters;

  /// Whether to enable active fill styling.
  ///
  /// When true, applies background fill colors to the input fields. Defaults to true.
  final bool enableActiveFill;

  /// Callback to validate text before pasting.
  ///
  /// Return true to allow the paste operation, false to prevent it.
  final bool Function(String?)? beforeTextPaste;

  /// The type of animation to apply during field transitions.
  ///
  /// Defaults to AnimationType.none.
  final AnimationType animationType;

  /// Duration of the animation effects.
  ///
  /// Defaults to 300 milliseconds.
  final Duration animationDuration;

  /// Custom pin theme configuration.
  ///
  /// If provided, overrides the default styling options.
  final PinTheme? pinTheme;

  /// Custom widget to display when text is obscured.
  ///
  /// If not provided and obscureText is true, uses a small circle icon.
  final Widget? obscuringWidget;

  /// How to align the PIN fields horizontally.
  ///
  /// Defaults to MainAxisAlignment.center.
  final MainAxisAlignment mainAxisAlignment;

  /// Padding around each input field.
  ///
  /// Defaults to horizontal padding of 8 pixels.
  final EdgeInsetsGeometry fieldOuterPadding;

  /// Width of each individual input field.
  ///
  /// Defaults to 48 pixels.
  final double fieldWidth;

  /// Border width when a field is active (focused).
  ///
  /// Defaults to 1.0.
  final double activeBorderWidth;

  /// Border width when a field is selected.
  ///
  /// Defaults to 2.5.
  final double selectedBorderWidth;

  /// Color of the text cursor.
  ///
  /// Defaults to transparent.
  final Color cursorColor;

  /// Whether to enable PIN autofill from system suggestions.
  ///
  /// Defaults to true.
  final bool enablePinAutofill;

  /// Whether to automatically dismiss the keyboard when PIN is completed.
  ///
  /// Defaults to true.
  final bool autoDismissKeyboard;

  /// Whether to automatically focus the first field when the widget loads.
  ///
  /// Defaults to true.
  final bool autoFocusOnLoad;

  /// Validation function for the PIN input.
  ///
  /// Should return null if the input is valid, or an error message string if invalid.
  final String? Function(String?)? validator;

  /// The shape of the input fields.
  ///
  /// Defaults to PinCodeFieldShape.circle.
  final PinCodeFieldShape shape;

  /// Custom box shadow for active fields.
  ///
  /// If not provided, uses a default brand-colored shadow when enabled.
  final List<BoxShadow>? activeBoxShadow;

  /// Margin for error text display.
  ///
  /// Defaults to EdgeInsets.zero.
  final EdgeInsets errorTextMargin;

  /// Fill color for selected fields.
  final Color? selectedFillColor;

  /// Fill color for active (focused) fields.
  final Color? activeFillColor;

  /// Fill color for inactive fields.
  final Color? inactiveFillColor;

  /// Border color for selected fields.
  final Color? selectedColor;

  /// Border color for active (focused) fields.
  final Color? activeColor;

  /// Border color for inactive fields.
  final Color? inactiveColor;

  /// Border color when in error state.
  final Color? errorBorderColor;

  /// Color when the input is disabled.
  final Color? disabledColor;

  /// Called when the user submits the input (e.g., presses done on keyboard).
  final void Function(String)? onSubmitted;

  /// Called whenever the input value changes.
  final void Function(String)? onChanged;

  /// Called when the user finishes editing (e.g., taps outside or presses done).
  final void Function()? onEditingComplete;

  /// Controller for managing the input text programmatically.
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    final errorActiveColor = error ? context.color.fgDanger : null;
    final errorActiveFillColor =
        error ? context.color.fgDanger.withValues(alpha: .1) : null;
    return PinCodeTextField(
      appContext: context,
      controller: controller,
      length: length,
      enabled: enabled,
      autoFocus: autoFocus,
      obscureText: obscureText,
      cursorColor: cursorColor,
      onChanged: onChanged,
      onEditingComplete: onEditingComplete,
      onSubmitted: onSubmitted,
      animationType: animationType,
      mainAxisAlignment: mainAxisAlignment,
      obscuringWidget: obscureText
          ? obscuringWidget ??
              Icon(Icons.circle, size: 6, color: errorActiveColor)
          : null,
      textStyle:
          textStyle ?? AppFonts.regular16.copyWith(color: errorActiveColor),
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      animationDuration: animationDuration,
      enableActiveFill: enableActiveFill,
      beforeTextPaste: beforeTextPaste,
      onCompleted: onCompleted,
      validator: validator,
      errorTextMargin: errorTextMargin,
      pinTheme: PinTheme(
        shape: shape,
        fieldOuterPadding: fieldOuterPadding,
        fieldWidth: fieldWidth,
        activeBorderWidth: activeBorderWidth,
        selectedBorderWidth: selectedBorderWidth,
        activeBoxShadow: enabled
            ? activeBoxShadow ??
                [
                  BoxShadow(
                    color: context.color.brand30,
                    blurRadius: 1,
                    spreadRadius: 5,
                  ),
                ]
            : [],
        inactiveBorderWidth: 1,
        selectedFillColor: selectedFillColor ?? context.color.chipColor,
        activeFillColor:
            errorActiveFillColor ?? activeFillColor ?? context.color.chipColor,
        inactiveFillColor: inactiveFillColor ?? context.color.chipColor,
        selectedColor: selectedColor ?? context.color.brand50,
        activeColor: errorActiveColor ?? activeColor ?? context.color.grey30,
        inactiveColor: inactiveColor ?? context.color.grey30,
        errorBorderColor: errorBorderColor ?? context.color.fgDanger,
        disabledColor: disabledColor ?? context.color.bgDisabled,
      ),
    );
  }
}
