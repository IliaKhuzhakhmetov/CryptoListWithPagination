import 'package:crypto_currencies_test_app/core/base/factories/theme_factory.dart';
import 'package:crypto_currencies_test_app/core/constants/font_famalies.dart';
import 'package:flutter/material.dart';

class ThemeSettings {
  final String fontFamily;
  final double? bodyLargeFontSize;
  final FontWeight? bodyLargeFontWeight;

  const ThemeSettings({
    this.fontFamily = FontFamilies.sfProText,
    this.bodyLargeFontSize,
    this.bodyLargeFontWeight,
  });
}

class AppThemeFactory implements ThemeFactory {
  final ThemeSettings settings;

  AppThemeFactory({required this.settings});

  TextTheme customTextTheme(TextTheme base) {
    return base
        .copyWith(
          bodyLarge: base.bodyLarge?.copyWith(
            fontSize: settings.bodyLargeFontSize ?? base.bodyLarge?.fontSize,
            fontWeight: settings.bodyLargeFontWeight ?? base.bodyLarge?.fontWeight,
          ),
        )
        .apply(
          fontFamily: settings.fontFamily,
        );
  }

  @override
  ThemeData createLightTheme() {
    return ThemeData.light().copyWith(
      textTheme: customTextTheme(ThemeData.light().textTheme),
    );
  }

  @override
  ThemeData createDarkTheme() {
    return ThemeData.dark().copyWith(
      textTheme: customTextTheme(ThemeData.dark().textTheme),
    );
  }
}
