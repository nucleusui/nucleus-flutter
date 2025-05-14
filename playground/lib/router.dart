import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:go_router/go_router.dart';
import 'package:playground/pages/accordion.dart';
import 'package:playground/pages/avatar.dart';
import 'package:playground/pages/badge.dart';
import 'package:playground/pages/breadcrumb.dart';
import 'package:playground/pages/button.dart';
import 'package:playground/pages/input_field.dart';
import 'package:playground/pages/nav_bar.dart';
import 'package:playground/pages/progress.dart';
import 'package:playground/pages/quick_tip.dart';
import 'package:playground/pages/search_bar.dart';
import 'package:playground/pages/separator.dart';
import 'package:playground/pages/top_bar.dart';
import 'package:playground/pages/widget_ratio.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
  initialLocation: '/',
  redirect: (context, state) {
    if (state.uri.path == '/') {
      return '/button';
    }
    return null;
  },
  errorBuilder: (context, state) => const _PageNotFound(),
  routes: [
    GoRoute(
      path: '/button',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'primary';
        return ButtonPage(
          style: ButtonStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/input-field',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'standard';
        return InputFieldPage(
          style: InputFieldStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/quick-tip',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'up';
        return QuickTipPage(
          style: QuickTipStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/badge',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'basic';
        return BadgePage(
          style: BadgeStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/progress',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'basic';
        return ProgressPage(
          style: ProgressStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/avatar',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'basic';
        return AvatarPage(
          style: AvatarStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/accordion',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'simple';
        return AccordionPage(
          style: AccordionStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/widget-ratio',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'square';
        return WidgetRatioPage(
          style: WidgetRatioStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/separator',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'solid';
        return SeparatorPage(
          style: SeparatorStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/breadcrumb',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'slash';
        return BreadcrumbPage(
          style: BreadcrumbStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/top-bar',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'center';
        return TopBarPage(
          style: TopBarStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/nav-bar',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'withLabel';
        return NavBarPage(
          style: NavBarStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/search-field',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'withContainer';
        return SearchFieldPage(
          style: SearchFieldStyle.values.byName(style),
        );
      },
    ),
  ],
);

class _PageNotFound extends StatelessWidget {
  const _PageNotFound();

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Center(
        child: Text('Page not found'),
      ),
    );
  }
}
