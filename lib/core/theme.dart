import 'package:flutter/material.dart';
import 'package:lanes_planes_demo/core/shared/right_to_left_scale_page_transition.dart';
import 'app_colors.dart';

class Themes {
  static final lightTheme = ThemeData(
    useMaterial3: false,
    fontFamily: "Inter",
    scaffoldBackgroundColor: AppColors.backgroundPrimary,
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: RightToLeftScaleTransition(),
        TargetPlatform.iOS: RightToLeftScaleTransition(),
      },
    ),
    colorScheme: const ColorScheme.light(
      background: AppColors.backgroundPrimary,
      primary: AppColors.blue600,
      secondary: AppColors.red600,
      surface: AppColors.backgroundSecondary,
      error: AppColors.foregroundSystemError,
      onPrimary: AppColors.white,
      onBackground: AppColors.foregroundPrimary,
    ),
    textTheme: const TextTheme(
      displayLarge: TextStyle(
        fontSize: 40,
        fontWeight: FontWeight.w600,
        height: 48 / 40,
        color: AppColors.black,
      ),
      displayMedium: TextStyle(
        fontSize: 36,
        fontWeight: FontWeight.w600,
        height: 42 / 36,
      ),
      displaySmall: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 38 / 32,
      ),

      headlineLarge: TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.w600,
        height: 32 / 28,
      ),
      headlineMedium: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w600,
        height: 28 / 24,
      ),
      headlineSmall: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 24 / 20,
      ),

      titleLarge: TextStyle(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        height: 28 / 24,
      ),
      titleMedium: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.w500,
        height: 24 / 20,
      ),
      titleSmall: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 24 / 16,
        color: AppColors.black,
      ),

      labelLarge: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 20 / 14,
        color: AppColors.black,
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 16 / 12,
      ),
      labelSmall: TextStyle(
        fontSize: 11,
        fontWeight: FontWeight.w600,
        height: 16 / 11,
      ),

      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 24 / 16,
        color: AppColors.grey800,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 20 / 14,
        color: AppColors.grey800,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 16 / 12,
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.white,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: AppColors.foregroundPrimary),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(28),
        borderSide: const BorderSide(color: AppColors.blue800, width: 2),
      ),
      hintStyle: const TextStyle(color: AppColors.foregroundTertiary),
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: AppColors.white,
      elevation: 0,
      centerTitle: true,
      titleTextStyle: TextStyle(
        fontFamily: "Inter",
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: AppColors.foregroundPrimary,
      ),
      iconTheme: IconThemeData(color: AppColors.foregroundPrimary),
    ),
    dividerTheme: const DividerThemeData(
      color: AppColors.foregroundPrimary,
      thickness: 1,
    ),
    searchBarTheme: SearchBarThemeData(
      backgroundColor: const WidgetStatePropertyAll<Color>(AppColors.white),
      constraints: const BoxConstraints(
        minWidth: 360,
        maxWidth: 720,
        minHeight: 48,
      ),
      elevation: const WidgetStatePropertyAll<double>(0.0),
      surfaceTintColor: const WidgetStatePropertyAll<Color>(AppColors.white),
      hintStyle: WidgetStatePropertyAll<TextStyle>(
        const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w400,
          color: AppColors.foregroundTertiary,
        ),
      ),
      textStyle: WidgetStatePropertyAll<TextStyle>(
        const TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: AppColors.foregroundPrimary,
        ),
      ),
      shape: WidgetStateProperty.resolveWith<OutlinedBorder>((states) {
        if (states.contains(WidgetState.pressed)) {
          return RoundedRectangleBorder(
            borderRadius: const BorderRadius.all(Radius.circular(28)),
            side: BorderSide(color: AppColors.blue800, width: 1),
          );
        }
        return RoundedRectangleBorder(
          borderRadius: const BorderRadius.all(Radius.circular(28)),
          side: BorderSide(color: AppColors.black, width: 1),
        );
      }),
      overlayColor: WidgetStateProperty.resolveWith<Color?>((states) {
        if (states.contains(WidgetState.pressed)) {
          return AppColors.backgroundSecondary;
        }
        return null;
      }),
      padding: const WidgetStatePropertyAll<EdgeInsetsGeometry>(
        EdgeInsets.symmetric(horizontal: 16, vertical: 0),
      ),
    ),
  );
}
