import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter_web_plugins/url_strategy.dart';
import 'package:playground/router.dart';
import 'package:web/web.dart';

void main() {
  usePathUrlStrategy();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Workaround for https://github.com/flutter/flutter/issues/155265
  void onBlur(Event e) {
    (document.activeElement as HTMLElement?)?.blur();
  }

  @override
  void initState() {
    super.initState();
    window.addEventListener('blur', onBlur.toJS);
  }

  @override
  void dispose() {
    window.removeEventListener('blur', onBlur.toJS);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Uri.base.queryParameters['theme'] ?? 'light';

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      title: 'nucleus-ui Flutter Playground',
      theme: ThemeData(
        colorSchemeSeed: Colors.white,
        brightness: theme == 'dark' ? Brightness.dark : Brightness.light,
      ),
    );
  }
}
