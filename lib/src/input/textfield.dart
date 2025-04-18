import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

class TextFields extends StatefulWidget {
  const TextFields({
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

  final TextEditingController? controller;
  final bool isPassword;
  final bool autofocus;
  final String? labelText;
  final String? hintText;
  final TextInputType? textInputType;
  final ValueChanged<String>? onSubmitied;
  final String? Function(String?)? validator;
  final TextInputAction? textInputAction;
  final Widget? suffixIcon;
  final bool? enabled;
  final int? maxLength;
  final AutovalidateMode? autovalidateMode;
  final Widget? prefixIcon;
  final EdgeInsetsGeometry? contentPadding;
  final Color? fillColor;
  final BoxBorder? border;
  final BorderRadiusGeometry borderRadius;
  final double? height;
  final int? minLines;
  final int? maxLines;
  final String? initialValue;
  final void Function(String)? onChanged;
  final EdgeInsetsGeometry? suffixPadding;
  final EdgeInsetsGeometry? prefixPadding;
  final FocusNode? focusNode;

  @override
  State<TextFields> createState() => _TextFieldStates();
}

class _TextFieldStates extends State<TextFields> {
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
