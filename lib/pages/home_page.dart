import 'package:casadelcarmen_app/models/profiles_model.dart';
import 'package:flutter/material.dart';

import 'package:casadelcarmen_app/shared_preferences/shared_prefs.dart';

class HomePage extends StatelessWidget {
  final List<Profile> profiles;

  const HomePage(this.profiles);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            Container(
              color: Colors.grey[500],
              width: double.infinity,
              height: 250,
              child: Center(
                child: Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Center(
                      child: Text(
                    'EJ',
                    style: TextStyle(color: Colors.grey[500]),
                  )),
                ),
              ),
            ),
            for (Profile profile in profiles)
              ExpansionTile(
                title: Text('${profile.name}'),
                children: [
                  for (Module modulo in profile.modules)
                    ListTile(
                      title: Text('${modulo.name}'),
                    )
                ],
              ),
          ],
        ),
      ),
      body: _CustomContainer(),
    );
  }
}

class _CustomContainer extends StatelessWidget {
  final _prefs = Prefs();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 300,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(' Email : ${_prefs.userEmail}'),
            Text(
              ' Token : ${_prefs.token} ',

              // maxLines: 1,
              // overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
