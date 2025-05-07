import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable breadcrumb widget for navigation hierarchies.
///
/// The `Breadcrumb` widget displays a navigation path with customizable
/// separators, icons, and handling for long paths.
///
/// Example usage:
/// ```dart
/// Breadcrumb(
///   items: [
///     BreadcrumbItem(label: 'Home', onTap: () {}),
///     BreadcrumbItem(label: 'Products', onTap: () {}),
///     BreadcrumbItem(label: 'Category', onTap: () {}),
///     BreadcrumbItem(label: 'Item', onTap: () {}, isActive: true),
///   ],
/// )
/// ```
class Breadcrumb extends StatelessWidget {
  /// Creates a `Breadcrumb` widget.
  ///
  /// The [items] parameter is required and contains the list of breadcrumb items.
  const Breadcrumb({
    super.key,
    required this.items,
    this.separator = '/',
    this.maxVisibleItems,
    this.dropdownIndex,
    this.showEllipsis = false,
    this.separatorIcon,
    this.dropdownIcon,
  });

  /// The list of items to display in the breadcrumb.
  final List<BreadcrumbItem> items;

  /// The separator character between breadcrumb items.
  final String separator;

  /// Maximum number of items to display before truncating.
  final int? maxVisibleItems;

  /// The index of the dropdown item in the breadcrumb.
  final int? dropdownIndex;

  /// Whether to show ellipsis for truncated items.
  final bool showEllipsis;

  /// The icon to use as a separator.
  final IconData? separatorIcon;

  /// The icon to use for the dropdown item.
  final IconData? dropdownIcon;

  @override
  Widget build(BuildContext context) {
    if (items.isEmpty) return const SizedBox.shrink();

    final visibleItems = _getVisibleItems();
    final breadcrumbWidgets = <Widget>[];

    for (var i = 0; i < visibleItems.length; i++) {
      final item = visibleItems[i];

      // Add the breadcrumb item
      breadcrumbWidgets.add(_buildBreadcrumbItem(context, item));

      // Add separator if not the last item
      if (i < visibleItems.length - 1) {
        breadcrumbWidgets.add(_buildSeparator(context));
      }
    }

    // Add ellipsis if needed
    if (showEllipsis && maxVisibleItems != null) {
      if (maxVisibleItems!.isEven) {
        breadcrumbWidgets.insert(maxVisibleItems!, _buildSeparator(context));
      }
      breadcrumbWidgets.insert(maxVisibleItems!, _buildEllipsis(context));
      if (maxVisibleItems!.isOdd) {
        breadcrumbWidgets.insert(maxVisibleItems!, _buildSeparator(context));
      }
    }

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: breadcrumbWidgets,
      ),
    );
  }

  /// Returns the list of items to be displayed based on maxVisibleItems
  List<BreadcrumbItem> _getVisibleItems() {
    if (maxVisibleItems == null || items.length <= maxVisibleItems!) {
      return items;
    }

    if (showEllipsis) {
      // Always show the first item, possibly a collapsed middle, and the last items
      final firstItem = items.first;
      final lastItems = items.skip(items.length - (maxVisibleItems!)).toList();
      return [firstItem, ...lastItems];
    }

    // If no collapsing strategy, just return the first maxVisibleItems
    return items.take(maxVisibleItems!).toList();
  }

  /// Builds a breadcrumb item widget
  Widget _buildBreadcrumbItem(BuildContext context, BreadcrumbItem item) {
    final textStyle = item.isActive
        ? AppFonts.medium14.copyWith(color: context.color.fgColorReverse)
        : AppFonts.regular14.copyWith(color: context.color.fgMuted);

    final Widget itemWidget = Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (item.icon != null) ...[item.icon!, const SizedBox(width: 4)],
        Text(item.label, style: textStyle),
        if (item.isDropdown)
          Padding(
            padding: const EdgeInsets.only(left: 6),
            child: Icon(
              dropdownIcon ?? Icons.keyboard_arrow_down,
              size: 16,
              color: context.color.fgMuted,
            ),
          )
      ],
    );

    if (item.onTap != null && !item.isActive) {
      return InkWell(
        onTap: item.onTap,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
        focusColor: Colors.transparent,
        child: itemWidget,
      );
    }

    return itemWidget;
  }

  /// Builds a separator widget
  Widget _buildSeparator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: separatorIcon != null
          ? Icon(
              separatorIcon,
              size: 16,
              color: context.color.fgMuted,
            )
          : Text(
              separator,
              style: AppFonts.regular14.copyWith(
                color: context.color.fgMuted,
              ),
            ),
    );
  }

  /// Builds an ellipsis widget for truncated paths
  Widget _buildEllipsis(BuildContext context) {
    return Text(
      '...',
      style: AppFonts.regular14.copyWith(
        color: context.color.fgMuted,
      ),
    );
  }
}

/// Represents an item in a breadcrumb navigation.
class BreadcrumbItem {
  /// Creates a breadcrumb item.
  ///
  /// The [label] parameter is required and specifies the text to display.
  BreadcrumbItem({
    required this.label,
    this.onTap,
    this.isActive = false,
    this.isDropdown = false,
    this.icon,
  });

  /// The text to display for this breadcrumb item.
  final String label;

  /// Callback function when the item is tapped.
  final VoidCallback? onTap;

  /// Whether this item represents the current active page.
  final bool isActive;

  /// Whether this item is a dropdown.
  final bool isDropdown;

  /// Optional icon to display before the label.
  final Widget? icon;
}
