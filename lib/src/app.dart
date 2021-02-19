import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/pageNotFound.dart';
import 'package:hola_mundo/pages/start.dart';
import 'package:hola_mundo/src/routes.dart';
import 'package:hola_mundo/src/themeData.dart';

class App extends StatelessWidget {
  Route<dynamic> _defaultRoute(RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => PageNotFoundPage(),
      );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Hola Mundo',
      theme: themeData,
      initialRoute: StartPage.routeName,
      routes: getRoutes(),
      onGenerateRoute: _defaultRoute,
    );
  }
}
