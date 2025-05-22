import 'dart:async';

import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// Types of toast notifications available in the design system.
enum ToastType { subtle, contrast, accent }

/// A customizable toast notification component that displays temporary messages.
///
/// The Toast widget provides a consistent way to show non-intrusive feedback
/// or messages to users. It supports different styles, optional actions,
/// icons, and auto-dismissal behavior.
///
/// Example:
/// ```dart
/// Toast.show(
///   context,
///   message: 'This is a snack bar',
/// );
/// ```
///
/// See also:
///  * [SnackBar], which is a similar component from Material Design
///  * [ScaffoldMessenger], which manages SnackBars and other scaffold features
class Toast extends StatelessWidget {
  const Toast({
    super.key,
    required this.message,
    this.caption,
    this.type = ToastType.subtle,
    this.leadingIcon,
    this.actionText,
    this.onActionPressed,
    this.actionIcon,
    this.duration = const Duration(seconds: 4),
    this.margin,
    this.padding,
    this.borderRadius,
    this.elevation,
    this.messageStyle,
    this.captionStyle,
    this.actionTextStyle,
  });

  /// The main message text to display in the toast.
  final String message;

  /// Optional secondary text shown below the main message.
  final String? caption;

  /// The visual style of the toast. Affects background and text colors.
  final ToastType type;

  /// Optional icon widget displayed at the start of the toast.
  final Widget? leadingIcon;

  /// Text for the action button (if any).
  final String? actionText;

  /// Callback function when the action button is pressed.
  final VoidCallback? onActionPressed;

  /// Optional icon widget for the action button.
  final Widget? actionIcon;

  /// Duration before the toast auto-dismisses. Defaults to 4 seconds.
  final Duration duration;

  /// Custom margin around the toast container.
  final EdgeInsets? margin;

  /// Custom padding inside the toast container.
  final EdgeInsets? padding;

  /// Custom border radius for the toast container.
  final BorderRadius? borderRadius;

  /// Custom elevation (shadow) for the toast.
  final double? elevation;

  /// Custom text style for the main message.
  final TextStyle? messageStyle;

  /// Custom text style for the caption text.
  final TextStyle? captionStyle;

  /// Custom text style for the action button text.
  final TextStyle? actionTextStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding ?? const EdgeInsets.fromLTRB(16, 12, 16, 12),
      decoration: BoxDecoration(
        color: type.backgroundColor(context),
        borderRadius: borderRadius ?? BorderRadius.circular(8),
        boxShadow: elevation != null
            ? [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .1),
                  blurRadius: elevation!,
                  offset: const Offset(0, 2),
                )
              ]
            : [
                BoxShadow(
                  color: Colors.black.withValues(alpha: .1),
                  blurRadius: 8,
                  offset: const Offset(0, 2),
                ),
              ],
      ),
      child: Row(
        children: [
          if (leadingIcon != null) ...[
            leadingIcon!,
            const SizedBox(width: 12),
          ],
          Expanded(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  message,
                  style: messageStyle ??
                      AppFonts.regular16.copyWith(
                        color: type.foregroundColor,
                      ),
                ),
                if (caption != null) ...[
                  Text(
                    caption!,
                    style: captionStyle ??
                        AppFonts.regular14.copyWith(
                          color: type.foregroundColor,
                        ),
                  ),
                ],
              ],
            ),
          ),
          if (actionText != null || actionIcon != null) ...[
            const SizedBox(width: 12),
            if (actionText != null)
              InkWell(
                onTap: onActionPressed,
                child: Text(
                  actionText!,
                  style: actionTextStyle ??
                      AppFonts.medium16.copyWith(
                        color: context.color.accentModerate,
                      ),
                ),
              )
            else if (actionIcon != null)
              InkWell(
                onTap: onActionPressed,
                child: actionIcon,
              ),
          ],
        ],
      ),
    );
  }

  /// Shows a toast message at the bottom of the screen.
  static void show(
    BuildContext context, {
    required String message,
    String? caption,
    ToastType type = ToastType.subtle,
    Widget? leadingIcon,
    String? actionText,
    VoidCallback? onActionPressed,
    Widget? actionIcon,
    Duration duration = const Duration(seconds: 4),
    EdgeInsets? margin,
    EdgeInsets? padding,
    BorderRadius? borderRadius,
    double? elevation,
    TextStyle? messageStyle,
    TextStyle? captionStyle,
    TextStyle? actionTextStyle,
  }) {
    final overlay = Overlay.of(context);
    late OverlayEntry overlayEntry;

    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
        bottom: MediaQuery.of(context).padding.bottom + 16,
        left: 16,
        right: 16,
        child: Material(
          color: Colors.transparent,
          child: Toast(
            message: message,
            caption: caption,
            type: type,
            leadingIcon: leadingIcon,
            actionText: actionText,
            onActionPressed: () {
              onActionPressed?.call();
              overlayEntry.remove();
            },
            actionIcon: actionIcon != null
                ? GestureDetector(
                    onTap: () {
                      onActionPressed?.call();
                      overlayEntry.remove();
                    },
                    child: actionIcon,
                  )
                : null,
            duration: duration,
            margin: margin,
            padding: padding,
            borderRadius: borderRadius,
            elevation: elevation,
            messageStyle: messageStyle,
            captionStyle: captionStyle,
            actionTextStyle: actionTextStyle,
          ),
        ),
      ),
    );

    overlay.insert(overlayEntry);

    // Auto dismiss after duration
    Timer(duration, () {
      if (overlayEntry.mounted) {
        overlayEntry.remove();
      }
    });
  }
}

/// Extension methods for [ToastType] to get appropriate colors based on the type.
extension ToastTypeExtension on ToastType {
  /// Gets the appropriate text color for this toast type in the given context.
  Color get foregroundColor {
    switch (this) {
      case ToastType.subtle:
        return Colors.black;
      default:
        return Colors.white;
    }
  }

  /// Gets the appropriate background color for this toast type in the given context.
  Color backgroundColor(BuildContext context) {
    switch (this) {
      case ToastType.subtle:
        return context.color.bgSubtle;
      case ToastType.accent:
        return context.color.accentModerate;
      case ToastType.contrast:
        return context.color.bgContrast;
    }
  }
}
