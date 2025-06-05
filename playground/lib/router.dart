import 'package:flutter/material.dart' hide ButtonStyle;
import 'package:go_router/go_router.dart';
import 'package:playground/pages/accordion.dart';
import 'package:playground/pages/aspect_ratio.dart';
import 'package:playground/pages/avatar.dart';
import 'package:playground/pages/badge.dart';
import 'package:playground/pages/breadcrumb.dart';
import 'package:playground/pages/button.dart';
import 'package:playground/pages/button_group.dart';
import 'package:playground/pages/chip.dart';
import 'package:playground/pages/dialog.dart';
import 'package:playground/pages/input_field.dart';
import 'package:playground/pages/nav_bar.dart';
import 'package:playground/pages/page_control.dart';
import 'package:playground/pages/progress.dart';
import 'package:playground/pages/search_bar.dart';
import 'package:playground/pages/segmented_control.dart';
import 'package:playground/pages/separator.dart';
import 'package:playground/pages/skeleton.dart';
import 'package:playground/pages/tabs.dart';
import 'package:playground/pages/toast.dart';
import 'package:playground/pages/tooltip.dart';
import 'package:playground/pages/top_bar.dart';

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
      path: '/tooltip',
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
      path: '/aspect-ratio',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'square';
        return RatioBoxPage(
          style: RatioBoxStyle.values.byName(style),
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
    GoRoute(
      path: '/button-group',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'noIcon';
        return ButtonGroupPage(
          style: ButtonGroupStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/chip',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'filled';
        return CustomChipPage(
          style: CustomChipStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/dialog',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'confirm';
        return DialogPage(
          style: DialogStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/toast',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'subtle';
        return ToastPage(
          style: ToastStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/page-control',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'dotDefault';
        return PageControlPage(
          style: PageControlStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/skeleton',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'rectangle';
        return SkeletonPage(
          style: SkeletonStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/segmented-control',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'twoSegments';
        return SegmentedControlPage(
          style: SegmentedControlStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/tabs',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'basic';
        return TabsPage(
          style: TabsStyle.values.byName(style),
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
