import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loyalty/constant.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:loyalty/screens/full_scan_screen/full_scan_screen.dart';
import 'package:loyalty/screens/menu/menu_screen.dart';
import 'package:loyalty/screens/notification/notification_screen.dart';
import 'package:loyalty/screens/profile/profile_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF181818),
        title: Image.asset(
          'assets/images/logo.png',
          width: 50,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
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
          if (index == 1) {
            Navigator.pushNamed(context, ProfileScreen.routeName);
          } else if (index == 2) {
            Navigator.pushNamed(context, NotificationScreen.routeName);
          } else if (index == 3) {
            Navigator.pushNamed(context, MenuScreen.routeName);
          } else {
            Navigator.pushNamed(context, HomeScreen.routeName);
          }
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
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                decoration: BoxDecoration(
                    color: Color(0xFF181818),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20),
                    )),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hello, John!',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text.rich(
                              TextSpan(
                                  text: 'You have ',
                                  style: Theme.of(context).textTheme.bodyText2,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: '9 stamps ',
                                      style: TextStyle(
                                        color: kButtonBgColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: 'available',
                                      style:
                                          Theme.of(context).textTheme.bodyText2,
                                    ),
                                  ]),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          onPressed: () => Navigator.pushNamed(
                            context,
                            FullScanScreen.routeName,
                          ),
                          child: Text(
                            'Details',
                            style: TextStyle(
                              color: kButtonTextColor,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: kButtonBgColor,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Expanded(
                      child: GridView.count(
                        crossAxisCount: 10,
                        crossAxisSpacing: 5,
                        children: List.generate(
                          10,
                          (index) {
                            return CoffeeImg(index);
                          },
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Only 1 more stamp need to',
                              style: Theme.of(context).textTheme.bodyText2,
                            ),
                            Text.rich(
                              TextSpan(
                                text: 'get a free coffee',
                                style: Theme.of(context).textTheme.bodyText2,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.symmetric(vertical: 40),
              decoration: BoxDecoration(
                border: Border.all(
                  color: kButtonBgColor,
                  width: 1,
                ),
              ),
              child: BarcodeWidget(
                barcode: Barcode.qrCode(
                  errorCorrectLevel: BarcodeQRCorrectionLevel.high,
                ),
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,
                    width: 10,
                  ),
                ),
                data: 'hello from selise',
                width: 200,
                height: 200,
                backgroundColor: Colors.grey[900],
                color: Colors.white,
              ),
            ),
            Text(
              'Let them scan to get free coffee',
              style: Theme.of(context).textTheme.bodyText2,
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Put this QR code under the scanner',
              style: Theme.of(context).textTheme.bodyText1,
            ),
          ],
        ),
      ),
    );
  }
}

class CoffeeImg extends StatelessWidget {
  final int indx;
  CoffeeImg(this.indx);

  @override
  Widget build(BuildContext context) {
    print(indx);
    return indx < 9
        ? SvgPicture.asset(
            'assets/icons/coffee_brown.svg',
          )
        : SvgPicture.asset(
            'assets/icons/coffee_grey.svg',
          );
  }
}
