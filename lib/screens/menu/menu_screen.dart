import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loyalty/constant.dart';

class MenuScreen extends StatelessWidget {
  static const routeName = '/manu_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kButtonTextColor,
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/receipt.svg'),
                  SizedBox(
                    width: 30,
                  ),
                  Text(
                    'Order history',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
