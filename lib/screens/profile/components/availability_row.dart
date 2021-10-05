import 'package:flutter/material.dart';
import 'package:loyalty/constant.dart';
import 'package:loyalty/screens/profile/components/availability_numbers.dart';

class AvailabilityRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AvailabilityNumbers(
          title: 'Available stamps ',
          number: 9,
        ),
        SizedBox(
          height: 30,
          width: 50,
          child: VerticalDivider(
            color: kBodyTextColor,
          ),
        ),
        AvailabilityNumbers(
          title: 'Redemption available',
          number: 0,
        ),
        SizedBox(
          height: 30,
          width: 50,
          child: VerticalDivider(
            color: kBodyTextColor,
          ),
        ),
        AvailabilityNumbers(
          title: 'Number of visits',
          number: 8,
        ),
      ],
    );
  }
}
