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
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Column(
          children: [
            SingleMenuItem(
              img: 'assets/icons/receipt.svg',
              itemName: 'Order history',
            ),
            SingleMenuItem(
              img: 'assets/icons/settings.svg',
              itemName: 'Settings',
            ),
            SingleMenuItem(
              img: 'assets/icons/like.svg',
              itemName: 'Rate us',
            ),
            SingleMenuItem(
              img: 'assets/icons/help.svg',
              itemName: 'Help',
            ),
            SingleMenuItem(
              img: 'assets/icons/log_out.svg',
              itemName: 'Log out',
            ),
          ],
        ),
      ),
    );
  }
}

class SingleMenuItem extends StatelessWidget {
  final String img;
  final String itemName;

  SingleMenuItem({
    required this.img,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Row(
          children: [
            SvgPicture.asset(img),
            SizedBox(
              width: 20,
            ),
            Text(
              itemName,
              style: Theme.of(context).textTheme.bodyText2,
            ),
          ],
        ),
      ),
    );
  }
}
