import 'package:flutter/material.dart';

class AppColors {
  // Base
  static const Color black = Color(0xFF191F25);
  static const Color white = Color(0xFFFFFFFF);

  // Greys
  static const Color grey50 = Color(0xFFF4F8FC);
  static const Color grey100 = Color(0xFFEDF1F5);
  static const Color grey300 = Color(0xFFC5CFDB);
  static const Color grey500 = Color(0xFF7B8694);
  static const Color grey600 = Color(0xFF666F7A);
  static const Color grey800 = Color(0xFF3A3F45);

  // Primary Blues
  static const Color blue600 = Color(0xFF2D67B2);
  static const Color blue800 = Color(0xFF022C63);
  static const Color blue900 = Color(0xFF011B3D);

  // Secondary Reds
  static const Color red600 = Color(0xFFDD3728);
  static const Color red700 = Color(0xFFC73224);
  static const Color red800 = Color(0xFFB12C20);

  // Semantic Backgrounds
  static const Color backgroundPrimary = white;
  static const Color backgroundSecondary = grey50;
  static const Color backgroundTertiary = grey100;

  static const Color backgroundSystemAttention = Color(0xFFFBF0BC);
  static const Color backgroundSystemError = Color(0xFFFFE5E8);
  static const Color backgroundSystemInformative = Color(0xFFEAF3FE);
  static const Color backgroundSystemNeutral = grey100;
  static const Color backgroundSystemSuccess = Color(0xFFDEF8E3);

  // Semantic Foregrounds
  static const Color foregroundPrimary = black;
  static const Color foregroundSecondary = grey800;
  static const Color foregroundTertiary = grey600;
  static const Color foregroundDisabled = Color(0x4D191F25); // 30% opacity

  static const Color foregroundSystemAttention = Color(0xFFC27500);
  static const Color foregroundSystemError = Color(0xFFBC1D3B);
  static const Color foregroundSystemInformative = Color(0xFF0D4FA5);
  static const Color foregroundSystemNeutral = grey600;
  static const Color foregroundSystemSuccess = Color(0xFF077237);
}
