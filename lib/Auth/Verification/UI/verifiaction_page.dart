import 'package:flutter/material.dart';
import 'package:opus_banking/Auth/Verification/UI/verification_interator.dart';
import 'package:opus_banking/Auth/Verification/UI/verification_ui.dart';
import 'package:opus_banking/Routes/AppConfig.dart';
import 'package:opus_banking/Routes/routes.dart';

import '../../login_navigator.dart';

class VerificationPage extends StatefulWidget {
  final VoidCallback onVerificationDone;

  VerificationPage(this.onVerificationDone);

  @override
  _VerificationPageState createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage>
    implements VerificationInteractor {
  @override
  Widget build(BuildContext context) {
    return VerificationUI(this);
  }

  @override
  Future<void> verificationDone(String verificationCode) async {
    Navigator.pushNamed(context, PageRoutes.homePage);

    widget.onVerificationDone();
    String mobileNo = await AppConfig.retrieveFromSharedPrefs('Token');
    String IDNumber = await AppConfig.retrieveFromSharedPrefs('Token');

    AppConfig.verifyPhoneNumberAndLogin(IDNumber, mobileNo, verificationCode);

  }

  @override
  void verifyNumber() {

  }
}
