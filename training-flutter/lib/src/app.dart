import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/pageNotFound.dart';
import 'package:hola_mundo/pages/start.dart';
import 'package:hola_mundo/src/routes.dart';
import 'package:hola_mundo/src/themeData.dart';

class App extends StatelessWidget {
  Route<dynamic> _defaultRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => PageNotFoundPage(),
      );

  void _gestureDetectorOnTap(BuildContext context) {
    FocusScope.of(context).requestFocus(FocusNode());
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _gestureDetectorOnTap(context),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Hola Mundo',
        theme: themeData,
        initialRoute: StartPage.routeName,
        routes: getRoutes(),
        onGenerateRoute: _defaultRoute,
      ),
    );
  }
}
