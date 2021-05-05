import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:opus_banking/Routes/AppConfig.dart';
import '../../login_navigator.dart';
import 'login_interactor.dart';
import 'login_ui.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> implements LoginInteractor {
  @override
  Widget build(BuildContext context) {
    return LoginUI(this);
  }

  @override
  Future<void> loginWithID(String mobileNo, String IDNumber) async {
    var loginHeaders = {
      'Username': 'admin@cloudpesateam',
      'Password': '2345678',
      "Accept": 'application/json'
    };

    var response = await http.get(AppConfig.LOGIN_URL, headers: loginHeaders);
    var decodedResponse = json.decode(response.body);

    print('*********SERVER RESPONSE+LOGIN++++${decodedResponse['Token']}');

    /*Navigator.pushNamed(context, LoginRoutes.registration,
        arguments: isoCode + mobileNumber);*/
  }
}
