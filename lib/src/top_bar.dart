import 'package:flutter/material.dart';
import 'package:nucleus_ui/constant/colors.dart';
import 'package:nucleus_ui/constant/typography.dart';
import 'package:nucleus_ui/extension/context.dart';

/// A customizable top bar (app bar) widget with various layout options and styling capabilities.
///
/// The `TopBar` widget provides different title layouts, subtitle support, custom leading widgets,
/// and actions. It supports three main variants through [TopBarType]:
/// - centerTitle: Traditional app bar with centered title
/// - leftTitle: App bar with left-aligned title
/// - largeTitle: Large title layout with optional subtitle
///
/// Example usage:
/// ```dart
/// TopBar(
///   title: 'Dashboard',
///   subtitle: 'Welcome back',
///   type: TopBarType.largeTitle,
///   actions: [
///     IconButton(
///       icon: Icon(Icons.settings),
///       onPressed: () {},
///     ),
///   ],
///   backgroundColor: Colors.white,
///   textColor: Colors.black,
/// )
/// ```

enum TopBarType { centerTitle, leftTitle, largeTitle }

class TopBar extends StatelessWidget implements PreferredSizeWidget {
  const TopBar({
    super.key,
    this.title,
    this.subtitle,
    this.type = TopBarType.centerTitle,
    this.actions,
    this.leadingWidget,
    this.backgroundColor,
    this.textColor = Colors.black,
    this.leadingSize = 20,
    this.padding = const EdgeInsets.all(16),
  });

  /// The primary text displayed in the top bar.
  final String? title;

  /// Optional secondary text displayed below the title in largeTitle type.
  final String? subtitle;

  /// The layout style of the top bar.
  final TopBarType type;

  /// Optional list of widgets to display on the right side of the top bar.
  final List<Widget>? actions;

  /// Custom widget to replace the default back button in the leading position.
  final Widget? leadingWidget;

  /// Background color of the top bar.
  final Color? backgroundColor;

  /// Color applied to the title and subtitle text.
  final Color textColor;

  /// Size of the leading icon (back button) when using the default leading widget.
  final double? leadingSize;

  /// Padding applied to the content of the top bar.
  final EdgeInsetsGeometry padding;

  @override
  Size get preferredSize {
    switch (type) {
      case TopBarType.largeTitle:
        return const Size.fromHeight(100);
      case TopBarType.centerTitle:
        return const Size.fromHeight(kToolbarHeight);
      case TopBarType.leftTitle:
        return const Size.fromHeight(kToolbarHeight);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (type == TopBarType.largeTitle) {
      return SafeArea(
        child: Container(
          width: double.infinity,
          color: backgroundColor,
          padding: padding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _buildLeading(context),
                  if (actions != null)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: actions!,
                    ),
                ],
              ),
              const SizedBox(height: 8),
              _buildTitle(context),
              if (subtitle != null)
                Text(
                  subtitle!,
                  style: AppFonts.regular16.copyWith(
                    color: context.color.fgMuted,
                  ),
                ),
            ],
          ),
        ),
      );
    }
    return AppBar(
      leading: _buildLeading(context),
      elevation: 0,
      backgroundColor: backgroundColor,
      centerTitle: type == TopBarType.centerTitle,
      actions: actions,
      title: _buildTitle(context),
    );
  }

  Widget _buildLeading(BuildContext context) {
    if (leadingWidget != null) return leadingWidget!;
    return IconButton(
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      highlightColor: Colors.transparent,
      hoverColor: Colors.transparent,
      onPressed: () {
        if (Navigator.canPop(context)) Navigator.pop(context);
      },
      icon: Icon(
        Icons.arrow_back_ios,
        size: leadingSize,
        color: context.color.fgColorReverse,
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    switch (type) {
      case TopBarType.centerTitle:
        return Text(
          title ?? '',
          style: AppFonts.bold18.copyWith(
            color: context.color.fgColorReverse,
          ),
        );
      case TopBarType.leftTitle:
        return Text(
          title ?? '',
          textAlign: TextAlign.left,
          style: AppFonts.bold18.copyWith(
            color: context.color.fgColorReverse,
          ),
        );
      case TopBarType.largeTitle:
        return Text(
          title ?? '',
          style: AppFonts.bold32.copyWith(
            color: context.color.fgColorReverse,
          ),
        );
    }
  }
}
