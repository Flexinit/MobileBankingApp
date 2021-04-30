import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/BottomNavigation/Transactions/transactions.dart';
import 'package:opus_banking/Components/loan_card.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Theme/colors.dart';

class LoanStatement extends StatefulWidget {
  @override
  _LoanStatementState createState() => _LoanStatementState();
}

class _LoanStatementState extends State<LoanStatement> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<Transact> recentTransactions = [
      Transact(locale.emiDebited, '12 June 2019', 1000.00, true),
      Transact(locale.emiDebited, '12 June 2019', 1000.00, true),
      Transact(locale.emiDebited, '12 June 2019', 1000.00, true),
      Transact(locale.emiDebited, '12 June 2019', 1000.00, true),
      Transact(locale.emiDebited, '12 June 2019', 1000.00, true),
      Transact(locale.emiDebited, '12 June 2019', 1000.00, true),
      Transact(locale.emiDebited, '12 June 2019', 1000.00, true),
      Transact(locale.emiDebited, '12 June 2019', 1000.00, true),
      Transact(locale.emiDebited, '12 June 2019', 1000.00, true),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(locale.loanStatement),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        ListView(
          physics: BouncingScrollPhysics(),
          children: [
            Container(
              padding: EdgeInsets.symmetric(vertical: 12),
              color: Theme.of(context).primaryColor,
              child: LoanCard(),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 12),
              child: Text(
                locale.recentTransactions,
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(color: Theme.of(context).hintColor, fontSize: 12),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: recentTransactions.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      recentTransactions[index].title,
                      style: Theme.of(context)
                          .textTheme
                          .subtitle1
                          .copyWith(fontWeight: FontWeight.w500),
                    ),
                    subtitle: Text(
                      recentTransactions[index].subtitle,
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                          color: Theme.of(context).hintColor),
                    ),
                    trailing: Text(
                      '\$ ' + recentTransactions[index].price.toString(),
                      style: Theme.of(context).textTheme.subtitle2.copyWith(
                          color: recentTransactions[index].isRed
                              ? redColor
                              : secondaryColor),
                    ),
                  );
                })
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
