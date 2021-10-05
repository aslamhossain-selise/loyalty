// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:qr_code_scanner/qr_code_scanner.dart';
// import '../../providers/qr_scaner_result.dart';
// // import 'package:vi_cafe/screens/scan_result/scan_result_screen.dart';
// import 'package:provider/provider.dart';

// class QrScanPage extends StatefulWidget {
//   static const routeName = '/qr_scan_page';

//   @override
//   _QrScanPageState createState() => _QrScanPageState();
// }

// class _QrScanPageState extends State<QrScanPage> {
//   final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
//   Barcode? result;
//   QRViewController? controller;

//   void reassemble() {
//     super.reassemble();
//     if (Platform.isAndroid) {
//       controller!.pauseCamera();
//     }
//     controller!.resumeCamera();
//   }

//   @override
//   void dispose() {
//     controller?.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: CupertinoPageScaffold(
//         child: Stack(
//           children: [
//             _buildQrView(context),
//             Positioned(top: 10, child: buildControlButton()),
//             Positioned(bottom: 10, left: 50, child: ResultShow())
//           ],
//         ),
//       ),
//     );
//   }

//   Widget buildControlButton() => Row(
//         mainAxisSize: MainAxisSize.max,
//         mainAxisAlignment: MainAxisAlignment.center,
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           CupertinoButton(
//             onPressed: () async {
//               await controller?.toggleFlash();
//               setState(() {});
//             },
//             child: Icon(Icons.flash_off),
//           ),
//           CupertinoButton(
//             onPressed: () async {
//               await controller?.flipCamera();
//               setState(() {});
//             },
//             child: Icon(Icons.switch_camera),
//           ),
//         ],
//       );

//   Widget ResultShow() => Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         children: [
//           Container(
//             height: 50,
//             width: 300,
//             padding: EdgeInsets.symmetric(horizontal: 10),
//             color: CupertinoColors.white,
//             child: Center(
//               child: Text(
//                 result != null ? "Result: ${result}" : 'Result: ',
//                 style: TextStyle(
//                   color: CupertinoColors.black,
//                 ),
//               ),
//             ),
//           )
//         ],
//       );

//   Widget _buildQrView(BuildContext context) {
//     var scanArea = (MediaQuery.of(context).size.width < 400 ||
//             MediaQuery.of(context).size.height < 400)
//         ? 300.0
//         : 300.0;

//     return QRView(
//       key: qrKey,
//       onQRViewCreated: _onQRViewCreated,
//       overlay: QrScannerOverlayShape(
//           borderColor: Color(0xFFC9AC60),
//           borderRadius: 10,
//           borderLength: 30,
//           borderWidth: 10,
//           cutOutSize: scanArea),
//       onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
//     );
//   }

//   void _onQRViewCreated(QRViewController controller) {
//     setState(() {
//       this.controller = controller;
//     });
//     controller.scannedDataStream.listen((scanData) {
//       setState(() {
//         result = scanData;
//       });

//       var currentId =
//           Provider.of<ScanItemData>(context, listen: false).countItem;

//       Provider.of<ScanItemData>(context, listen: false)
//           .addItem("${currentId++}", "${result}");
//       result != null
//           ?
//           // Navigator.pushReplacementNamed(
//           //     context,
//           //     ScanResultScreen.routeName,
//           //   )
//           print('hello')
//           : null;
//       controller.dispose();
//     });
//   }

//   void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
//     if (!p) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('no Permission')),
//       );
//     }
//   }
// }
