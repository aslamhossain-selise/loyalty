import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loyalty/components/button/custom_button.dart';
import 'package:loyalty/constant.dart';
import 'package:loyalty/screens/profile/profile_screen.dart';

class ScanScreen extends StatelessWidget {
  static const routeName = '/scan_screen';

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        automaticallyImplyLeading: false,
        leading: CupertinoButton(
          padding: EdgeInsets.all(0),
          child: SvgPicture.asset(
            'assets/icons/nav_logo.svg',
            width: 40,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        backgroundColor: kButtonTextColor,
        trailing: CupertinoButton(
          onPressed: () {},
          padding: EdgeInsets.all(0),
          child: Container(
            width: 200,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Image.asset(
                  'assets/images/user.png',
                  width: 32,
                ),
                Text(
                  'Daniel Brunner',
                  style: TextStyle(
                    color: CupertinoColors.white,
                  ),
                ),
                SvgPicture.asset('assets/icons/keyboard_arrow_down.svg'),
              ],
            ),
          ),
        ),
      ),
      child: Column(
        children: [
          Spacer(),
          Image.asset('assets/icons/scan_camera.png'),
          Spacer(),
          CustomButton(
            onPress: () =>
                Navigator.pushNamed(context, ProfileScreen.routeName),
            buttonText: 'Click to Scan',
            isDisabled: false,
          ),
        ],
      ),
    );
  }
}
