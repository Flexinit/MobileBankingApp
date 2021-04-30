import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Theme/colors.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class Transact {
  String title;
  String subtitle;
  double price;
  bool isRed;

  Transact(this.title, this.subtitle, this.price, this.isRed);
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<Transact> recentTransactions = [
      Transact('Burger King', locale.randomDate, 20.00, true),
      Transact(
          'Received - Emili Williamson', locale.randomDate, 1000.00, false),
      Transact('McDonalds', locale.randomDate, 20.00, true),
      Transact('Mobile Recharge', locale.randomDate, 35.00, true),
      Transact('Donation', locale.randomDate, 10.00, true),
      Transact('Burger King', locale.randomDate, 20.00, true),
      Transact(
          'Received - Emili Williamson', locale.randomDate, 1000.00, false),
      Transact('McDonalds', locale.randomDate, 20.00, true),
      Transact('Mobile Recharge', locale.randomDate, 35.00, true),
      Transact('Donation', locale.randomDate, 10.00, true),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(locale.transactions),
        centerTitle: false,
        backgroundColor: redColor,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: Column(
                children: [
                  FadedScaleAnimation(
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('assets/bg.png'),
                            fit: BoxFit.fill),
                      ),
                      child: Row(
                        children: [
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: locale.savingAccount + '\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: textFieldBackground,
                                        fontSize: 12)),
                            TextSpan(
                                text: '**** **** 5574',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        height: 1.4)),
                          ])),
                          Spacer(),
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: locale.availableBalance + '\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: textFieldBackground,
                                        fontSize: 12)),
                            TextSpan(
                                text: '\$ 2564.50',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        height: 1.4)),
                          ])),
                        ],
                      ),
                    ),
                  ),
                  FadedScaleAnimation(
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 18, horizontal: 18),
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                            image: AssetImage('assets/bg.png'),
                            fit: BoxFit.fill),
                      ),
                      child: Row(
                        children: [
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: locale.currentAccount + '\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: textFieldBackground,
                                        fontSize: 12)),
                            TextSpan(
                                text: '**** **** 2415',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        height: 1.4)),
                          ])),
                          Spacer(),
                          RichText(
                              text: TextSpan(children: <TextSpan>[
                            TextSpan(
                                text: locale.availableBalance + '\n',
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle1
                                    .copyWith(
                                        color: textFieldBackground,
                                        fontSize: 12)),
                            TextSpan(
                                text: '\$ 8700.00',
                                style: Theme.of(context)
                                    .textTheme
                                    .headline6
                                    .copyWith(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor,
                                        height: 1.4)),
                          ])),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
      ),
    );
  }
}
