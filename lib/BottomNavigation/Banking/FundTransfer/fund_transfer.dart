import 'package:animation_wrappers/Animations/faded_translation_animation.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Routes/routes.dart';

class FundTransfer extends StatefulWidget {
  @override
  _FundTransferState createState() => _FundTransferState();
}

class Trans {
  String title;
  String subtitle;
  Function onTap;
  Trans(this.title, this.subtitle, this.onTap);
}

class _FundTransferState extends State<FundTransfer> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    List<Trans> transaction = [
      Trans(locale.fundTransfer, locale.withinBank, () {
        Navigator.pushNamed(context, PageRoutes.fundTransferWithinBank);
      }),
      Trans(locale.fundTransfer, locale.toOtherBank, () {}),
      Trans(locale.imps, locale.quickTransferMode, () {
        Navigator.pushNamed(context, PageRoutes.impsQuickTransferMode);
      }),
      Trans(locale.neft, locale.transferMoney, () {}),
      Trans(locale.rtgs, locale.easiestModeToTransfer, () {}),
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.fundTransfer),
      ),
      body: FadedSlideAnimation(
        ListView.builder(
            itemCount: transaction.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return Card(
                child: ListTile(
                  onTap: transaction[index].onTap,
                  leading: Image.asset(
                    'assets/icons/ic_transfer.png',
                    scale: 3,
                  ),
                  title: Text(transaction[index].title),
                  subtitle: Text(transaction[index].subtitle),
                ),
              );
            }),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
