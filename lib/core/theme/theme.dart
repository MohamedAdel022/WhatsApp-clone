import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract final class AppTheme {
  // The FlexColorScheme defined light mode ThemeData.
  static ThemeData light = (() {
    final baseTheme = FlexThemeData.light(
      // Using FlexColorScheme built-in FlexScheme enum based colors
      scheme: FlexScheme.shadGreen,
      textTheme: GoogleFonts.robotoTextTheme(),
      appBarBackground: Colors.white,
      // Component theme configurations for light mode.
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        tintedDisabledControls: true,
        useMaterial3Typography: true,
        useM2StyleDividerInM3: true,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        alignedDropdown: true,
        navigationRailUseIndicator: true,
      ),
      // Direct ThemeData properties.
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    );

    return baseTheme.copyWith(
      colorScheme: baseTheme.colorScheme.copyWith(),
      appBarTheme: baseTheme.appBarTheme.copyWith(
        surfaceTintColor: Colors.transparent,
      ),
      inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
        fillColor: Color(0xFFF6F5F4),
      ),
    );
  })();

  // The FlexColorScheme defined dark mode ThemeData.
  static ThemeData dark = (() {
    final baseTheme = FlexThemeData.dark(
      // Using FlexColorScheme built-in FlexScheme enum based colors.
      scheme: FlexScheme.shadGreen,
      textTheme: GoogleFonts.robotoTextTheme(),
      scaffoldBackground: Color(0xff0B1014),
      surface: Color(0xff0B1014),
      // Component theme configurations for dark mode.
      subThemesData: const FlexSubThemesData(
        interactionEffects: true,
        tintedDisabledControls: true,
        blendOnColors: true,
        useMaterial3Typography: true,
        useM2StyleDividerInM3: true,
        inputDecoratorIsFilled: true,
        inputDecoratorBorderType: FlexInputBorderType.outline,
        alignedDropdown: true,
        navigationRailUseIndicator: true,
      ),
      // Direct ThemeData properties.
      visualDensity: FlexColorScheme.comfortablePlatformDensity,
      cupertinoOverrideTheme: const CupertinoThemeData(applyThemeToAll: true),
    );

    return baseTheme.copyWith(
      colorScheme: baseTheme.colorScheme.copyWith(
        onPrimaryFixedVariant: Color(0xFFD8FDD2),
      ),
      appBarTheme: baseTheme.appBarTheme.copyWith(
        surfaceTintColor: Colors.transparent,
      ),
      inputDecorationTheme: baseTheme.inputDecorationTheme.copyWith(
        fillColor: Color(0xff23282C),
      ),
    );
  })();
}
