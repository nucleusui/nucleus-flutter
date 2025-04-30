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
              BadgeStyle.basic => const Badges(
                  label: 'Default',
                ),
              BadgeStyle.success => const Badges(
                  label: 'Success',
                  type: BadgeType.success,
                ),
              BadgeStyle.warning => const Badges(
                  label: 'Warning',
                  type: BadgeType.warning,
                ),
              BadgeStyle.error => const Badges(
                  label: 'Error',
                  type: BadgeType.error,
                ),
              BadgeStyle.info => const Badges(
                  label: 'Info',
                  type: BadgeType.info,
                ),
              BadgeStyle.withIcon => Badges(
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
              BadgeStyle.notificationLarge => const Badges(
                  label: '3',
                  type: BadgeType.notification,
                  notificationBadgeSize: NotificationBadgeSize.large,
                  child: CircleAvatar(
                    radius: 32,
                    child: Icon(Icons.person, size: 36),
                  ),
                ),
              BadgeStyle.notificationMedium => const Badges(
                  label: '3',
                  type: BadgeType.notification,
                  child: CircleAvatar(
                    radius: 20,
                    child: Icon(Icons.person, size: 24),
                  ),
                ),
              BadgeStyle.notificationSmall => const Badges(
                  label: '3',
                  type: BadgeType.notification,
                  notificationBadgeSize: NotificationBadgeSize.small,
                  child: CircleAvatar(
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
