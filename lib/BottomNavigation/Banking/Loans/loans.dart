import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Components/loan_card.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Routes/routes.dart';

class LoansPage extends StatefulWidget {
  @override
  _LoansPageState createState() => _LoansPageState();
}

class _LoansPageState extends State<LoansPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(locale.loans),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Column(
                children: [
                  LoanCard(),
                  LoanCard(),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                  left: 12.0, right: 12.0, top: 16.0, bottom: 12.0),
              child: Text(
                locale.loanOffersAvailable,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Theme.of(context).hintColor, fontSize: 12),
              ),
            ),
            GestureDetector(
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.travelLoans);
                },
                child: FadedScaleAnimation(Image.asset('assets/offer 1.png'))),
            SizedBox(
              height: 15,
            ),
            FadedScaleAnimation(Image.asset('assets/offer 2.png')),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
