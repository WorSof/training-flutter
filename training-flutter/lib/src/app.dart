import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/pageNotFound.dart';
import 'package:hola_mundo/pages/start.dart';
import 'package:hola_mundo/src/notifiers/theme.dart';
import 'package:hola_mundo/src/preferences.dart';
import 'package:hola_mundo/src/routes.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  final Preferences _prefs = Preferences();

  Route<dynamic> _defaultRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => PageNotFoundPage(),
      );

  void _gestureDetectorOnTap(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    final ThemeChanger themeChanger = Provider.of<ThemeChanger>(context);
    final Brightness deviceBrightness =
        MediaQueryData.fromWindow(WidgetsBinding.instance.window)
            .platformBrightness;
    // final ThemeData appTheme = (deviceBrightness == Brightness.dark) ? themeDataDark : themeDataLight;

    return GestureDetector(
      onTap: () => _gestureDetectorOnTap(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hola Mundo',
        // theme: appTheme,
        theme: themeChanger.getTheme(_prefs.theme, deviceBrightness),
        initialRoute: StartPage.routeName,
        routes: getRoutes(),
        onGenerateRoute: _defaultRoute,
      ),
    );
  }
}
