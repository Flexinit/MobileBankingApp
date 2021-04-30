import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Components/custom_button.dart';
import 'package:opus_banking/Components/label_entry_field.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Theme/colors.dart';

class MakeDepositPage extends StatefulWidget {
  @override
  _MakeDepositPageState createState() => _MakeDepositPageState();
}

class _MakeDepositPageState extends State<MakeDepositPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: textFieldBackground,
      appBar: AppBar(
        elevation: 0,
        title: Text(locale.makeADeposit),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Column(
          children: [
            Container(
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
              child: Column(
                children: [
                  FadedScaleAnimation(
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                      height: 110,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                              image: AssetImage('assets/cheque_sample.png'),
                              fit: BoxFit.fill)),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            locale.frontSide,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                          ),
                          Spacer(),
                          Text(
                            locale.delete,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText1
                                .copyWith(
                                    color: redColor,
                                    fontWeight: FontWeight.w700),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  FadedScaleAnimation(
                    Container(
                      padding: EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: secondaryColor,
                      ),
                      child: Stack(
                        children: [
                          Text(
                            locale.backSide,
                            style: Theme.of(context)
                                .textTheme
                                .bodyText2
                                .copyWith(
                                    color: Theme.of(context)
                                        .scaffoldBackgroundColor),
                          ),
                          Center(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 18.0),
                              child: CircleAvatar(
                                backgroundColor:
                                    Theme.of(context).scaffoldBackgroundColor,
                                radius: 28,
                                child: Icon(
                                  Icons.camera_alt,
                                  color: secondaryColor,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
              child: LabelEntryField(
                noBorder: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                title: locale.depositTo,
                hint: locale.selectAccount,
                suffixIcon: Icon(Icons.arrow_drop_down),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
              child: LabelEntryField(
                noBorder: true,
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                title: locale.amount,
                hint: '0.00',
              ),
            ),
            Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
              child: CustomButton(
                label: locale.transferNow,
              ),
            ),
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
