import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Components/custom_button.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Theme/colors.dart';

class TransferredSuccessfully extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(locale.done),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Stack(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              color: Theme.of(context).primaryColor,
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
            PositionedDirectional(
                top: 70,
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 28, horizontal: 16),
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(color: Colors.grey[400]),
                    ],
                    borderRadius: BorderRadius.circular(12),
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                  width: MediaQuery.of(context).size.width / 1.1,
                  margin: EdgeInsets.symmetric(horizontal: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(
                        height: 40,
                      ),
                      Text(
                        locale.transferredSuccessfully,
                        style: Theme.of(context).textTheme.headline6,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        locale.transferredTo,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      Text('Emili Williamson',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontSize: 16)),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        locale.from,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      Text('SB 1241 2145 1354 1354',
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontSize: 16)),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                locale.amountTransferred,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(
                                        color: Theme.of(context).hintColor),
                              ),
                              Text('\$ 550.00',
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(fontSize: 16)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                locale.paymentMode,
                                style: Theme.of(context)
                                    .textTheme
                                    .subtitle2
                                    .copyWith(
                                        color: Theme.of(context).hintColor),
                              ),
                              Text(locale.imps,
                                  style: Theme.of(context)
                                      .textTheme
                                      .subtitle2
                                      .copyWith(fontSize: 16)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        locale.remark,
                        style: Theme.of(context)
                            .textTheme
                            .subtitle2
                            .copyWith(color: Theme.of(context).hintColor),
                      ),
                      Text(locale.sendForHomeRent,
                          style: Theme.of(context)
                              .textTheme
                              .subtitle2
                              .copyWith(fontSize: 16)),
                      SizedBox(
                        height: 25,
                      ),
                      Text(
                        locale.sentOnDate,
                        style: Theme.of(context).textTheme.subtitle2.copyWith(
                            color: Theme.of(context).hintColor, fontSize: 10),
                      ),
                    ],
                  ),
                )),
            PositionedDirectional(
              top: 40,
              start: 140,
              end: 140,
              child: CircleAvatar(
                  radius: 40,
                  backgroundColor: secondaryColor,
                  child: Icon(
                    Icons.check,
                    size: 35,
                    color: Theme.of(context).scaffoldBackgroundColor,
                  )),
            ),
            PositionedDirectional(
                bottom: 20,
                start: 0,
                end: 0,
                child: Row(
                  children: [
                    Spacer(
                      flex: 2,
                    ),
                    CustomButton(
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyText2
                          .copyWith(fontSize: 16),
                      label: locale.sendMore,
                      color: Theme.of(context).secondaryHeaderColor,
                      width: 150,
                    ),
                    Spacer(),
                    CustomButton(
                      label: locale.backToHome,
                      width: 150,
                    ),
                    Spacer(
                      flex: 2,
                    ),
                  ],
                ))
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }
}
