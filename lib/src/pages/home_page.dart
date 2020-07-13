import 'package:casadelcarmen_app/src/shared_preferences/shared_prefs.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  final _prefs = Prefs();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 300,
          height: 300,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(' Email : ${_prefs.userEmail}'),
              Text(
                ' Token : ${_prefs.token}',
                // maxLines: 1,
                // overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
