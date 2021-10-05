import 'package:flutter/material.dart';
import 'package:loyalty/components/button/custom_button.dart';
import 'package:loyalty/screens/login/login_screen.dart';

class WelcomeScreen extends StatelessWidget {
  static const routeName = '/welcome_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(),
        child: Column(
          children: [
            Image.asset('assets/images/welcome_coffee.png'),
            Spacer(),
            Center(
              child: Column(
                children: [
                  Image.asset(
                    'assets/images/logo.png',
                    width: 120,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Welcome to Barista App',
                    style: Theme.of(context).textTheme.bodyText2,
                  ),
                ],
              ),
            ),
            Spacer(),
            CustomButton(
              onPress: () =>
                  Navigator.pushNamed(context, LoginScreen.routeName),
              buttonText: 'Login/Registration',
              isDisabled: false,
            ),
          ],
        ),
      ),
    );
  }
}
