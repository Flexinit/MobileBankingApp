import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Components/custom_button.dart';
import 'package:opus_banking/Components/label_entry_field.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Routes/routes.dart';
import 'package:opus_banking/Theme/colors.dart';

class TravelLoan extends StatefulWidget {
  @override
  _TravelLoanState createState() => _TravelLoanState();
}

class _TravelLoanState extends State<TravelLoan> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: textFieldBackground,
      appBar: AppBar(
        title: Text(locale.travelLoan),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Column(
          children: [
            FadedScaleAnimation(Image.asset('assets/offer 1.png')),
            Container(
              color: Theme.of(context).scaffoldBackgroundColor,
              padding: const EdgeInsets.all(16.0),
              child: Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.\n\nDuis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
            ),
            Expanded(
                child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
              child: Column(
                children: [
                  LabelEntryField(
                    noBorder: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    title: locale.phoneNumber,
                    hint: locale.enterYourPhoneNumber,
                  ),
                  LabelEntryField(
                    noBorder: true,
                    fillColor: Theme.of(context).scaffoldBackgroundColor,
                    title: locale.yourMessage,
                    hint: locale.enterYourMsg,
                  ),
                  Spacer(),
                  CustomButton(
                    onTap: () {
                      Navigator.pushNamed(context, PageRoutes.loanStatement);
                    },
                    label: locale.iAmInterested,
                  )
                ],
              ),
            ))
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
