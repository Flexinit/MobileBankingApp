import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Components/custom_button.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Routes/routes.dart';
import 'package:opus_banking/Theme/colors.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class Option {
  String image;
  String title;
  Function onTap;
  Option(this.image, this.title, this.onTap);
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<Option> options = [
      Option('assets/icons/ic_account.png', locale.account, () {
        Navigator.pushNamed(context, PageRoutes.accountPage);
      }),
      Option('assets/icons/ic_fund transfer.png', locale.fundTransfer, () {
        Navigator.pushNamed(context, PageRoutes.fundTransfer);
      }),
      Option('assets/icons/ic_statement.png', locale.statement, () {
        Navigator.pushNamed(context, PageRoutes.transactionsPage);
      }),
      Option('assets/icons/ic_loan.png', locale.loans, () {
        Navigator.pushNamed(context, PageRoutes.loansPage);
      }),
      Option('assets/icons/ic_deposite.png', locale.deposits, () {
        Navigator.pushNamed(context, PageRoutes.deposits);
      }),
      Option('assets/icons/ic_more.png', locale.more, () {}),
    ];
    return Scaffold(
      body: ListView(
        physics: BouncingScrollPhysics(),
        children: [
          Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
              Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    height: 150,
                    color: Theme.of(context).primaryColor,
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      'Cloud Pesa',
                      style: Theme.of(context).textTheme.headline6.copyWith(
                          color: Theme.of(context).scaffoldBackgroundColor),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  GridView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      padding: EdgeInsets.only(top: 90),
                      itemCount: options.length,
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: options[index].onTap,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              index <= 2
                                  ? Divider(
                                indent: 25,
                                endIndent: 25,
                              )
                                  : SizedBox.shrink(),
                              FadedScaleAnimation(
                                Image.asset(
                                  options[index].image,
                                  scale: 3,
                                ),
                              ),
                              Text(options[index].title),
                              SizedBox(
                                height: 12,
                              ),
                              Divider(
                                indent: 25,
                                endIndent: 25,
                              ),
                            ],
                          ),
                        );
                      }),
                  GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, PageRoutes.travelLoans);
                      },
                      child: FadedScaleAnimation(
                          Image.asset('assets/offer 1.png'))),
                  SizedBox(
                    height: 15,
                  ),
                  FadedScaleAnimation(Image.asset('assets/offer 2.png')),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 60.0),
                child: SizedBox(
                  height: 160,
                  child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return FadedScaleAnimation(
                          Container(
                            width: 250,
                            margin: EdgeInsets.only(left: 12),
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 15),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),
                              image: DecorationImage(
                                  image: AssetImage('assets/bg.png'),
                                  fit: BoxFit.fill),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  locale.savingAccount,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(color: textFieldBackground),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 6.0),
                                  child: Text(
                                    '0014 1241 5574',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline6
                                        .copyWith(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor),
                                  ),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(vertical: 4.0),
                                  child: CustomButton(
                                    height: 40,
                                    width: 120,
                                    padding: 0,
                                    color: Theme.of(context).primaryColor,
                                    label: locale.checkBalance,
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .bodyText2
                                        .copyWith(
                                        color: Theme.of(context)
                                            .scaffoldBackgroundColor),
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  locale.statement,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyText1
                                      .copyWith(
                                      color:
                                      Theme.of(context).primaryColor),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
