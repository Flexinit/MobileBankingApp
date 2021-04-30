import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:international_phone_input/international_phone_input.dart';
import 'package:opus_banking/Auth/Registration/UI/registration_interactor.dart';
import 'package:opus_banking/Components/custom_button.dart';
import 'package:opus_banking/Components/entry_field.dart';
import 'package:opus_banking/Locale/locale.dart';

class RegistrationUI extends StatefulWidget {
  final RegistrationInteractor registrationInteractor;
  final String phoneNumber;

  RegistrationUI(this.registrationInteractor, this.phoneNumber);

  @override
  _RegistrationUIState createState() => _RegistrationUIState();
}

class _RegistrationUIState extends State<RegistrationUI> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final TextEditingController _accountNumberController =
      TextEditingController();

  String phoneNumber;
  String phoneIsoCode;
  bool hidePass = true;

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _accountNumberController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
      ),
      body: FadedSlideAnimation(
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.17,
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Spacer(),
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: 24),
                          children: <TextSpan>[
                        TextSpan(text: 'Mobile '),
                        TextSpan(
                            text: 'Banking ',
                            style: TextStyle(fontWeight: FontWeight.w300)),
/*                        TextSpan(
                            text: 'Registration',
                            style: TextStyle(fontWeight: FontWeight.w300)),*/
                      ])),
                  Spacer(
                    flex: 4,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              locale.registerWithYourBankingDetails,
              style: Theme.of(context).textTheme.subtitle2,
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
            /* Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: EntryField(
                hint: locale.enterAccountNumber,
                prefixIcon: Icons.account_balance,

              ),
              ),*/

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                controller: _accountNumberController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: locale.enterAccountNumber,
                  labelStyle: GoogleFonts.quicksand(color: Color(0xff39c526)),
                  icon: Icon(Icons.account_balance_wallet_outlined),
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
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                controller: _passwordController,
                obscureText: hidePass,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: locale.entermPin,
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
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: TextFormField(
                controller: _confirmPasswordController,
                obscureText: hidePass,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: locale.confirmPassword,
                  labelStyle: GoogleFonts.quicksand(color: Color(0xff39c526)),
                  icon: Icon(Icons.lock_outline),
                ),
                validator: (value) {
                  if (value.isEmpty) {
                    return locale.mPinFieldEmpty;
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
                onTap: () => widget.registrationInteractor
                    .register('phoneNumber', 'name', 'email'),
              ),
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Text(locale.youWillReceiveOTPonRegPhone,
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.subtitle1),
            ),
            Spacer(
              flex: 5,
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
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
