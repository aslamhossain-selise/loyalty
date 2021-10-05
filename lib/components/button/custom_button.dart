import 'package:flutter/material.dart';
import 'package:loyalty/constant.dart';

class CustomButton extends StatelessWidget {
  final Function? onPress;
  final String buttonText;
  final bool isDisabled;

  CustomButton({
    this.onPress,
    required this.buttonText,
    required this.isDisabled,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: MaterialButton(
          onPressed: onPress != null
              ? () {
                  onPress!();
                }
              : null,
          color: kButtonBgColor,
          disabledColor: Color(0xFF2E2E2E),
          child: Text(
            buttonText,
            style: TextStyle(
              fontSize: 20,
              fontFamily: kFontFamily,
              color: isDisabled ? Color(0xFF616161) : kButtonTextColor,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}
