import 'package:go_router/go_router.dart';
import 'package:playground/pages/button.dart';
import 'package:playground/pages/input_field.dart';

final router = GoRouter(
  debugLogDiagnostics: true,
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
        final style = state.uri.queryParameters['style'] ?? 'primary';
        return TextFieldPage(
          style: PlagroundInputFieldStyle.values.byName(style),
        );
      },
    ),
  ],
);
