import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loyalty/constant.dart';

class NotificationScreen extends StatelessWidget {
  static const routeName = '/notification_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: kButtonTextColor,
        title: Text(
          'Notifications',
          style: Theme.of(context).textTheme.bodyText1,
        ),
        centerTitle: false,
        actions: [
          TextButton(
            onPressed: () {},
            child: Row(
              children: [
                Text(
                  'Mark all as read',
                  style: Theme.of(context).textTheme.bodyText1,
                ),
                SizedBox(
                  width: 5,
                ),
                SvgPicture.asset(
                  'assets/icons/check.svg',
                ),
              ],
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFC1C1C1).withOpacity(.2),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: .5,
                    ),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xFFC9AC60),
                            radius: 5,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              "Success! You've redeemed your free coffee.",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Yesterday',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: kFontFamily,
                              ),
                              children: [
                                TextSpan(text: 'at'),
                                TextSpan(text: '11:42 PM'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: .5,
                    ),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 5,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              "Buy 2 more coffees to get a free coffee!",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Yesterday',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: kFontFamily,
                              ),
                              children: [
                                TextSpan(text: 'at'),
                                TextSpan(text: '11:42 PM'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                decoration: BoxDecoration(
                  color: Color(0xFFC1C1C1).withOpacity(.2),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.white,
                      width: .5,
                    ),
                  ),
                ),
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 300,
                      child: Row(
                        children: [
                          CircleAvatar(
                            backgroundColor: Color(0xFFC9AC60),
                            radius: 5,
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Text(
                              "You are near 'ViCAFE Bahnhofstrasse', try our new CAFE au LAIT.",
                              style: Theme.of(context).textTheme.bodyText1,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      child: Row(
                        children: [
                          SizedBox(
                            width: 30,
                          ),
                          Text.rich(
                            TextSpan(
                              text: 'Yesterday',
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                                fontFamily: kFontFamily,
                              ),
                              children: [
                                TextSpan(text: 'at'),
                                TextSpan(text: '11:42 PM'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
