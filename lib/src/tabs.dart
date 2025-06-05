import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable tabs widget that provides a clean interface for tab navigation.
///
/// The `Tabs` widget is a wrapper around Flutter's [TabBar] that provides
/// consistent styling and behavior aligned with the nucleus_ui design system.
/// It automatically handles tab controller creation if none is provided.
///
/// Example usage:
/// ```dart
/// Tabs(
///   tabs: [
///     Tab(text: 'Home'),
///     Tab(text: 'Profile'),
///     Tab(text: 'Settings'),
///   ],
///   onTap: (index) {
///     print('Selected tab: $index');
///   },
/// )
/// ```
class Tabs extends StatefulWidget {
  /// Creates a `Tabs` widget.
  ///
  /// The [tabs] parameter is required and defines the list of tabs to display.
  /// If no [controller] is provided, one will be created automatically.
  const Tabs({
    super.key,
    required this.tabs,
    this.controller,
    this.indicatorColor,
    this.labelColor,
    this.unselectedLabelColor,
    this.indicatorSize = TabBarIndicatorSize.tab,
    this.indicatorPadding = EdgeInsets.zero,
    this.labelPadding = EdgeInsets.zero,
    this.onTap,
    this.indicatorWeight = 1,
    this.isScrollable = false,
    this.overlayColor,
  });

  /// The list of tabs to display.
  ///
  /// Each widget in this list represents a tab. Typically these are [Tab] widgets.
  final List<Widget> tabs;

  /// The tab controller for managing tab state.
  ///
  /// If null, a default [TabController] will be created automatically with
  /// the same length as the [tabs] list.
  final TabController? controller;

  /// The color of the line that appears below the selected tab.
  ///
  /// If null, defaults to [context.color.accentModerate].
  final Color? indicatorColor;

  /// The color of the selected tab's label.
  ///
  /// If null, defaults to [context.color.accentModerate].
  final Color? labelColor;

  /// The color of unselected tab labels.
  ///
  /// If null, defaults to [context.color.fgSubtle].
  final Color? unselectedLabelColor;

  /// Defines how the selected tab indicator's size is computed.
  ///
  /// Defaults to [TabBarIndicatorSize.tab].
  final TabBarIndicatorSize indicatorSize;

  /// The padding added to the tab indicator.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsetsGeometry indicatorPadding;

  /// The padding added to each tab's label.
  ///
  /// Defaults to [EdgeInsets.zero].
  final EdgeInsetsGeometry labelPadding;

  /// Called when a tab is tapped.
  ///
  /// The callback receives the index of the tapped tab.
  final ValueChanged<int>? onTap;

  /// The thickness of the selected tab indicator line.
  ///
  /// Defaults to 1.0.
  final double indicatorWeight;

  /// Whether the tab bar should be scrollable.
  ///
  /// When true, the tab bar can scroll horizontally if the tabs exceed
  /// the available width. When false, tabs are distributed evenly.
  /// Defaults to false.
  final bool isScrollable;

  /// The overlay color for tab interactions.
  ///
  /// Defines the color shown when tabs are pressed or hovered.
  /// If null, defaults to transparent.
  final WidgetStateProperty<Color?>? overlayColor;

  @override
  State<Tabs> createState() => _TabsState();
}

class _TabsState extends State<Tabs> with TickerProviderStateMixin {
  TabController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = widget.controller ??
        TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  void dispose() {
    _controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TabBar(
          isScrollable: widget.isScrollable,
          controller: _controller,
          tabs: widget.tabs,
          indicatorColor: widget.indicatorColor ?? context.color.accentModerate,
          labelColor: widget.labelColor ?? context.color.accentModerate,
          indicatorSize: widget.indicatorSize,
          dividerColor: Colors.transparent,
          unselectedLabelColor:
              widget.unselectedLabelColor ?? context.color.fgSubtle,
          indicatorPadding: widget.indicatorPadding,
          labelPadding: widget.labelPadding,
          onTap: widget.onTap,
          indicatorWeight: widget.indicatorWeight,
          labelStyle: AppFonts.semiBold14.copyWith(
              color: widget.labelColor ?? context.color.accentModerate),
          unselectedLabelStyle: AppFonts.semiBold14.copyWith(
              color: widget.unselectedLabelColor ?? context.color.fgSubtle),
          overlayColor: widget.overlayColor ??
              WidgetStateProperty.resolveWith((states) => Colors.transparent),
        ),
      ],
    );
  }
}
