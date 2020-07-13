import 'package:flutter/material.dart';

import 'package:casadelcarmen_app/src/pages/home_page.dart';
import 'package:casadelcarmen_app/src/pages/login_page.dart';
import 'package:casadelcarmen_app/src/shared_preferences/shared_prefs.dart';

final _prefs = Prefs();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // TODO: Verificar el token antes de inicio de app
  await _prefs.initPrefs();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Casa del Carmen App',
      routes: {
        '/': (BuildContext context) => LoginPage(),
        'home': (BuildContext context) => HomePage(),
      },
      // TODO: Una vez se tenga un método para verificar el token cambiar esta condición
      initialRoute: (_prefs.token == null) ? '/' : 'home',
      theme: ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
            fontSize: 26,
            color: Colors.blueGrey,
            fontWeight: FontWeight.normal,
          ),
          bodyText1: TextStyle(
            fontSize: 12,
            color: Colors.blueGrey,
            fontWeight: FontWeight.normal,
          ),
        ),
      ),
    );
  }
}
