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

  // Green palette
  Color get green10 => const Color(0xFFE8FAF0);
  Color get green20 => const Color(0xFFD7F5E5);
  Color get green30 => const Color(0xFF9EEBAF);
  Color get green40 => const Color(0xFF51C285);
  Color get green50 => const Color(0xFF23A15D);
  Color get green60 => const Color(0xFF008557);
  Color get green70 => const Color(0xFF006341);
  Color get green80 => const Color(0xFF0D4F2B);
  Color get green90 => const Color(0xFF05381D);
  Color get green100 => const Color(0xFF021F10);

  // Blue palette
  Color get blue10 => const Color(0xFFF2F7FF);
  Color get blue20 => const Color(0xFFE5F0FF);
  Color get blue30 => const Color(0xFFC2DCFF);
  Color get blue40 => const Color(0xFF75B1FF);
  Color get blue50 => const Color(0xFF308AFF);
  Color get blue60 => const Color(0xFF0A69FA);
  Color get blue70 => const Color(0xFF0050C7);
  Color get blue80 => const Color(0xFF003C94);
  Color get blue90 => const Color(0xFF042961);
  Color get blue100 => const Color(0xFF021026);

  // Yellow palette
  Color get yellow10 => const Color(0xFFFFFEF4);
  Color get yellow20 => const Color(0xFFFEFEB3);
  Color get yellow30 => const Color(0xFFFFD84D);
  Color get yellow40 => const Color(0xFFED9816);
  Color get yellow50 => const Color(0xFFD67507);
  Color get yellow60 => const Color(0xFFB26205);
  Color get yellow70 => const Color(0xFF821B0D);
  Color get yellow80 => const Color(0xFF663C0C);
  Color get yellow90 => const Color(0xFF4D2B05);
  Color get yellow100 => const Color(0xFF331C03);

  // Red palette
  Color get red10 => const Color(0xFFFFF3F0);
  Color get red20 => const Color(0xFFFFE9E3);
  Color get red30 => const Color(0xFFFCECC2);
  Color get red40 => const Color(0xFFFF9175);
  Color get red50 => const Color(0xFFFF3226);
  Color get red60 => const Color(0xFFDB340B);
  Color get red70 => const Color(0xFFAD1D00);
  Color get red80 => const Color(0xFFBA1700);
  Color get red90 => const Color(0xFF611000);
  Color get red100 => const Color(0xFF290800);

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

  // Twitter palette
  Color get twitter50 => const Color(0xFF1DA1F2);
  Color get twitter60 => const Color(0xFF0C90E1);
  Color get twitter70 => const Color(0xFF0B84CF);

  // Facebook palette
  Color get facebook50 => const Color(0xFF0078FF);
  Color get facebook60 => const Color(0xFF0067DB);
  Color get facebook70 => const Color(0xFF0056B8);

  // Basic backgrounds
  Color get bgCanvas => const Color(0xFFFFFFFF);
  Color get bgSubtle => const Color(0xFFF4F6F7);
  Color get bgMuted => const Color(0xFFE8EBEB);
  Color get bgSurface => const Color(0xFFFFFFFF);
  Color get bgContrast => const Color(0xFF131214);

  // Interactive backgrounds
  Color get bgInteractivePrimary => const Color(0xFFE8EBEB);
  Color get bgInteractiveSecondary => const Color(0xFFDADDDE);
  Color get bgInteractiveTertiary => const Color(0xFFC1C4C6);

  // Status backgrounds
  Color get bgSuccess => _themeColor(green10, fgSuccess);
  Color get bgError => _themeColor(green10, fgError);
  Color get bgWarning => _themeColor(const Color(0xFFFFF9E6), yellow30);
  Color get bgInfo => _themeColor(blue10, fgInfo);
  Color get bgDefault => _themeColor(bgSubtle, bgContrast);
  Color get bgNotification => const Color(0xFFDB340B);

  // Special backgrounds
  Color get bgOverlay => const Color(0x70000000);

  // Danger backgrounds
  Color get bgDangerPrimary => const Color(0xFFFF3226);
  Color get bgDangerSecondary => const Color(0xFFDB340B);
  Color get bgDangerTertiary => const Color(0xFFAD1D00);
  Color get bgDestructiveModerate => const Color(0xFFFF5226);

  // Interactive text/icon colors
  Color get fgLink => const Color(0xFF7C3AED);

  // Status text/icon colors
  Color get fgSuccess => const Color(0xFF008557);
  Color get fgWarning => const Color(0xFFB26205);
  Color get fgError => const Color(0xFFDB340B);
  Color get fgInfo => const Color(0xFF0A69FA);
  Color get fgDanger => const Color(0xFFDB340B);

  // Theme-consistent text/icon colors
  Color get fgStaticLight => const Color(0xFFFFFFFF);
  Color get fgStaticDark => const Color(0xFF131214);

  // Basic border colors
  Color get borderSubtle => const Color(0xFFE8EBEB);
  Color get borderMuted => const Color(0xFFDADDDE);
  Color get borderInteractivePrimary => const Color(0xFFDADDDE);
  Color get borderContrast => const Color(0xFF131214);
  Color get borderDisabled => const Color(0xFFC1C4C6);

  // Status border colors
  Color get borderError => const Color(0xFFFF9175);

  // Apple colors
  Color get socialApplePrimary => const Color(0xFF131214);
  Color get socialAppleSecondary => const Color(0xFF1F2224);
  Color get socialAppleTertiary => const Color(0xFF2F3133);

  // Facebook colors
  Color get socialFacebookPrimary => const Color(0xFF0078FF);
  Color get socialFacebookSecondary => const Color(0xFF0067DB);
  Color get socialFacebookTertiary => const Color(0xFF0056B8);

  // Twitter colors
  Color get socialTwitterPrimary => const Color(0xFF1DA1F2);
  Color get socialTwitterSecondary => const Color(0xFF0C90E1);
  Color get socialTwitterTertiary => const Color(0xFF0B84CF);

  // Google colors
  Color get socialGooglePrimary => const Color(0xFFF4F6F7);
  Color get socialGoogleSecondary => const Color(0xFFE8EBEB);
  Color get socialGoogleTertiary => const Color(0xFFDADDDE);

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
  Color get fgBaseReverse => _themeColor(grey100, grey10);
  Color get fgColor => _themeColor(bgContrast, bgCanvas);
  Color get fgColorReverse => _themeColor(bgCanvas, bgContrast);
  Color get bgColor => _themeColor(bgContrast, bgMuted);
  Color get bgColorReverse => _themeColor(bgMuted, bgContrast);
}
