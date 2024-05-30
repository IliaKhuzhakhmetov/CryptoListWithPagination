import 'package:flutter/material.dart';

abstract class ThemeFactory {
  ThemeData createLightTheme();
  ThemeData createDarkTheme();
}
