import 'package:crypto_currencies_test_app/features/app/logic/app_theme_factory.dart';
import 'package:crypto_currencies_test_app/features/coins/presentation/coin_assets_screen/coin_assets_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  // This global key is needed for [MaterialApp]
  // to work properly when Widgets Inspector is enabled.
  static final _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    const settings = ThemeSettings(
      bodyLargeFontSize: 17.0,
      bodyLargeFontWeight: FontWeight.w600,
    );

    final themeFactory = AppThemeFactory(settings: settings);

    final lightTheme = themeFactory.createLightTheme();
    final darkTheme = themeFactory.createDarkTheme();

    return MaterialApp(
      darkTheme: darkTheme,
      theme: lightTheme,
      // There is only one screen but for future I would add routing system (go_router or auto_route)
      home: const CoinsAssetsScreen(),
      // Take into account that user can have different font scales in smartphones
      builder: (context, child) => MediaQuery.withClampedTextScaling(
        key: _globalKey,
        minScaleFactor: 1.0,
        maxScaleFactor: 2.0,
        child: child!,
      ),
    );
  }
}
