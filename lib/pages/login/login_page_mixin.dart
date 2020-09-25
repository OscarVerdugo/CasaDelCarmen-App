import 'package:casadelcarmen_app/services/login_provider.dart';
import 'package:flutter/material.dart';

import 'package:casadelcarmen_app/shared_preferences/shared_prefs.dart';

mixin LoginMixin<T extends StatefulWidget> on State<T> {
  final userController = new TextEditingController();
  final passwordController = new TextEditingController();
  final _prefs = Prefs();
  bool _showPassword = false;
  bool inProgress = false;
  TextTheme themes;

  @override
  void didChangeDependencies() {
    themes = Theme.of(context).textTheme;
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    userController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  set showPassword(bool value) {
    setState(() {
      _showPassword = value;
    });
  }

  bool get showPassword => _showPassword;

  void login(GlobalKey<ScaffoldState> scaffoldKey) async {
    scaffoldKey.currentState.showSnackBar(
      SnackBar(
        content: Text(
          'Cargando...',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blueGrey,
      ),
    );
    Map<String, dynamic> resp = await LoginProvider.login(
      user: userController.text,
      password: passwordController.text,
    );

    if (resp.containsKey('token')) {
      _prefs.token = resp['token'];
      _prefs.userEmail = userController.text;
      Navigator.pushNamed(context, 'home');
    } else {
      scaffoldKey.currentState.hideCurrentSnackBar();
      scaffoldKey.currentState.showSnackBar(
        SnackBar(
          content: Text(
            'Usuario o contraseña incorrectos',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.blueGrey,
        ),
      );
    }

    inProgress = false;
  }
}
