import 'dart:async';
import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Auth/Verification/UI/verification_interator.dart';
import 'package:opus_banking/Components/custom_button.dart';
import 'package:opus_banking/Components/entry_field.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Routes/AppConfig.dart';

class VerificationUI extends StatefulWidget {
  final VerificationInteractor verificationInteractor;

  @override
  _VerificationUIState createState() => _VerificationUIState();

  VerificationUI(this.verificationInteractor);
}

class _VerificationUIState extends State<VerificationUI> {
  final TextEditingController _controller = TextEditingController();
  int _counter = 20;
  Timer _timer;
  String phoneNumber;
  TextEditingController otpController = new TextEditingController();

  _startTimer() {
    _counter = 20; //time counter
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        _counter > 0 ? _counter-- : _timer.cancel();
      });
    });
  }

  @override
  Future<void> initState()  {
    super.initState();

    _startTimer();
    widget.verificationInteractor.verifyNumber();
    setPhoneNumber();
  }

  @override
  void dispose() {
    _controller.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(locale.verification),
      ),
      body: FadedSlideAnimation(
        Column(
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              locale.enterOTPSentOn + '\n' + '${phoneNumber}',
              style:
                  Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 15),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: EntryField(
                hint: locale.enterOTPCode,
                controller: otpController,

              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
              child: CustomButton(
                onTap: () => widget.verificationInteractor.verificationDone(otpController.value.toString()),
              ),
            ),
            Spacer(),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(
                  locale.onceYouVerifyPhoneNumber +
                      '\n' +
                      locale.assignYourThumbImpression,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            Spacer(
              flex: 8,
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  void setPhoneNumber() async{

    phoneNumber = await AppConfig.retrieveFromSharedPrefs('Username');

  }
}
