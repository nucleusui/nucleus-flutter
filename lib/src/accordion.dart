import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable accordion widget that can expand and collapse content.
///
/// The `Accordion` widget displays a list of items that can be expanded
/// or collapsed to reveal more information. Each item consists of a header
/// and expandable content.
///
/// Example usage:
/// ```dart
/// Accordion(
///   items: [
///     AccordionItem(
///       title: 'What is accordion in UI design?',
///       content: 'An accordion is a vertically stacked list of items that can be expanded or collapsed to reveal more information.',
///     ),
///     AccordionItem(
///       title: 'Another question',
///       content: 'This is the answer to another question.',
///     ),
///   ],
/// )
/// ```
class Accordion extends StatelessWidget {
  /// Creates an `Accordion` widget.
  ///
  /// The [items] parameter is required and specifies the accordion items.
  const Accordion({
    super.key,
    required this.items,
    this.type = AccordionType.simple,
    this.expandAll = false,
    this.borderRadius = const BorderRadius.all(Radius.circular(8)),
    this.dividerColor,
    this.headerBackgroundColor,
    this.headerTextStyle,
    this.contentBackgroundColor,
    this.contentTextStyle,
    this.expandIcon = Icons.expand_more,
    this.collapseIcon = Icons.expand_less,
    this.customExpandIcon,
    this.customCollapseIcon,
    this.iconColor,
    this.padding = const EdgeInsets.symmetric(vertical: 16),
  });

  /// The list of accordion items to display.
  final List<AccordionItem> items;

  /// The type of accordion to display.
  final AccordionType type;

  /// Expand by default.
  final bool expandAll;

  /// The border radius of the accordion items.
  final BorderRadius borderRadius;

  /// The color of the divider between accordion items.
  final Color? dividerColor;

  /// The background color of the header.
  final Color? headerBackgroundColor;

  /// The text style for the header title.
  final TextStyle? headerTextStyle;

  /// The background color of the content section.
  final Color? contentBackgroundColor;

  /// The text style for the content.
  final TextStyle? contentTextStyle;

  /// The icon displayed when the accordion is expandable.
  final IconData expandIcon;

  /// The icon displayed when the accordion is collapsible.
  final IconData collapseIcon;

  /// A custom widget to display instead of the default icon.
  final Widget? customExpandIcon;

  /// A custom widget to display instead of the default icon.
  final Widget? customCollapseIcon;

  /// The color of the expand/collapse icon.
  final Color? iconColor;

  /// The padding around the header.
  final EdgeInsetsGeometry padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: items.map((e) {
        var isExpanded = expandAll;
        return StatefulBuilder(builder: (context, setState) {
          final cardStyle = type == AccordionType.card;

          return Container(
            margin: EdgeInsets.only(bottom: cardStyle ? 16 : 0),
            padding: cardStyle
                ? const EdgeInsets.symmetric(horizontal: 16)
                : EdgeInsets.zero,
            decoration: BoxDecoration(
              color: cardStyle ? context.color.fgColor : Colors.transparent,
              borderRadius: cardStyle ? borderRadius : null,
              border: cardStyle
                  ? null
                  : Border(
                      bottom: BorderSide(
                        color: dividerColor ?? context.color.borderSubtle,
                      ),
                    ),
              boxShadow: cardStyle
                  ? [
                      BoxShadow(
                        color: context.color.bgColor.withValues(alpha: .5),
                        blurRadius: 10,
                      ),
                    ]
                  : null,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  hoverColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: () => setState(() => isExpanded = !isExpanded),
                  borderRadius: borderRadius,
                  child: Container(
                    padding: padding,
                    decoration: BoxDecoration(
                      color: headerBackgroundColor ?? Colors.transparent,
                      borderRadius: isExpanded
                          ? BorderRadius.only(
                              topLeft: borderRadius.topLeft,
                              topRight: borderRadius.topRight,
                            )
                          : borderRadius,
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            e.title,
                            style: headerTextStyle ?? AppFonts.semiBold16,
                          ),
                        ),
                        Builder(builder: (context) {
                          if (customCollapseIcon != null && isExpanded) {
                            return customCollapseIcon!;
                          }

                          if (customExpandIcon != null && !isExpanded) {
                            return customExpandIcon!;
                          }

                          return Icon(
                            isExpanded ? collapseIcon : expandIcon,
                            color: iconColor ?? context.color.accentModerate,
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                Visibility(
                  visible: isExpanded,
                  child: Container(
                    padding: const EdgeInsets.only(bottom: 16),
                    decoration: BoxDecoration(
                      color: contentBackgroundColor ?? Colors.transparent,
                      borderRadius: BorderRadius.only(
                        bottomLeft: borderRadius.bottomLeft,
                        bottomRight: borderRadius.bottomRight,
                      ),
                    ),
                    child: e.content is Widget
                        ? e.content as Widget
                        : Text(
                            e.content.toString(),
                            style: contentTextStyle ??
                                AppFonts.regular14.copyWith(
                                  color: context.color.fgMuted,
                                ),
                          ),
                  ),
                ),
              ],
            ),
          );
        });
      }).toList(),
    );
  }
}

enum AccordionType { simple, card }

/// Represents an individual item in an accordion.
class AccordionItem {
  /// Creates an `AccordionItem`.
  ///
  /// The [title] and [content] parameters are required.
  AccordionItem({
    required this.title,
    required this.content,
  });

  /// The title text displayed in the header.
  final String title;

  /// The content displayed when the item is expanded.
  /// Can be a string or a widget.
  final dynamic content;
}
