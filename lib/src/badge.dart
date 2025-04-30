import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

class Badges extends StatelessWidget {
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

  final String label;
  final EdgeInsetsGeometry? padding;
  final Offset? offset;
  final Color? backgroundColor;
  final Color? textColor;
  final TextStyle? textStyle;
  final AlignmentGeometry? alignment;
  final Widget? child;
  final Widget? icon;
  final BadgeType type;
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
                AppFonts.bodyMd.copyWith(
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
          Text(label, style: textStyle ?? AppFonts.labelSm),
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

enum BadgeType { success, warning, error, info, basic, notification }

enum NotificationBadgeSize { small, medium, large }

extension NotifSizeExtension on NotificationBadgeSize {
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

  double get size {
    switch (this) {
      case NotificationBadgeSize.small:
        return 8;
      case NotificationBadgeSize.medium:
        return 16;
      case NotificationBadgeSize.large:
        return 32;
    }
  }

  double get padding {
    switch (this) {
      case NotificationBadgeSize.small:
        return 1;
      case NotificationBadgeSize.medium:
        return 3;
      case NotificationBadgeSize.large:
        return 4;
    }
  }
}

extension BadgeTypeExtension on BadgeType {
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
