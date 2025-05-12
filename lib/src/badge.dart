import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable badge widget that can display labels, icons, or notifications.
///
/// The `Badges` widget supports different types of badges such as basic, success,
/// warning, error, info, and notification badges. It allows customization of
/// padding, alignment, colors, text styles, and more.
///
/// Example usage:
/// ```dart
/// Badges(
///   label: 'Basic',
///   type: BadgeType.basic,
/// )
/// ```
class Badges extends StatelessWidget {
  /// Creates a `Badges` widget.
  ///
  /// The [label] parameter is required and specifies the text to display inside the badge.
  const Badges({
    super.key,
    required this.label,
    this.padding,
    this.offset,
    this.backgroundColor,
    this.textColor,
    this.textStyle,
    this.alignment,
    this.child,
    this.icon,
    this.type = BadgeType.basic,
    this.notificationBadgeSize = NotificationBadgeSize.medium,
  });

  /// The text to display inside the badge.
  final String label;

  /// The padding around the badge content.
  final EdgeInsetsGeometry? padding;

  /// The offset to position the badge relative to its parent.
  final Offset? offset;

  /// The background color of the badge.
  final Color? backgroundColor;

  /// The text color of the badge.
  final Color? textColor;

  /// The text style for the badge label.
  final TextStyle? textStyle;

  /// The alignment of the badge within its parent.
  final AlignmentGeometry? alignment;

  /// The child widget to which the badge is attached.
  final Widget? child;

  /// An optional icon to display inside the badge.
  final Widget? icon;

  /// The type of badge, which determines its appearance.
  final BadgeType type;

  /// The size of the notification badge, applicable when [type] is `BadgeType.notification`.
  final NotificationBadgeSize notificationBadgeSize;

  @override
  Widget build(BuildContext context) {
    if (type == BadgeType.notification) {
      return Badge(
        label: Container(
          alignment: Alignment.center,
          height: notificationBadgeSize == NotificationBadgeSize.small
              ? notificationBadgeSize.size * 1.3
              : notificationBadgeSize.size,
          decoration: BoxDecoration(
            color: backgroundColor ?? context.color.fgError,
            shape: BoxShape.circle,
          ),
          margin: EdgeInsets.zero,
          child: Text(
            label,
            style: textStyle ??
                AppFonts.regular16.copyWith(
                  color: textColor ?? Colors.white,
                  fontSize: notificationBadgeSize.fontSize,
                ),
          ),
        ),
        largeSize: notificationBadgeSize == NotificationBadgeSize.small
            ? null
            : notificationBadgeSize.size,
        padding: EdgeInsets.all(notificationBadgeSize.padding),
        backgroundColor: context.color.fgColor,
        textColor: textColor ?? type.fgColor(context),
        offset: offset ?? const Offset(2, -5),
        alignment: alignment,
        child: child,
      );
    }

    return Badge(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (icon != null) icon!,
          Text(label, style: textStyle ?? AppFonts.bold14),
        ],
      ),
      padding:
          padding ?? const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      backgroundColor: backgroundColor ?? type.bgColor(context),
      textColor: textColor ?? type.fgColor(context),
      offset: offset,
      alignment: alignment,
      child: child,
    );
  }
}

/// Enum representing the different types of badges.
enum BadgeType { success, warning, error, info, basic, notification }

/// Enum representing the sizes of notification badges.
enum NotificationBadgeSize { small, medium, large }

/// Extension to provide size-related properties for `NotificationBadgeSize`.
extension NotifSizeExtension on NotificationBadgeSize {
  /// The font size for the notification badge label.
  double get fontSize {
    switch (this) {
      case NotificationBadgeSize.small:
        return 0;
      case NotificationBadgeSize.medium:
        return 8;
      case NotificationBadgeSize.large:
        return 16;
    }
  }

  /// The size of the notification badge.
  double get size {
    switch (this) {
      case NotificationBadgeSize.small:
        return 8;
      case NotificationBadgeSize.medium:
        return 15;
      case NotificationBadgeSize.large:
        return 32;
    }
  }

  /// The padding inside the notification badge.
  double get padding {
    switch (this) {
      case NotificationBadgeSize.small:
        return 1;
      case NotificationBadgeSize.medium:
        return 2;
      case NotificationBadgeSize.large:
        return 4;
    }
  }
}

/// Extension to provide color-related properties for `BadgeType`.
extension BadgeTypeExtension on BadgeType {
  /// Returns the background color for the badge type.
  Color bgColor(BuildContext context) {
    switch (this) {
      case BadgeType.success:
        return context.color.bgSuccess;
      case BadgeType.warning:
        return context.color.bgWarning;
      case BadgeType.error:
        return context.color.bgError;
      case BadgeType.info:
        return context.color.bgInfo;
      case BadgeType.basic:
        return context.color.bgDefault;
      case BadgeType.notification:
        return context.color.bgDefault;
    }
  }

  /// Returns the foreground color for the badge type.
  Color fgColor(BuildContext context) {
    switch (this) {
      case BadgeType.success:
        return context.color.fgColor;
      case BadgeType.warning:
        return Colors.black;
      case BadgeType.error:
        return context.color.fgColor;
      case BadgeType.info:
        return context.color.fgColor;
      case BadgeType.basic:
        return context.color.fgColor;
      case BadgeType.notification:
        return context.color.fgColor;
    }
  }
}
