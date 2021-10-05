import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loyalty/constant.dart';
import 'package:loyalty/screens/edit_profile/edit_profile_screen.dart';
import 'package:loyalty/screens/profile/components/availability_row.dart';

class ProfileScreen extends StatelessWidget {
  static const routeName = '/profile_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF181818),
        actions: [
          IconButton(
            onPressed: () =>
                Navigator.pushNamed(context, EditProfileScreen.routeName),
            icon: SvgPicture.asset('assets/icons/edit.svg'),
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 150,
              decoration: BoxDecoration(
                color: Color(0xFF181818),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20),
                ),
              ),
              width: double.infinity,
              child: Stack(
                alignment: Alignment.center,
                clipBehavior: Clip.none,
                children: [
                  Positioned(
                    bottom: -75,
                    child: CircleAvatar(
                      backgroundColor: kButtonBgColor,
                      radius: 90,
                      child: CircleAvatar(
                        backgroundColor: kButtonTextColor,
                        radius: 86,
                        child: CircleAvatar(
                          radius: 80,
                          backgroundImage: AssetImage('assets/images/user.jpg'),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            ),
            Text(
              'Jhon Doe',
              style: TextStyle(
                color: Colors.white,
                fontFamily: kFontFamily,
                fontWeight: FontWeight.w500,
                fontSize: 24,
              ),
            ),
            Text(
              'Zurich, Switzerland',
              style: TextStyle(
                color: kBodyTextColor,
                fontFamily: kFontFamily,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: kBodyTextColor,
            ),
            SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: AvailabilityRow(),
            ),
            SizedBox(
              height: 10,
            ),
            Divider(
              color: kBodyTextColor,
            ),
          ],
        ),
      ),
    );
  }
}
