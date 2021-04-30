import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Theme/colors.dart';

class SupportPage extends StatefulWidget {
  @override
  _SupportPageState createState() => _SupportPageState();
}

class _SupportPageState extends State<SupportPage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      backgroundColor: textFieldBackground,
      appBar: AppBar(
        elevation: 0,
        title: Text(locale.support),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.2,
              color: Theme.of(context).primaryColor,
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Spacer(),
                  RichText(
                      text: TextSpan(
                          style: Theme.of(context).textTheme.bodyText1.copyWith(
                              color: Theme.of(context).scaffoldBackgroundColor,
                              fontSize: 24),
                          children: <TextSpan>[
                        TextSpan(text: 'Opus '),
                        TextSpan(
                            text: 'Banking',
                            style: TextStyle(fontWeight: FontWeight.w300)),
                      ])),
                  Spacer(
                    flex: 2,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    locale.wereHere,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontSize: 17),
                  ),
                  SizedBox(
                    height: 18,
                  ),
                  Text(
                    locale.fragmentPark,
                    style: Theme.of(context).textTheme.subtitle1.copyWith(
                        color: Theme.of(context).hintColor, fontSize: 15),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    locale.connectUs,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.call,
                      color: secondaryColor,
                    ),
                    title: Text(
                      '+1 987 654 3210',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontSize: 16),
                    ),
                  ),
                  ListTile(
                    dense: true,
                    contentPadding: EdgeInsets.zero,
                    leading: Icon(
                      Icons.mail,
                      color: secondaryColor,
                    ),
                    title: Text(
                      'help@opusbanking.com',
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2
                          .copyWith(fontSize: 16),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              decoration: BoxDecoration(
                  color: Theme.of(context).scaffoldBackgroundColor,
                  borderRadius: BorderRadius.circular(8)),
              margin: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text(
                    locale.writeUsDirectly,
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2
                        .copyWith(fontSize: 17),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.mail,
                        size: 18,
                        color: secondaryColor,
                      ),
                      Spacer(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.35,
                        child: TextFormField(
                          decoration: InputDecoration(
                            hintText: locale.yourMessage,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
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
