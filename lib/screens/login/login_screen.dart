import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loyalty/components/button/custom_button.dart';
import 'package:loyalty/constant.dart';
import 'package:loyalty/screens/home/home.dart';

class LoginScreen extends StatefulWidget {
  static const routeName = '/login_screen';

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isDisabled = true;
  String? email;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kButtonTextColor,
        leading: IconButton(
          icon: SvgPicture.asset('assets/icons/arrow_back.svg'),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [],
      ),
      body: Container(
          child: Column(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 40),
            child: Form(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Enter your email',
                  style: TextStyle(
                    color: kBodyTextColor,
                    fontSize: 20,
                    fontFamily: kFontFamily,
                  ),
                ),
                Text(
                  'We’ll check if you have an account with ViCAFE.',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  style: Theme.of(context).textTheme.bodyText1,
                  decoration: kInputDecoration.copyWith(
                    hintText: 'example@selise.ch',
                    suffixIcon: SvgPicture.asset(
                      'assets/icons/mail.svg',
                    ),
                    suffixIconConstraints: BoxConstraints(
                      maxWidth: 30,
                    ),
                  ),
                  onChanged: (value) {
                    setState(() {
                      email = value;
                      email!.length > 0
                          ? isDisabled = false
                          : isDisabled = true;
                    });
                  },
                ),
              ],
            )),
          ),
          Spacer(),
          CustomButton(
            onPress: isDisabled
                ? null
                : () {
                    Navigator.pushNamed(context, Home.routeName);
                  },
            buttonText: 'Next',
            isDisabled: isDisabled,
          ),
        ],
      )),
    );
  }
}
