import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;

import 'package:imei_plugin/imei_plugin.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppConfig {
  static String MAIN_URL = "https://suresms.co.ke:3438/api/";
  static String REGISTER_URL = "";
  static String GET_TOKEN = MAIN_URL + "GetToken";
  static String GET_VERIFICATION_CODE = MAIN_URL + "SendVerificationCode";
  static String GET_MEMBER_INFO = MAIN_URL + "GetmemberInfor";

  static String name;
  static String member_no;
  static String id_no;
  static String account_status;
  static String unique_id;
  static String mobileNo;

  //////////////////////////////////////////////////////////////////////////////
  static String DEVICE_IMEI = "";

  static void getDeviceIMEI() async {
    String imei = await ImeiPlugin.getImei();
    List<String> multiImei =
        await ImeiPlugin.getImeiMulti(); //for double-triple SIM phones
    String uuid = await ImeiPlugin.getId();
    DEVICE_IMEI = imei;
  }

  static Future saveToSharedPrefs(String key, String value) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString('$key', value);
  }

  static Future<String> retrieveFromSharedPrefs(String key) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    String data = preferences.get('$key');
    return data;
  }

  static Future<String> getToken() async {
    var loginHeaders = {
      'Username': 'admin@cloudpesateam',
      'Password': '2345678',
      "Accept": 'application/json'
    };

    var response = await http.get(AppConfig.GET_TOKEN, headers: loginHeaders);
    var decodedResponse = json.decode(response.body);

    print('*********SERVER RESPONSE+TOKEN++++${decodedResponse.toString()}');

    String token = decodedResponse['Token'];
    bool statusString = decodedResponse['Success'];
    String statusCode = decodedResponse['statusCode'];
    String description = decodedResponse['Description'];

    AppConfig.saveToSharedPrefs('Token', token);
    //AppConfig.saveToSharedPrefs('Username', username);

    // print('*********SERVER RESPONSE+LOGIN++++${decodedResponse.toString()}');

    /*if(statusCode=='200'){
      Navigator.pushNamed(context, LoginRoutes.verification
      );
    }*/
  }

  static Future<String> getVerificationCode(
      String IDNumber, String mobileNo) async {
    String tokenRetrieved = await AppConfig.retrieveFromSharedPrefs('Token');
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
    print(
        '*********SERVER RESPONSE+VERIFICATION CODE++++${decodedResponse.toString()}');
  }

  static Future<String> verifyPhoneNumberAndLogin(
      String IDNumber, String mobileNo, String verificationCode) async {
    String tokenRetrieved = await AppConfig.retrieveFromSharedPrefs('Token');
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
        'verification_code': verificationCode,
      }),
    );
    var decodedResponse = json.decode(response.body);
    print(
        '*********SERVER RESPONSE+VERIFICATION CODE++++${decodedResponse.toString()}');
  }

  static Future<String> getMemberData() async {
    String mobileNo = await AppConfig.retrieveFromSharedPrefs('mobileNo');
    String IDNumber = await AppConfig.retrieveFromSharedPrefs('IDNumber');

   print( '*********GET MEMBER INFO++++${mobileNo}');


    String tokenRetrieved = await AppConfig.retrieveFromSharedPrefs('Token');
    var response = await http.post(
      AppConfig.GET_MEMBER_INFO,
      headers: <String, String>{
        'Token': tokenRetrieved,
        'Accept': 'application/json',
      },
      body: jsonEncode(<String, String>{
        'mobile_no': mobileNo,
        'id_number': IDNumber,
        'unique_id': '609108965',
      }),
    );
    var decodedResponse = json.decode(response.body);
    print(
        '*********SERVER RESPONSE+MEMBER INFO****Mobile**${mobileNo}*****ID Number***${IDNumber}******${response.body.toString()}');

    if (decodedResponse['Success'] == true) {

      name = decodedResponse['name'];
      member_no = decodedResponse['member_no'];
      id_no = decodedResponse['id_no'];
      account_status = decodedResponse['account_status'];
      unique_id = decodedResponse['unique_id'];
      mobileNo = decodedResponse['mobile_no'];

      AppConfig.saveToSharedPrefs('name', decodedResponse['name']);
      AppConfig.saveToSharedPrefs('member_no', decodedResponse['member_no']);
      AppConfig.saveToSharedPrefs('id_no', decodedResponse['id_no']);
      AppConfig.saveToSharedPrefs(
          'account_status', decodedResponse['account_status']);
      AppConfig.saveToSharedPrefs('unique_id', decodedResponse['unique_id']);
    }

    print(
        '*********SERVER RESPONSE+MEMBER INFO****Mobile**${mobileNo}*****ID Number***${IDNumber}******${decodedResponse.toString()}');
  }
}
