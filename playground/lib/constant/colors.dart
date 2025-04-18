import 'package:flutter/material.dart';

extension AppColors on ColorScheme {
  // Accent colors in modes
  Color _themeColor(Color darkColor, Color lightColor) =>
      brightness == Brightness.dark ? darkColor : lightColor;

  // Brand palette
  Color get brand10 => const Color(0xFFF6F5FF);
  Color get brand20 => const Color(0xFFF0EDFF);
  Color get brand30 => const Color(0xFFDBD4FF);
  Color get brand40 => const Color(0xFFB4A6FF);
  Color get brand50 => const Color(0xFF907AFF);
  Color get brand60 => const Color(0xFF7257FF);
  Color get brand70 => const Color(0xFF5336E2);
  Color get brand80 => const Color(0xFF34228F);
  Color get brand90 => const Color(0xFF291F61);
  Color get brand100 => const Color(0xFF130D33);

  // Neutral palette
  Color get grey10 => const Color(0xFFF4F6F7);
  Color get grey20 => const Color(0xFFE8EBEB);
  Color get grey30 => const Color(0xFFDADDDE);
  Color get grey40 => const Color(0xFFC1C4C6);
  Color get grey50 => const Color(0xFF898D8F);
  Color get grey60 => const Color(0xFF6E7375);
  Color get grey70 => const Color(0xFF53575A);
  Color get grey80 => const Color(0xFF2F3133);
  Color get grey90 => const Color(0xFF1F2224);
  Color get grey100 => const Color(0xFF131214);

  // White
  Color get white => const Color(0xFFFFFFFF);
  Color get accentOnAccent => _themeColor(white, white);
  Color get accentSubtle => _themeColor(brand90, brand20);
  Color get accentMuted => _themeColor(brand80, brand30);
  Color get accentDim => _themeColor(brand70, brand40);
  Color get accentModerate => _themeColor(brand60, brand60);
  Color get accentBold => _themeColor(brand40, brand70);
  Color get accentStrong => _themeColor(brand30, brand80);
  Color get accentIntense => _themeColor(brand20, brand90);

  // Foreground text color
  Color get fgBase => _themeColor(grey10, grey100);
  Color get fgMuted => _themeColor(grey50, grey60);
  Color get fgSubtle => _themeColor(grey60, grey40);
  Color get fgOnContrast => _themeColor(grey100, grey10);
  Color get fgDisabled => _themeColor(grey60, grey50);
  Color get bgDisabled => const Color(0xFFDADDDE);
}
