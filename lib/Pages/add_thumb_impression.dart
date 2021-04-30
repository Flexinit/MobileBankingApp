import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Routes/routes.dart';

class AssignThumbImpression extends StatefulWidget {
  @override
  _AssignThumbImpressionState createState() => _AssignThumbImpressionState();
}

class _AssignThumbImpressionState extends State<AssignThumbImpression> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.assignThumbImpression),
      ),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 20,
            ),
            Text(
              locale.enterYourThumbImpression + '\n' + locale.timesToAssign,
              style: Theme.of(context)
                  .textTheme
                  .subtitle2
                  .copyWith(color: Theme.of(context).hintColor, fontSize: 15),
              textAlign: TextAlign.center,
            ),
            Spacer(
              flex: 3,
            ),
            GestureDetector(
              onTap: () => Navigator.pushNamed(context, PageRoutes.homePage),
              child: FadedScaleAnimation(
                Image.asset(
                  'assets/icons/ic_thumb.png',
                  height: 100,
                ),
              ),
            ),
            Spacer(
              flex: 3,
            ),
            Text(
              locale.tips +
                  '\n' +
                  locale.tryToTapWithDifferentSidesOfThumb +
                  '\n' +
                  locale.addOftenlyUsedThumbToAssign +
                  '\n' +
                  locale.youCanChangeThumbImpressionLater,
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .subtitle1
                  .copyWith(color: Theme.of(context).hintColor),
            ),
            Spacer(),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
