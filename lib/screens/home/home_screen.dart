import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:loyalty/constant.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:loyalty/screens/full_scan_screen/full_scan_screen.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home_screen';

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
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
            SizedBox(
              height: 30,
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
