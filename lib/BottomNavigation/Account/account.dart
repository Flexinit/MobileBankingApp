import 'package:animation_wrappers/Animations/faded_scale_animation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Routes/routes.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class AccountOption {
  String title;
  String subtitle;
  Function onTap;

  AccountOption(this.title, this.subtitle, this.onTap);
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<AccountOption> _accountOptions = [
      AccountOption(locale.accTitle1, locale.accSub1, () {}),
      AccountOption(locale.changeLanguage, locale.changeLanguage, () {
        Navigator.pushNamed(context, PageRoutes.languagePage);
      }),
      AccountOption(locale.accTitle2, locale.accSub2, () {
        Navigator.pushNamed(context, PageRoutes.nearbyBanks);
      }),
      AccountOption(locale.accTitle3, locale.accSub3, () {
        Navigator.pushNamed(context, PageRoutes.tnc);
      }),
      AccountOption(locale.accTitle4, locale.accSub4, () {
        Navigator.pushNamed(context, PageRoutes.faqsPage);
      }),
      AccountOption(locale.accTitle5, locale.accSub5, () {
        Navigator.pushNamed(context, PageRoutes.supportPage);
      }),
      AccountOption(locale.accTitle6, locale.accSub6, () {
        Phoenix.rebirth(context);
      }),
    ];
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(locale.account),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, PageRoutes.profilePage);
                },
                contentPadding:
                    EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                leading: FadedScaleAnimation(
                  ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset('assets/userprofile.png')),
                ),
                title: Text(
                  'Sam Smith',
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                      fontSize: 18,
                      color: Theme.of(context).scaffoldBackgroundColor),
                ),
                subtitle: Text(
                  locale.viewProfile,
                  style: Theme.of(context).textTheme.bodyText2.copyWith(
                      fontWeight: FontWeight.w300,
                      color: Theme.of(context).scaffoldBackgroundColor,
                      fontSize: 14),
                ),
              ),
            ),
            ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 12),
                shrinkWrap: true,
                itemCount: _accountOptions.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        dense: true,
                        contentPadding: EdgeInsets.zero,
                        onTap: _accountOptions[index].onTap,
                        title: Text(
                          _accountOptions[index].title,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle1
                              .copyWith(fontWeight: FontWeight.w500),
                        ),
                        subtitle: Text(_accountOptions[index].subtitle),
                      ),
                      Divider(),
                    ],
                  );
                }),

          ],
        ),
      ),
    );
  }
}
