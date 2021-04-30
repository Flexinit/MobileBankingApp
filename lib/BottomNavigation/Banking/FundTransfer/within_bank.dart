import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Components/custom_button.dart';
import 'package:opus_banking/Components/label_entry_field.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Routes/routes.dart';

class FundTransferWithinBank extends StatefulWidget {
  @override
  _FundTransferWithinBankState createState() => _FundTransferWithinBankState();
}

class _FundTransferWithinBankState extends State<FundTransferWithinBank> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            locale.fundTransfer,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            locale.withinBank,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.w200,
                fontSize: 12),
          ),
        ),
      ),
      body: FadedSlideAnimation(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            children: [
              LabelEntryField(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                title: locale.fromAccount,
                hint: 'SB 1144 5565 5872 9513',
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
              LabelEntryField(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  trailingTitleOnTap: () {
                    Navigator.pushNamed(context, PageRoutes.addBeneficiary);
                  },
                  trailingTitle: locale.addBeneficiary,
                  title: locale.toAccount,
                  hint: locale.chooseBeneficiary,
                  suffixIcon: Icon(Icons.arrow_drop_down)),
              LabelEntryField(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                trailingTitle: '100 500 1000 2000',
                title: locale.enterAmount,
                hint: '0.00',
              ),
              LabelEntryField(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                title: locale.remark,
                hint: locale.enterRemark,
              ),
              Spacer(),
              CustomButton(
                onTap: () {
                  Navigator.pushNamed(
                      context, PageRoutes.transferredSuccessfully);
                },
                label: locale.transferNow,
              ),
            ],
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
