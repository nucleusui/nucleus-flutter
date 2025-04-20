import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable text field component that supports various styles, states, and input types.
///
/// The InputField widget provides consistent styling and behavior options for
/// text input across the application. It handles different states including focus,
/// error, and disabled states, alongside support for password visibility toggling,
/// prefix/suffix icons, and input validation.
class InputField extends StatefulWidget {
  const InputField({
    super.key,
    this.controller,
    this.isPassword = false,
    this.autofocus = false,
    this.labelText,
    this.hintText,
    this.textInputType,
    this.onSubmitied,
    this.validator,
    this.textInputAction,
    this.suffixIcon,
    this.enabled = true,
    this.maxLength,
    this.autovalidateMode,
    this.prefixIcon,
    this.contentPadding,
    this.fillColor,
    this.border,
    this.borderRadius = const BorderRadius.all(Radius.circular(10)),
    this.height = 48,
    this.minLines,
    this.maxLines,
    this.initialValue,
    this.onChanged,
    this.suffixPadding,
    this.prefixPadding,
    this.focusNode,
  });

  /// Controller for the text field input.
  final TextEditingController? controller;

  /// When true, obscures the text being edited (for password fields).
  final bool isPassword;

  /// When true, the text field will be focused when the widget is first created.
  final bool autofocus;

  /// Text displayed as a floating label above the text field when focused or filled.
  final String? labelText;

  /// Placeholder text displayed when the text field is empty.
  final String? hintText;

  /// The type of keyboard to use for editing the text (e.g., email, number, phone).
  final TextInputType? textInputType;

  /// Callback function when the user submits the text field (e.g., presses done/next).
  final ValueChanged<String>? onSubmitied;

  /// Function that validates the text and returns an error message string if invalid.
  final String? Function(String?)? validator;

  /// Determines the action button on the keyboard (e.g., next, done, search).
  final TextInputAction? textInputAction;

  /// Widget displayed at the end of the text field, typically for action buttons.
  final Widget? suffixIcon;

  /// Controls whether the text field is interactive or grayed out.
  final bool? enabled;

  /// Maximum number of characters allowed in the text field.
  final int? maxLength;

  /// Determines when validation should be performed (e.g., on user interaction, always).
  final AutovalidateMode? autovalidateMode;

  /// Widget displayed at the start of the text field, typically for icons.
  final Widget? prefixIcon;

  /// Custom padding for the content inside the text field.
  final EdgeInsetsGeometry? contentPadding;

  /// Background color of the text field.
  final Color? fillColor;

  /// Custom border for the text field. Overrides the default border.
  final BoxBorder? border;

  /// Corner radius for the text field borders.
  final BorderRadiusGeometry borderRadius;

  /// Height of the text field container.
  final double? height;

  /// Minimum number of lines to show (for multiline text fields).
  final int? minLines;

  /// Maximum number of lines to show (for multiline text fields).
  final int? maxLines;

  /// Default text to display when the text field is first created.
  final String? initialValue;

  /// Callback function when the text value changes.
  final void Function(String)? onChanged;

  /// Custom padding for the suffix icon.
  final EdgeInsetsGeometry? suffixPadding;

  /// Custom padding for the prefix icon.
  final EdgeInsetsGeometry? prefixPadding;

  /// Focus node that controls the focus state of this text field.
  final FocusNode? focusNode;

  @override
  State<InputField> createState() => _InputFieldStates();
}

class _InputFieldStates extends State<InputField> {
  String errorText = '';
  bool isFocus = false;
  bool isError = false;
  bool hidePass = false;
  bool isFirst = true;
  void Function(dynamic)? checkError;
  TextEditingController? controller;
  FocusNode? focusNode;

  @override
  void initState() {
    super.initState();
    controller = widget.controller ?? TextEditingController();
    focusNode = widget.focusNode ?? FocusNode();
    hidePass = widget.isPassword;
    isFocus = widget.autofocus;

    focusNode?.addListener(() {
      if (!isFirst) checkError!(controller?.text);
      isFirst = false;
      setState(() => isFocus = focusNode?.hasFocus ?? false);
    });
    checkError = (value) {
      if (widget.validator != null) {
        if (widget.validator!(value.toString())?.isNotEmpty ?? false) {
          isError = true;
          errorText = widget.validator!(value.toString()).toString();
        } else {
          isError = false;
          errorText = widget.validator!(value.toString()).toString();
        }
      }
    };
  }

  @override
  void dispose() {
    if (widget.controller == null) controller?.dispose();
    if (widget.focusNode == null) focusNode?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDisabled = widget.enabled == false;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          alignment: Alignment.center,
          height: widget.height,
          padding: EdgeInsets.all(isFocus || isError ? 0 : 1),
          decoration: BoxDecoration(
            color: isDisabled
                ? context.color.borderMuted
                : isError
                    ? context.color.red10
                    : (widget.fillColor ?? context.color.bgColor),
            borderRadius: widget.borderRadius,
            border: isDisabled
                ? null
                : widget.border ??
                    Border.all(
                      width: isFocus || isError ? 2 : 1,
                      color: isError
                          ? Colors.red
                          : isFocus
                              ? context.color.accentBold
                              : context.color.grey20,
                    ),
            boxShadow: [
              if (isFocus && widget.border == null)
                BoxShadow(
                  color: context.color.accentMuted,
                  blurRadius: 1,
                  spreadRadius: 5,
                ),
            ],
          ),
          child: ClipRRect(
            borderRadius: widget.borderRadius,
            child: TextFormField(
              key: widget.key,
              initialValue: widget.initialValue,
              minLines: widget.minLines,
              maxLines: hidePass ? 1 : widget.maxLines,
              focusNode: focusNode,
              onTap: () {
                FocusManager.instance.primaryFocus?.requestFocus();
                setState(() => isFocus = true);
              },
              onTapOutside: (event) {
                setState(() => isFocus = false);
                FocusManager.instance.primaryFocus?.unfocus();
              },
              autofocus: widget.autofocus,
              controller: controller,
              obscureText: hidePass,
              keyboardType: widget.textInputType ?? TextInputType.text,
              onFieldSubmitted: (value) {
                setState(() => isFocus = false);
                FocusManager.instance.primaryFocus?.unfocus();
                widget.onSubmitied?.call(value);
              },
              enabled: widget.enabled,
              maxLength: widget.maxLength,
              onChanged: widget.onChanged ??
                  (widget.autovalidateMode != AutovalidateMode.disabled
                      ? checkError
                      : null),
              autovalidateMode:
                  widget.autovalidateMode ?? AutovalidateMode.onUserInteraction,
              textInputAction: widget.textInputAction ?? TextInputAction.next,
              style: AppFonts.bodyMd,
              cursorColor: context.color.fgBase,
              cursorHeight: widget.labelText == null ? 18 : 16,
              decoration: InputDecoration(
                isDense: true,
                contentPadding: widget.contentPadding ??
                    EdgeInsets.fromLTRB(
                      16,
                      (widget.labelText == null ? 7 : 0) + (kIsWeb ? 5 : 0),
                      16,
                      widget.labelText == null ? 10 : 7,
                    ),
                border: InputBorder.none,
                focusedBorder: InputBorder.none,
                enabledBorder: InputBorder.none,
                errorBorder: InputBorder.none,
                focusedErrorBorder: InputBorder.none,
                disabledBorder: InputBorder.none,
                floatingLabelStyle: AppFonts.bodyMd.copyWith(
                  color: context.color.grey50,
                ),
                counterText: '',
                label: widget.labelText == null
                    ? null
                    : Container(
                        transform: Matrix4.translationValues(
                            0,
                            isFocus || (controller?.text ?? '').isNotEmpty
                                ? (kIsWeb ? 7 : 8)
                                : (kIsWeb ? 1 : -1),
                            0),
                        child: Text(
                          widget.labelText!,
                          style: AppFonts.bodyMd.copyWith(
                            color: context.color.grey50,
                          ),
                        ),
                      ),
                prefixIcon: widget.prefixIcon == null
                    ? null
                    : Padding(
                        padding: widget.prefixPadding ??
                            const EdgeInsets.only(left: 16, right: 12),
                        child: widget.prefixIcon,
                      ),
                hintText: widget.hintText,
                hintStyle: AppFonts.bodyMd.copyWith(
                  color: context.color.grey50,
                ),
                prefixIconConstraints: const BoxConstraints(),
                suffixIconConstraints: const BoxConstraints(),
                suffixIcon: widget.suffixIcon == null
                    ? null
                    : Padding(
                        padding: widget.suffixPadding ??
                            const EdgeInsets.only(left: 12, right: 16),
                        child: widget.suffixIcon,
                      ),
              ),
            ),
          ),
        ),
        Visibility(
          visible: isError,
          child: Padding(
            padding: const EdgeInsets.only(top: 5),
            child: Text(
              errorText,
              style: AppFonts.bodyXs.copyWith(
                color: context.color.fgError,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
