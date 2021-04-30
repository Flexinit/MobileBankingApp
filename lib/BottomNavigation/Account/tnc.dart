import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Locale/locale.dart';

class TermsConditions extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.tnc),
        centerTitle: true,
      ),
      body: FadedSlideAnimation(
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
          child: ListView(
            children: [
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi at nisl vel mi maximus interdum. Proin condimentum, felis in vulputate faucibus, enim nulla molestie elit, a placerat nulla erat sit amet quam.\n\nSed eu justo sed velit ornare accumsan eget ac nisi. Aenean pellentesque fermentum aliquet. Pellentesque ultrices urna arcu.',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                locale.termsOfUse,
                style: Theme.of(context)
                    .textTheme
                    .subtitle2
                    .copyWith(fontSize: 15),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi at nisl vel mi maximus interdum. Proin condimentum, felis in vulputate faucibus, enim nulla molestie elit, a placerat nulla erat sit amet quam. Nunc aliquam lorem finibus est ullamcorper, nec auctor odio mattis. Orci varius natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Aliquam tortor libero, malesuada ac viverra quis, venenatis eu orci.\n\nSed eu justo sed velit ornare accumsan eget ac nisi. Aenean pellentesque fermentum aliquet. Pellentesque ultrices urna arcu.\n\nSed eu justo sed velit ornare accumsan eget ac nisi. Aenean pellentesque fermentum aliquet. Pellentesque ultrices urna arcu.\n\n Fusce lacinia malesuada pulvinar. Nullam dignissim lacus ultrices molestie porta. In auctor lacus quis tincidunt sodales. Duis lacus libero, semper id tincidunt a, tristique vitae nisl.',
                style: Theme.of(context)
                    .textTheme
                    .subtitle1
                    .copyWith(fontSize: 15),
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
