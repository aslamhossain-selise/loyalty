import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loyalty/constant.dart';
import 'package:loyalty/screens/home/home_screen.dart';
import 'package:loyalty/screens/menu/menu_screen.dart';
import 'package:loyalty/screens/notification/notification_screen.dart';
import 'package:loyalty/screens/profile/profile_screen.dart';

class Home extends StatefulWidget {
  static const routeName = '/home';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;
  List<Widget> pageList = [
    HomeScreen(),
    ProfileScreen(),
    NotificationScreen(),
    MenuScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kButtonTextColor,
        selectedItemColor: kButtonBgColor,
        currentIndex: currentIndex,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/home.svg',
              color: currentIndex == 0 ? kButtonBgColor : null,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/user.svg',
              color: currentIndex == 1 ? kButtonBgColor : null,
            ),
            label: 'User',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/notification.svg',
              color: currentIndex == 2 ? kButtonBgColor : null,
            ),
            label: 'Notification',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              'assets/icons/menu.svg',
              color: currentIndex == 3 ? kButtonBgColor : null,
            ),
            label: 'Menu',
          ),
        ],
      ),
      body: pageList[currentIndex],
    );
  }
}
