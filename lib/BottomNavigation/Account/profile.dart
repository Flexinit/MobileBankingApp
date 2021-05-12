import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Components/custom_button.dart';
import 'package:opus_banking/Locale/locale.dart';
import 'package:opus_banking/Routes/AppConfig.dart';
import 'package:opus_banking/Theme/colors.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    AppConfig.getMemberData();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(locale.profile),
      ),
      body: FadedSlideAnimation(
        Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 180,
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).scaffoldBackgroundColor,
                ),
                Container(
                  height: 100,
                  width: MediaQuery.of(context).size.width,
                  color: Theme.of(context).primaryColor,
                ),
                PositionedDirectional(
                  start: MediaQuery.of(context).size.width / 2.75,
                  // end: 0,
                  top: 40,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.width),
                      child: FadedScaleAnimation(
                        Image.asset(
                          'assets/userprofile.png',
                          height: 110,
                        ),
                      )),
                ),
                PositionedDirectional(
                    top: 40,
                    start: MediaQuery.of(context).size.width / 1.75,
                    child: CircleAvatar(
                      radius: 15,
                      backgroundColor: secondaryColor,
                      child: Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: Theme.of(context).scaffoldBackgroundColor,
                      ),
                    ))
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                children: [
                  buildTextField(
                    context,
                    locale.fullName,
                    AppConfig.name,
                  ),
                  buildTextField(
                    context,
                    locale.emailAddress,
                    'samsmith@mail.com',
                  ),
                  buildTextField(
                    context,
                    locale.IDNumber,
                    AppConfig.id_no,
                  ),
                  buildTextField(
                    context,
                    locale.accountNumber,
                    '1142 1154 3652 5826',
                  ),
                  buildTextField(
                    context,
                    locale.mobileNumber,
                    AppConfig.mobileNo
                  ),

                  buildTextField(
                      context,
                      locale.unique_id,
                      AppConfig.unique_id
                  ),
                ],
              ),
            ),
            Spacer(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
              child: CustomButton(
                label: locale.updateProfile,
              ),
            )
          ],
        ),
        beginOffset: Offset(0, 0.3),
        endOffset: Offset(0, 0),
        slideCurve: Curves.linearToEaseOut,
      ),
    );
  }

  Widget buildTextField(context, String label, String initialValue,
      {bool readOnly, int maxLines}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      child: TextFormField(
        style: Theme.of(context).textTheme.subtitle2.copyWith(fontSize: 16),
        initialValue: initialValue,
        readOnly: readOnly ?? false,
        maxLines: maxLines ?? 1,
        decoration: InputDecoration(
          labelText: label,
        ),
      ),
    );
  }
}
