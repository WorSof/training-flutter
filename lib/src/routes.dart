import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/createAccount.dart';
import 'package:hola_mundo/pages/pageNotFound.dart';
import 'package:hola_mundo/pages/start.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    StartPage.routeName: (context) => StartPage(),
    CreateAccountPage.routeName: (context) => CreateAccountPage(),
    PageNotFoundPage.routeName: (context) => PageNotFoundPage(),
  };
}
