import 'package:flutter/material.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:loyalty/constant.dart';

class FullScanScreen extends StatelessWidget {
  static const routeName = '/full_scan_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
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
                  data: 'bal',
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
      ),
    );
  }
}
