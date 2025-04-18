import 'package:flutter/material.dart';

extension AppContext on BuildContext {
  /// Returns the current theme of the app.
  ThemeData get theme => Theme.of(this);

  /// Returns the current color scheme of the app.
  ColorScheme get color => theme.colorScheme;
}
