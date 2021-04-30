import 'package:animation_wrappers/Animations/faded_translation_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:opus_banking/Components/custom_button.dart';
import 'package:opus_banking/Components/entry_field.dart';
import 'package:opus_banking/Locale/locale.dart';

import '../../login_navigator.dart';
import 'login_interactor.dart';

class LoginUI extends StatefulWidget {
  final LoginInteractor loginInteractor;

  LoginUI(this.loginInteractor);

  @override
  _LoginUIState createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {
  final TextEditingController _numberController = TextEditingController();

  @override
  void dispose() {
    _numberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      body: FadedSlideAnimation(
        Column(
            children: [
        Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery
            .of(context)
            .size
            .height * 0.3,
        color: Theme
            .of(context)
            .primaryColor,
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            ListTile(
              contentPadding: EdgeInsets.zero,
              trailing: Text(
                locale.newUser,
                style: Theme
                    .of(context)
                    .textTheme
                    .bodyText1
                    .copyWith(
                    color: Theme
                        .of(context)
                        .scaffoldBackgroundColor,
                    fontSize: 16),
              ),
            ),
            Spacer(),
            RichText(
                text: TextSpan(
                    style: Theme
                        .of(context)
                        .textTheme
                        .bodyText1
                        .copyWith(
                        color: Theme
                            .of(context)
                            .scaffoldBackgroundColor,
                        fontSize: 24),
                    children: <TextSpan>[
                      TextSpan(text: 'Mobile '),
                      TextSpan(
                          text: 'Banking',
                          style: TextStyle(fontWeight: FontWeight.w300)),
                    ])),
            Spacer(
              flex: 2,
            ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
      Text(
        locale.orSignInWithCustomerID,
        style: Theme
            .of(context)
            .textTheme
            .subtitle2,
      ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: EntryField(
          hint: locale.phoneCustomerID,
        ),
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: EntryField(
          hint: locale.entermPin,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: CustomButton(
          onTap: () =>
              widget.loginInteractor
                  .loginWithID('isoCode', 'mobileNumber'),
          label: locale.signIn,
        ),
      ),
      Spacer(),

      InkWell(
          child: Text(locale.orRegisterToContinue,
            style: Theme
                .of(context)
                .textTheme
                .subtitle1,

          ),
          onTap: () {

            Navigator.pushNamed(context, LoginRoutes.registration);

          }),


    Padding(
    padding: const EdgeInsets.symmetric(vertical: 30.0),
    child: Image.asset(
    'assets/icons/ic_thumb.png',
    scale: 4.5,
    ),
    ),
    Spacer(),
    ],
    ),
    beginOffset: Offset(0, 0.3),
    endOffset: Offset(0, 0),
    slideCurve: Curves
    .
    linearToEaseOut
    ,
    )
    ,
    );
  }
}
