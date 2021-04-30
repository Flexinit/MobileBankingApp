import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Components/custom_button.dart';
import 'package:opus_banking/Components/label_entry_field.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Routes/routes.dart';

class IMPSQuickTransferMode extends StatefulWidget {
  @override
  _IMPSQuickTransferModeState createState() => _IMPSQuickTransferModeState();
}

class _IMPSQuickTransferModeState extends State<IMPSQuickTransferMode> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: ListTile(
          title: Text(
            locale.imps,
            style: Theme.of(context).textTheme.subtitle1.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.w500),
          ),
          subtitle: Text(
            locale.quickTransferMode,
            style: Theme.of(context).textTheme.bodyText2.copyWith(
                color: Theme.of(context).scaffoldBackgroundColor,
                fontWeight: FontWeight.w200,
                fontSize: 12),
          ),
        ),
      ),
      body: FadedSlideAnimation(
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
            child: Column(
              children: [
                LabelEntryField(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  title: locale.fromAccount,
                  hint: 'SB 1144 2254 2665 9842',
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                LabelEntryField(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  title: locale.accountHolderName,
                  hint: 'ABC PVT. LTD',
                  suffixIcon: Icon(Icons.arrow_drop_down),
                ),
                LabelEntryField(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  title: locale.accountNumber,
                  hint: '1234 5678 1234 56789',
                ),
                LabelEntryField(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  title: locale.bankName,
                  hint: 'HXDC Bank of India',
                ),
                LabelEntryField(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  title: locale.ifscCode,
                  hint: 'HXDC000012121',
                ),
                LabelEntryField(
                  fillColor: Theme.of(context).scaffoldBackgroundColor,
                  trailingTitle: '100 500 1000 2000',
                  title: locale.enterAmount,
                  hint: '0.00',
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  label: locale.transferNow,
                  onTap: () {
                    Navigator.pushNamed(
                        context, PageRoutes.transferredSuccessfully);
                  },
                ),
              ],
            ),
          ),
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
