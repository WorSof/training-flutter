import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:hola_mundo/src/app.dart';
import 'package:hola_mundo/src/notifiers/theme.dart';
import 'package:hola_mundo/src/preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Preferences _prefs = Preferences();
  await _prefs.initPrefs();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      child: App(),
      providers: [
        ListenableProvider<ThemeChanger>(create: (_) => ThemeChanger()),
      ],
    );
  }
}
