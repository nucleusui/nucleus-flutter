import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:playground/pages/button.dart';
import 'package:playground/pages/input_field.dart';
import 'package:playground/pages/quick_tip.dart';

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
          style: PlagroundButtonStyle.values.byName(style),
        );
      },
    ),
    GoRoute(
      path: '/input-field',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'standard';
        return TextFieldPage(
          style: PlagroundInputFieldStyle.values.byName(style),
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
