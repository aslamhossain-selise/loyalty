// import 'package:barista/screens/qr_scan/qr_scan_screen.dart';
import 'package:flutter/material.dart';
import 'package:loyalty/constant.dart';
import 'package:loyalty/providers/order_provider.dart';
import 'package:loyalty/screens/edit_profile/edit_profile_screen.dart';
import 'package:loyalty/screens/full_scan_screen/full_scan_screen.dart';
import 'package:loyalty/screens/home/home_screen.dart';
import 'package:loyalty/screens/login/login_screen.dart';
import 'package:loyalty/screens/menu/menu_screen.dart';
import 'package:loyalty/screens/notification/notification_screen.dart';
import 'package:loyalty/screens/profile/profile_screen.dart';
import 'package:loyalty/screens/welcome/welcome_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => Order()),
      ],
      child: Consumer(
        builder: (ctx, auth, child) => MaterialApp(
          title: 'Barista',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            scaffoldBackgroundColor: Colors.black,
            primaryColor: Colors.black,
            textTheme: TextTheme(
              bodyText1: TextStyle(
                color: kBodyTextColor,
                fontFamily: kFontFamily,
                fontWeight: FontWeight.w400,
              ),
              bodyText2: TextStyle(
                color: kBodyTextColor,
                fontFamily: kFontFamily,
                fontSize: 20,
              ),
              headline6: TextStyle(
                color: kBodyTextColor,
                fontFamily: kFontFamily,
                fontSize: 24,
              ),
            ),

            fontFamily: kFontFamily,
            // appBarTheme: AppBarTheme(
            //   color: Colors.black,
            //   elevation: 0,
            // ),
          ),
          home: WelcomeScreen(),
          routes: {
            WelcomeScreen.routeName: (ctx) => WelcomeScreen(),
            LoginScreen.routeName: (ctx) => LoginScreen(),
            HomeScreen.routeName: (ctx) => HomeScreen(),
            FullScanScreen.routeName: (ctx) => FullScanScreen(),
            ProfileScreen.routeName: (ctx) => ProfileScreen(),
            EditProfileScreen.routeName: (ctx) => EditProfileScreen(),
            NotificationScreen.routeName: (ctx) => NotificationScreen(),
            MenuScreen.routeName: (ctx) => MenuScreen(),
          },
        ),
      ),
    );
  }
}
