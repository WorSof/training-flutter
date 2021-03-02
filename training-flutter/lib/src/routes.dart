import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/createAccount.dart';
import 'package:hola_mundo/pages/pageNotFound.dart';
import 'package:hola_mundo/pages/start.dart';
import 'package:hola_mundo/pages/textFormField.dart';

class Routes {
  static Map<String, WidgetBuilder> getRoutes(BuildContext context) => {
        StartPage.routeName: (context) => StartPage(),
        CreateAccountPage.routeName: (context) => CreateAccountPage(),
        TextFormFieldPage.routeName: (context) => TextFormFieldPage(),
        PageNotFoundPage.routeName: (context) => PageNotFoundPage(),
      };

  static Route<dynamic> getError(RouteSettings settings) => MaterialPageRoute(
        builder: (BuildContext context) => PageNotFoundPage(),
      );
}
