import 'package:flutter/material.dart';

import 'package:casadelcarmen_app/pages/home_page.dart';
import 'package:casadelcarmen_app/pages/login/login_page.dart';

final Map<String, WidgetBuilder> routes = {
  '/': (BuildContext context) => LoginPage(),
  'home': (BuildContext context) => HomePage(),
};
