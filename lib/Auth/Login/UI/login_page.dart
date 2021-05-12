import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:opus_banking/BottomNavigation/Banking/home.dart';
import 'package:opus_banking/Routes/AppConfig.dart';
import 'package:opus_banking/Routes/routes.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../../login_navigator.dart';
import 'login_interactor.dart';
import 'login_ui.dart';
import 'package:http/http.dart' as http;
import 'package:imei_plugin/imei_plugin.dart';

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
   // Navigator.pushNamed(context, LoginRoutes.verification);
    print('*********SERVER REQUEST+CREDENTIALS++++${mobileNo}****${IDNumber}');

    AppConfig.getToken();
    String tokenRetrieved = await AppConfig.retrieveFromSharedPrefs('Token');
    print('************TOKEN*RETRIEVED***********${tokenRetrieved}****');
    var response = await http.post(
      AppConfig.GET_VERIFICATION_CODE,
      headers: <String, String>{
        'Token': tokenRetrieved,
        'Accept': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'mobile_no': mobileNo,
        'id_number': IDNumber,
        'unique_id': '609108965',
        'sacco_id': '00048',
      }),
    );
    var decodedResponse = json.decode(response.body);
    print('*********SERVER RESPONSE+LOGIN++++${decodedResponse.toString()}');

   /* ProgressDialog pr = new ProgressDialog(context,
        type: ProgressDialogType.Normal, showLogs: true, isDismissible: false);
    pr.style(message: 'Please wait...');
    pr.show();*/

    //var response = await http.post(AppConfig.LOGIN_URL, headers: loginHeaders,body);
    // var decodedResponse = json.decode(response.body);

    bool statusString = decodedResponse['Success'];
    String status_code = decodedResponse['status_code'];
    String description = decodedResponse['Description'];

    if (status_code != '200') {
      AppConfig.saveToSharedPrefs('IDNumber', IDNumber);
      AppConfig.saveToSharedPrefs('mobileNo', mobileNo);

     // pr.hide();
     // pr.hide().whenComplete(() {
        Fluttertoast.showToast(
            msg: '${description}',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red,
            textColor: Colors.white,
            fontSize: 16.0);
     // });
    } else {
     // pr.hide();
    //  pr.hide().whenComplete(() {
        Fluttertoast.showToast(
            msg: '${description}',
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
     // });
      AppConfig.getVerificationCode(IDNumber, mobileNo);
      /////COMMENTED OUT FOR TEST PURPOSES///////////
     // Navigator.pushNamed(context, LoginRoutes.verification);
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HomePage()));
    }
  }
}
