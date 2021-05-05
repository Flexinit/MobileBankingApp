import 'package:animation_wrappers/Animations/faded_translation_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:international_phone_input/international_phone_input.dart';
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
  final TextEditingController _passwordController = TextEditingController();

  String phoneNumber;
  String phoneIsoCode;
  bool hidePass = true;

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
                      TextSpan(text: 'Cloud '),
                      TextSpan(
                          text: 'Pesa',
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
                child: InternationalPhoneInput(
                  onPhoneNumberChange: onPhoneNumberChange,
                  initialPhoneNumber: phoneNumber,
                  initialSelection: phoneIsoCode,
                  enabledCountries: ['+254', '+255', '+256'],
                  showCountryCodes: true,
                  showCountryFlags: true,
                  labelText: locale.phoneCustomerID,
                ),
                //child: EntryField(
                // hint: locale.emailCustomerID,
                //),
              ),
      /*Padding(
        padding: EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: EntryField(
          hint: locale.phoneCustomerID,
        ),
      ),*/
   /*   Padding(
        padding: EdgeInsets.symmetric(horizontal: 25),
        child: EntryField(
          hint: locale.entermPin,
        ),
      ),*/

              Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: TextFormField(
                  controller: _passwordController,
                  obscureText: hidePass,
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: locale.enterIDNumber,
                    labelStyle: GoogleFonts.quicksand(color: Color(0xff39c526)),
                    icon: Icon(Icons.lock_outline),
                  ),
                  validator: (value) {
                    if (value.isEmpty) {
                      return locale.passwordFieldEmpty;
                    } else if (value.length < 6) {
                      return locale.passwordLength;
                    }
                    return null;
                  },
                ),
                // child: EntryField(
                //   hint: locale.entermPin,
                // ),
              ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 12),
        child: CustomButton(
          onTap: () =>
              widget.loginInteractor
                  .loginWithID(phoneNumber, _passwordController.value.toString()),
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
  void onPhoneNumberChange(
      String number, String internationalizedPhoneNumber, String isoCode) {
    print(number);
    setState(() {
      phoneNumber = number;
      phoneIsoCode = isoCode;
    });
  }
}
