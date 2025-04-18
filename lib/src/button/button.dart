import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/corner_radius.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable button component that supports various styles, sizes, and states.
///
/// The Button widget provides consistent styling and behavior options for
/// different button types (primary, secondary, outline, ghost, destructive, social).
/// It handles loading states, disabled states, and various customization options.
class Button extends StatelessWidget {
  const Button({
    super.key,
    this.label,
    this.onTap,
    this.height,
    this.width,
    this.color,
    this.labelColor,
    this.isLoading = false,
    this.labelStyle,
    this.border,
    this.prefixIcon,
    this.suffixIcon,
    this.buttonType = ButtonType.primary,
    this.buttonSize = ButtonSize.medium,
    this.borderRadius,
    this.icon,
    this.padding,
  });

  /// The text to be displayed on the button.
  final String? label;

  /// Custom height for the button. If not provided, uses [buttonSize] height.
  final double? height;

  /// Custom width for the button. If not provided, uses [buttonSize] width.
  final double? width;

  /// Background color of the button. Overrides the default color for the [buttonType].
  final Color? color;

  /// Text color of the button. Overrides the default color for the [buttonType].
  final Color? labelColor;

  /// Callback function when the button is tapped. If null, button appears disabled.
  final VoidCallback? onTap;

  /// When true, displays a loading indicator instead of the button content.
  final bool isLoading;

  /// Custom text style for the button label.
  final TextStyle? labelStyle;

  /// Custom border for the button. Overrides the default border for the [buttonType].
  final BorderSide? border;

  /// Widget to display before the button label.
  final Widget? prefixIcon;

  /// Widget to display after the button label.
  final Widget? suffixIcon;

  /// Defines the type of button (e.g., primary, secondary, outline, etc.).
  final ButtonType buttonType;

  /// Defines the size of the button (e.g., small, medium, large, full).
  final ButtonSize buttonSize;

  /// Custom border radius for the button.
  final BorderRadius? borderRadius;

  /// Icon to display in the button. Overrides label and prefix/suffix icons.
  final Widget? icon;

  /// Custom padding for the button content.
  final EdgeInsetsGeometry? padding;

  /// Creates a primary button with the accent color background.
  ///
  /// Primary buttons are used for high-emphasis actions that are most important in the UI.
  /// See [Button] constructor for detailed parameter documentation.
  static Button primary({
    Key? key,
    String? label,
    double? height,
    double? width,
    Color? color,
    Color? labelColor,
    VoidCallback? onTap,
    bool isLoading = false,
    TextStyle? labelStyle,
    BorderSide? border,
    Widget? prefixIcon,
    Widget? suffixIcon,
    ButtonSize buttonSize = ButtonSize.medium,
    BorderRadius? borderRadius,
    Widget? icon,
    EdgeInsetsGeometry? padding,
  }) {
    return Button(
      key: key,
      label: label,
      height: height,
      width: width,
      color: color,
      labelColor: labelColor,
      onTap: onTap,
      isLoading: isLoading,
      labelStyle: labelStyle,
      border: border,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      buttonSize: icon == null ? buttonSize : ButtonSize.large,
      borderRadius: borderRadius,
      icon: icon,
      padding: padding,
    );
  }

  /// Creates a secondary button with a subtle accent background.
  ///
  /// Secondary buttons are used for medium-emphasis actions, often paired with primary buttons.
  /// See [Button] constructor for detailed parameter documentation.
  static Button secondary({
    Key? key,
    String? label,
    double? height,
    double? width,
    Color? color,
    Color? labelColor,
    VoidCallback? onTap,
    bool isLoading = false,
    TextStyle? labelStyle,
    BorderSide? border,
    Widget? prefixIcon,
    Widget? suffixIcon,
    ButtonSize buttonSize = ButtonSize.medium,
    BorderRadius? borderRadius,
    Widget? icon,
    EdgeInsetsGeometry? padding,
  }) {
    return Button(
      key: key,
      label: label,
      height: height,
      width: width,
      color: color,
      labelColor: labelColor,
      onTap: onTap,
      isLoading: isLoading,
      labelStyle: labelStyle,
      border: border,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      buttonSize: icon == null ? buttonSize : ButtonSize.large,
      borderRadius: borderRadius,
      icon: icon,
      buttonType: ButtonType.secondary,
      padding: padding,
    );
  }

  /// Creates an outline button with a transparent background and accent border.
  ///
  /// Outline buttons are used for actions that need attention but aren't as important as primary actions.
  /// See [Button] constructor for detailed parameter documentation.
  static Button outline({
    Key? key,
    String? label,
    double? height,
    double? width,
    Color? color,
    Color? labelColor,
    VoidCallback? onTap,
    bool isLoading = false,
    TextStyle? labelStyle,
    BorderSide? border,
    Widget? prefixIcon,
    Widget? suffixIcon,
    ButtonSize buttonSize = ButtonSize.medium,
    BorderRadius? borderRadius,
    Widget? icon,
    EdgeInsetsGeometry? padding,
  }) {
    return Button(
      key: key,
      label: label,
      height: height,
      width: width,
      color: color,
      labelColor: labelColor,
      onTap: onTap,
      isLoading: isLoading,
      labelStyle: labelStyle,
      border: border,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      buttonSize: icon == null ? buttonSize : ButtonSize.large,
      borderRadius: borderRadius,
      icon: icon,
      buttonType: ButtonType.outline,
      padding: padding,
    );
  }

  /// Creates a ghost button with a transparent background and no border.
  ///
  /// Ghost buttons are the least prominent and are used for secondary or tertiary actions.
  /// See [Button] constructor for detailed parameter documentation.
  static Button ghost({
    Key? key,
    String? label,
    double? height,
    double? width,
    Color? color,
    Color? labelColor,
    VoidCallback? onTap,
    bool isLoading = false,
    TextStyle? labelStyle,
    BorderSide? border,
    Widget? prefixIcon,
    Widget? suffixIcon,
    ButtonSize buttonSize = ButtonSize.medium,
    BorderRadius? borderRadius,
    Widget? icon,
    EdgeInsetsGeometry? padding,
  }) {
    return Button(
      key: key,
      label: label,
      height: height,
      width: width,
      color: color,
      labelColor: labelColor,
      onTap: onTap,
      isLoading: isLoading,
      labelStyle: labelStyle,
      border: border,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      buttonSize: icon == null ? buttonSize : ButtonSize.large,
      borderRadius: borderRadius,
      icon: icon,
      buttonType: ButtonType.ghost,
      padding: padding,
    );
  }

  /// Creates a destructive button used for actions that delete or remove data.
  ///
  /// These buttons typically use danger colors to indicate caution is needed.
  /// See [Button] constructor for detailed parameter documentation.
  static Button destructive({
    Key? key,
    String? label,
    double? height,
    double? width,
    Color? color,
    Color? labelColor,
    VoidCallback? onTap,
    bool isLoading = false,
    TextStyle? labelStyle,
    BorderSide? border,
    Widget? prefixIcon,
    Widget? suffixIcon,
    ButtonSize buttonSize = ButtonSize.medium,
    BorderRadius? borderRadius,
    Widget? icon,
    EdgeInsetsGeometry? padding,
  }) {
    return Button(
      key: key,
      label: label,
      height: height,
      width: width,
      color: color,
      labelColor: labelColor,
      onTap: onTap,
      isLoading: isLoading,
      labelStyle: labelStyle,
      border: border,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      buttonSize: icon == null ? buttonSize : ButtonSize.large,
      borderRadius: borderRadius,
      icon: icon,
      buttonType: ButtonType.destructive,
      padding: padding,
    );
  }

  /// Creates a social button designed for social media login/signup actions.
  ///
  /// Features a specific layout optimized for displaying provider logos and text.
  /// Note: The [padding] parameter defaults to a left-right asymmetric padding
  /// optimized for social login buttons.
  /// See [Button] constructor for detailed parameter documentation.
  static Button social({
    Key? key,
    String? label,
    double? height,
    double? width,
    Color? color,
    Color? labelColor,
    VoidCallback? onTap,
    bool isLoading = false,
    TextStyle? labelStyle,
    BorderSide? border,
    Widget? prefixIcon,
    Widget? suffixIcon,
    ButtonSize buttonSize = ButtonSize.full,
    BorderRadius? borderRadius,
    Widget? icon,
    EdgeInsetsGeometry? padding = const EdgeInsets.only(left: 14, right: 32),
  }) {
    return Button(
      key: key,
      label: label,
      height: height,
      width: width,
      color: color,
      labelColor: labelColor,
      onTap: onTap,
      isLoading: isLoading,
      labelStyle: labelStyle,
      border: border,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      buttonSize: icon == null ? buttonSize : ButtonSize.large,
      borderRadius: borderRadius,
      icon: icon,
      buttonType: ButtonType.social,
      padding: padding,
    );
  }

  @override
  Widget build(BuildContext context) {
    final disabled = onTap == null;
    final btnHeight = height ?? buttonSize.height;
    final btnWidth = width ?? buttonSize.width;
    final textColor = isLoading
        ? buttonType.textLoadingColor(context)
        : disabled
            ? context.color.fgDisabled
            : labelColor ?? buttonType.textColor(context);
    final bgColor = isLoading
        ? buttonType.bgLoadingColor(context)
        : disabled
            ? context.color.bgDisabled
            : (color ?? buttonType.bgColor(context));

    return SizedBox(
      height: btnHeight,
      width: isLoading && buttonSize != ButtonSize.full
          ? btnHeight
          : (icon == null ? btnWidth : btnHeight),
      child: ElevatedButton(
        onPressed: isLoading ? () {} : onTap,
        style: ElevatedButton.styleFrom(
          elevation: 0,
          overlayColor: padding == EdgeInsets.zero ? Colors.transparent : null,
          shadowColor: Colors.transparent,
          backgroundColor: bgColor,
          foregroundColor: textColor,
          padding: !isLoading && icon == null ? padding : EdgeInsets.zero,
          minimumSize: Size.zero,
          shape: RoundedRectangleBorder(
            borderRadius:
                borderRadius ?? BorderRadius.circular(CornerRadius.full),
            side: disabled
                ? BorderSide.none
                : (border ?? buttonType.borderSide(context)),
          ),
        ),
        child: Visibility(
          visible: !isLoading,
          replacement: CupertinoActivityIndicator(color: textColor),
          child: Row(
            spacing: 4,
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (icon != null) ...[
                icon!,
              ] else ...[
                if (prefixIcon != null) prefixIcon!,
                if (buttonType == ButtonType.social) const Spacer(),
                if (label != null)
                  Text(
                    label!,
                    overflow: TextOverflow.ellipsis,
                    style: labelStyle ??
                        AppFonts.labelMd.copyWith(color: textColor),
                  ),
                if (buttonType == ButtonType.social) const Spacer(),
                if (suffixIcon != null) suffixIcon!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}

enum ButtonType { primary, secondary, outline, ghost, destructive, social }

enum ButtonSize { small, medium, large, full }

extension ButtonTypeExtension on ButtonType {
  Color bgColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
        return context.color.accentModerate;
      case ButtonType.secondary:
        return context.color.accentSubtle;
      case ButtonType.outline:
        return Colors.transparent;
      case ButtonType.ghost:
        return Colors.transparent;
      case ButtonType.destructive:
        return context.color.bgDestructiveModerate;
      case ButtonType.social:
        return context.color.accentModerate;
    }
  }

  Color bgLoadingColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
        return context.color.accentStrong;
      case ButtonType.secondary:
        return context.color.accentDim;
      case ButtonType.outline:
        return Colors.transparent;
      case ButtonType.ghost:
        return Colors.transparent;
      case ButtonType.destructive:
        return context.color.bgDangerTertiary;
      case ButtonType.social:
        return context.color.accentStrong;
    }
  }

  Color? textColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
        return context.color.white;
      case ButtonType.secondary:
        return context.color.accentBold;
      case ButtonType.outline:
        return context.color.accentBold;
      case ButtonType.ghost:
        return context.color.accentBold;
      case ButtonType.destructive:
        return context.color.white;
      case ButtonType.social:
        return context.color.white;
    }
  }

  Color? textLoadingColor(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
        return context.color.white;
      case ButtonType.secondary:
        return context.color.white;
      case ButtonType.outline:
        return context.color.accentBold;
      case ButtonType.ghost:
        return context.color.accentBold;
      case ButtonType.destructive:
        return context.color.white;
      case ButtonType.social:
        return context.color.white;
    }
  }

  BorderSide borderSide(BuildContext context) {
    switch (this) {
      case ButtonType.primary:
        return BorderSide.none;
      case ButtonType.secondary:
        return BorderSide.none;
      case ButtonType.outline:
        return BorderSide(color: context.color.accentBold);
      case ButtonType.ghost:
        return BorderSide.none;
      case ButtonType.destructive:
        return BorderSide.none;
      case ButtonType.social:
        return BorderSide.none;
    }
  }
}

extension ButtonSizeExtension on ButtonSize {
  double? get width {
    switch (this) {
      case ButtonSize.small:
        return null;
      case ButtonSize.medium:
        return null;
      case ButtonSize.large:
        return null;
      case ButtonSize.full:
        return double.infinity;
    }
  }

  double? get height {
    switch (this) {
      case ButtonSize.small:
        return 32;
      case ButtonSize.medium:
        return 40;
      case ButtonSize.large:
        return 48;
      case ButtonSize.full:
        return 48;
    }
  }
}
