import 'package:flutter/material.dart';
import 'package:nucleus_ui/nucleus_ui.dart';

enum NavBarStyle {
  withLabel,
  noLabel,
  badge,
  dotBadge,
  twoTabs,
  fiveTabs,
}

class NavBarPage extends StatelessWidget {
  const NavBarPage({super.key, required this.style});

  final NavBarStyle style;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500, maxHeight: 200),
          child: switch (style) {
            NavBarStyle.withLabel => NavBar(
                onTabChanged: (index) => debugPrint('$index'),
                items: const [
                  BottomNavItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  BottomNavItem(
                    icon: Icon(Icons.person),
                    label: 'Account',
                  ),
                ],
              ),
            NavBarStyle.noLabel => NavBar(
                onTabChanged: (index) => debugPrint('$index'),
                items: const [
                  BottomNavItem(
                    icon: Icon(Icons.home_filled),
                  ),
                  BottomNavItem(
                    icon: Icon(Icons.person),
                  ),
                ],
              ),
            NavBarStyle.badge => NavBar(
                onTabChanged: (index) => debugPrint('$index'),
                items: [
                  const BottomNavItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  BottomNavItem(
                    icon: Badges.count(
                      label: '1',
                      textStyle: const TextStyle(
                        fontSize: 8,
                        height: 1.4,
                        color: Colors.white,
                      ),
                      child: const Icon(Icons.person),
                    ),
                    label: 'Account',
                  ),
                ],
              ),
            NavBarStyle.dotBadge => NavBar(
                onTabChanged: (index) => debugPrint('$index'),
                items: [
                  const BottomNavItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  BottomNavItem(
                    icon: Badges.count(
                      label: '1',
                      notificationBadgeSize: NotificationBadgeSize.small,
                      child: const Icon(Icons.person),
                    ),
                    label: 'Account',
                  ),
                ],
              ),
            NavBarStyle.twoTabs => NavBar(
                onTabChanged: (index) => debugPrint('$index'),
                items: const [
                  BottomNavItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  BottomNavItem(
                    icon: Icon(Icons.person),
                    label: 'Account',
                  ),
                ],
              ),
            NavBarStyle.fiveTabs => NavBar(
                onTabChanged: (index) => debugPrint('$index'),
                items: const [
                  BottomNavItem(
                    icon: Icon(Icons.home_filled),
                    label: 'Home',
                  ),
                  BottomNavItem(
                    icon: Icon(Icons.search),
                    label: 'Search',
                  ),
                  BottomNavItem(
                    icon: Icon(Icons.add_circle_outlined),
                    label: 'Create',
                  ),
                  BottomNavItem(
                    icon: Icon(Icons.favorite_border),
                    label: 'Saved',
                  ),
                  BottomNavItem(
                    icon: Icon(Icons.person),
                    label: 'Account',
                  ),
                ],
              ),
          },
        ),
      ),
    );
  }
}
