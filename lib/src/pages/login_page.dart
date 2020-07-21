import 'package:flutter/material.dart';

import 'package:casadelcarmen_app/src/classes/login_mixin.dart';
import 'package:casadelcarmen_app/src/widgets/custom_textfield.dart';
import 'package:flutter/services.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with LoginMixin {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'LOGIN',
              style: themes.headline1,
            ),
            SizedBox(height: 20),
            CustomTextField(
              inputType: TextInputType.emailAddress,
              userController: userController,
              hintText: 'Usuario',
              icon: Icons.account_circle,
              obscureText: true,
            ),
            SizedBox(height: 15),
            CustomTextField(
              inputType: TextInputType.text,
              userController: passwordController,
              hintText: 'Contraseña',
              icon: Icons.lock_outline,
              obscureText: showPassword,
            ),
            SizedBox(height: 15),
            SwitchListTile(
              value: showPassword,
              onChanged: (valor) => showPassword = valor,
              title: Text(
                'Mostrar contraseña',
                style: themes.bodyText1,
              ),
              activeColor: Colors.blueGrey,
            ),
            MaterialButton(
              onPressed: () {
                if (!inProgress) {
                  inProgress = true;
                  login(scaffoldKey);
                }
              },
              child: Text(
                'Iniciar sesión',
                style: themes.bodyText1,
              ),
              color: Colors.white,
              shape: StadiumBorder(),
            ),
          ],
        ),
      ),
    );
  }
}
