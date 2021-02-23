import 'package:flutter/material.dart';
import 'package:hola_mundo/pages/createAccount.dart';
import 'package:hola_mundo/pages/pageNotFound.dart';
import 'package:hola_mundo/pages/start.dart';
import 'package:hola_mundo/pages/textFormField.dart';

Map<String, WidgetBuilder> getRoutes() {
  return <String, WidgetBuilder>{
    StartPage.routeName: (context) => StartPage(),
    CreateAccountPage.routeName: (context) => CreateAccountPage(),
    TextFormFieldPage.routeName: (context) => TextFormFieldPage(),
    PageNotFoundPage.routeName: (context) => PageNotFoundPage(),
  };
}
