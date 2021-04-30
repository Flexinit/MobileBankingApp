import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Theme/colors.dart';

class LoanCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return FadedScaleAnimation(
      Container(
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 18),
        margin: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
                image: AssetImage('assets/bg.png'), fit: BoxFit.fill)),
        child: Column(
          children: [
            Row(
              children: [
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: locale.homeLoan + '\n',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: secondaryColor, fontSize: 14)),
                  TextSpan(
                      text: '**** **** 5574',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          height: 1.4)),
                ])),
                Spacer(),
                Text(
                  locale.viewStatement,
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2
                      .copyWith(color: Theme.of(context).primaryColor),
                )
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: locale.dueAmount + '\n',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: textFieldBackground, fontSize: 12)),
                  TextSpan(
                      text: '\$ 80000.00',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          height: 1.4)),
                ])),
                Spacer(
                  flex: 5,
                ),
                RichText(
                    text: TextSpan(children: <TextSpan>[
                  TextSpan(
                      text: locale.emi + '\n',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(color: textFieldBackground, fontSize: 12)),
                  TextSpan(
                      text: '\$ 700.00',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor,
                          height: 1.4)),
                ])),
                Spacer(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
