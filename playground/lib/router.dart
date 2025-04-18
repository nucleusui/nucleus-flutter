import 'package:go_router/go_router.dart';
import 'package:playground/pages/button.dart';
import 'package:playground/pages/textfield.dart';

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
      path: '/textfield',
      builder: (context, state) {
        final style = state.uri.queryParameters['style'] ?? 'primary';
        return TextFieldPage(
          style: PlagroundTextFieldStyle.values.byName(style),
        );
      },
    ),
  ],
);
