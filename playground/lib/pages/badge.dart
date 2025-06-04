import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum BadgeStyle {
  basic,
  success,
  warning,
  error,
  info,
  withIcon,
  notificationLarge,
  notificationMedium,
  notificationSmall,
}

class BadgePage extends StatelessWidget {
  const BadgePage({super.key, required this.style});

  final BadgeStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            switch (style) {
              BadgeStyle.basic => Badges.status(
                  label: 'Default',
                ),
              BadgeStyle.success => Badges.status(
                  label: 'Success',
                  type: BadgeType.success,
                ),
              BadgeStyle.warning => Badges.status(
                  label: 'Warning',
                  type: BadgeType.warning,
                ),
              BadgeStyle.error => Badges.status(
                  label: 'Error',
                  type: BadgeType.error,
                ),
              BadgeStyle.info => Badges.status(
                  label: 'Info',
                  type: BadgeType.info,
                ),
              BadgeStyle.withIcon => Badges.status(
                  label: 'With Icon',
                  type: BadgeType.success,
                  icon: Padding(
                    padding: const EdgeInsets.only(right: 5),
                    child: Icon(
                      Icons.circle_outlined,
                      color: BadgeType.success.fgColor(context),
                    ),
                  ),
                ),
              BadgeStyle.notificationLarge => Badges.count(
                  label: '3',
                  notificationBadgeSize: NotificationBadgeSize.large,
                  child: const CircleAvatar(
                    radius: 32,
                    child: Icon(Icons.person, size: 36),
                  ),
                ),
              BadgeStyle.notificationMedium => Badges.count(
                  label: '3',
                  child: const CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person, size: 24),
                  ),
                ),
              BadgeStyle.notificationSmall => Badges.count(
                  label: '3',
                  notificationBadgeSize: NotificationBadgeSize.small,
                  child: const CircleAvatar(
                    radius: 16,
                    child: Icon(Icons.person, size: 20),
                  ),
                ),
            },
          ],
        ),
      ),
    );
  }
}
