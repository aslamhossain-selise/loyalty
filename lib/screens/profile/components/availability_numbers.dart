import 'package:flutter/material.dart';
import 'package:loyalty/constant.dart';

class AvailabilityNumbers extends StatelessWidget {
  final String title;
  final int number;

  AvailabilityNumbers({
    required this.title,
    required this.number,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              color: kCardColor,
              fontFamily: kFontFamily,
              fontSize: 12,
            ),
          ),
          Text(
            '$number',
            style: TextStyle(
              color: kButtonBgColor,
              fontFamily: kFontFamily,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
