import 'package:animation_wrappers/animation_wrappers.dart';
import 'package:flutter/material.dart';
import 'package:opus_banking/Components/custom_button.dart';
import 'package:opus_banking/Components/label_entry_field.dart';
import 'package:opus_banking/Locale/locale.dart';

class AddBeneficiary extends StatefulWidget {
  @override
  _AddBeneficiaryState createState() => _AddBeneficiaryState();
}

class _AddBeneficiaryState extends State<AddBeneficiary> {
  @override
  Widget build(BuildContext context) {
    var locale = AppLocalizations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(locale.addBeneficiary),
      ),
      body: FadedSlideAnimation(
        Padding(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 12),
          child: Column(
            children: [
              LabelEntryField(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                title: locale.beneficiaryBank,
                suffixIcon: Icon(Icons.arrow_drop_down),
                hint: 'SB 1212 5453 4654 3215',
              ),
              LabelEntryField(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                title: locale.beneficiaryFullName,
                hint: 'Choose Beneficiary',
              ),
              LabelEntryField(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                title: locale.beneficiaryBankAccount,
                hint: '1111 2222 3333 4444',
              ),
              LabelEntryField(
                fillColor: Theme.of(context).scaffoldBackgroundColor,
                title: locale.transferLimit,
                hint: '\$ 500.0',
              ),
              Spacer(),
              CustomButton(
                label: locale.submit,
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
