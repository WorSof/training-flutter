import 'package:flutter/material.dart';
import 'package:hola_mundo/src/notifiers/theme.dart';
import 'package:hola_mundo/src/preferences.dart';
import 'package:provider/provider.dart';
import 'src/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final Preferences _prefs = Preferences();
  await _prefs.initPrefs();

  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // ChangeNotifierProvider(create: (context) => ThemeChanger()),
        ListenableProvider<ThemeChanger>(create: (context) => ThemeChanger()),
      ],
      child: App(),
    );
  }
}
