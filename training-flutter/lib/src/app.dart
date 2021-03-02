import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/start.dart';
import 'package:provider/provider.dart';
import 'package:hola_mundo/src/routes.dart';
import 'package:hola_mundo/src/notifiers/theme.dart';
import 'package:hola_mundo/src/preferences.dart';

class App extends StatelessWidget {
  final Preferences _prefs = Preferences();

  void _gestureDetectorOnTap(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    final ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    final Brightness deviceBrightness =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .platformBrightness;

    return GestureDetector(
      onTap: () => _gestureDetectorOnTap(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hola Mundo',
        theme: themeChanger.getTheme(_prefs.theme, deviceBrightness),
        initialRoute: StartPage.routeName,
        routes: Routes.getRoutes(context),
        onGenerateRoute: Routes.getError,
      ),
    );
  }
}
