import 'package:casadelcarmen_app/models/profiles_model.dart';
import 'package:casadelcarmen_app/pages/home_page.dart';
import 'package:flutter/material.dart';

import 'package:casadelcarmen_app/shared_preferences/shared_prefs.dart';
import 'package:casadelcarmen_app/services/login_service.dart';

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
    Map<String, dynamic> resp = await LoginService.login(
      user: userController.text,
      password: passwordController.text,
    );

    if (resp.containsKey('token')) {
      _prefs.token = resp['token'];
      _prefs.userEmail = userController.text;
      print(resp);
      List<Profile> listaTemp = new List();
      resp['profiles'].forEach((profile) {
        Profile perfilTemp = new Profile.fromJson(profile);
        listaTemp.add(perfilTemp);
      });
      Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(listaTemp)));
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
