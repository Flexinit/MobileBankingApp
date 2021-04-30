import 'package:flutter/material.dart';
import 'package:opus_banking/Theme/colors.dart';

class LabelEntryField extends StatelessWidget {
  final String title;
  final String hint;
  final Icon suffixIcon;
  final String trailingTitle;
  final Function trailingTitleOnTap;
  final Color fillColor;
  final bool noBorder;

  LabelEntryField(
      {this.title,
      this.hint,
      this.suffixIcon,
      this.trailingTitle,
      this.trailingTitleOnTap,
      this.fillColor,
      this.noBorder});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                title,
                style: Theme.of(context).textTheme.headline6,
              ),
              Spacer(),
              GestureDetector(
                onTap: trailingTitleOnTap,
                child: Text(
                  trailingTitle ?? '',
                  style: Theme.of(context).textTheme.subtitle2.copyWith(
                      fontSize: 15, color: Theme.of(context).primaryColor),
                ),
              )
            ],
          ),
          SizedBox(
            height: 6,
          ),
          TextField(
            decoration: InputDecoration(
                filled: true,
                fillColor: fillColor ?? textFieldBackground,
                contentPadding: EdgeInsets.symmetric(horizontal: 16),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: noBorder == null || !noBorder
                        ? BorderSide(
                            color: Theme.of(context).hintColor, width: 0.2)
                        : BorderSide.none),
                hintText: hint,
                suffixIcon: suffixIcon),
          ),
        ],
      ),
    );
  }
}
