import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

class LoginService {
  static Future<Map<String, dynamic>> login({@required String password, @required String user}) async {
    final url = 'https://casa-del-carmen-dev.herokuapp.com/app-login';

    final resp = await http.post(
      url,
      body: {'email': user, 'password': password},
    );

    final decodedResp = json.decode(resp.body);

    return decodedResp;
  }
}
