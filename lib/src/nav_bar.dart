import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable bottom navigation bar widget for switching between different views or sections.
///
/// The `NavBar` widget provides a persistent bottom navigation with customizable tabs,
/// icons, and labels. It handles state management internally and notifies parent widgets
/// of tab changes through callbacks.
///
/// Example usage:
/// ```dart
/// NavBar(
///   items: [
///     BottomNavItem(
///       icon: Icon(Icons.home),
///       label: 'Home',
///     ),
///     BottomNavItem(
///       icon: Icon(Icons.search),
///       label: 'Search',
///     ),
///   ],
///   onTabChanged: (index) {
///     print('Switched to tab $index');
///   },
/// )
/// ```

class NavBar extends StatefulWidget {
  const NavBar({
    super.key,
    required this.onTabChanged,
    required this.items,
    this.selectedLabelStyle,
    this.unselectedLabelStyle,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.backgroundColor,
  });

  /// Callback function triggered when a tab is selected.
  final ValueChanged<int> onTabChanged;

  /// List of items to display in the navigation bar.
  final List<BottomNavItem> items;

  /// Text style for the selected tab's label.
  final TextStyle? selectedLabelStyle;

  /// Text style for unselected tabs' labels.
  final TextStyle? unselectedLabelStyle;

  /// Color for the selected tab's icon and label.
  final Color? selectedItemColor;

  /// Color for unselected tabs' icons and labels.
  final Color? unselectedItemColor;

  /// Background color of the navigation bar.
  final Color? backgroundColor;

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final showLabel = widget.items.every((item) => item.label != null);
    return BottomNavigationBar(
      backgroundColor: widget.backgroundColor ?? context.color.fgColor,
      type: BottomNavigationBarType.fixed,
      currentIndex: _currentIndex,
      onTap: (index) {
        setState(() => _currentIndex = index);
        widget.onTabChanged(index);
      },
      selectedItemColor:
          widget.selectedItemColor ?? context.color.accentModerate,
      showSelectedLabels: showLabel,
      showUnselectedLabels: showLabel,
      unselectedItemColor: widget.unselectedItemColor ?? context.color.fgSubtle,
      selectedLabelStyle: widget.selectedLabelStyle ?? AppFonts.bold12,
      unselectedLabelStyle: widget.unselectedLabelStyle ?? AppFonts.regular12,
      items: widget.items.map((item) {
        return BottomNavigationBarItem(
          icon: item.icon,
          activeIcon: item.activeIcon ?? item.icon,
          label: item.label ?? '',
        );
      }).toList(),
    );
  }
}

/// A data class representing an item in the bottom navigation bar.
///
/// Each item can have an icon, an optional active icon state, and an optional label.
/// If all items in a [NavBar] have labels, they will be shown by default.
class BottomNavItem {
  const BottomNavItem({
    required this.icon,
    this.activeIcon,
    this.label,
  });

  /// The default icon to display for this navigation item.
  final Widget icon;

  /// Optional icon to display when this item is selected.
  /// If not provided, the default [icon] will be used.
  final Widget? activeIcon;

  /// Optional text label to display below the icon.
  final String? label;
}
