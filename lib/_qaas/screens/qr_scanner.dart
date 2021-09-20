import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

import 'package:food_template/Screen/Template4/Style/ThemeT4.dart' as Style;
import 'package:vibration/vibration.dart';

class ScanQr extends StatefulWidget {
  @override
  _ScanQrState createState() => _ScanQrState();
}

class _ScanQrState extends State<ScanQr> {
  final qrKey = GlobalKey(debugLabel: 'QR');
  QRViewController controller;

  Barcode barcode;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          alignment: Alignment.center,
          children: [
            QRView(
              key: qrKey,
              onQRViewCreated: onQRViewCreated,
              overlay: QrScannerOverlayShape(
                  cutOutSize: MediaQuery.of(context).size.width * 0.8,
                  borderWidth: 10,
                  borderRadius: 20,
                  borderLength: 10,
                  borderColor: Colors.white24),
            ),
            Positioned(
              bottom: 10,
              child: buildResult(),
            ),
            controller!=null?Positioned(
              top: 10,
              child: buildControlButtons(),
            ):Container()
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    // TODO: implement dispose
    controller.dispose();
    super.dispose();
  }

  @override
  Future<void> reassemble() async {
    // TODO: implement reassemble
    super.reassemble();
    if (Platform.isAndroid) await controller.pauseCamera();
    controller.resumeCamera();
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });



    controller.scannedDataStream.listen((barcode) {
      setState(() async {
        this.barcode = barcode;
      });


    });
  }

  Widget buildResult() {
    return Container(
      padding: EdgeInsets.all(12),
      margin: EdgeInsets.all(8),
      width: 300,
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(8)),
      child: Text(
        barcode != null ? 'Result : ${barcode.code}' : 'Scan a code!',
        maxLines: 3,
        textAlign: TextAlign.center,
        overflow: TextOverflow.clip,

      ),
    );
  }

  Widget buildControlButtons() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
          color: Colors.white24, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
              onPressed: () async {
                await controller.toggleFlash();
              },
              icon: FutureBuilder<bool>(
                  future: controller.getFlashStatus(),
                  builder: (context, snapshot) {
                    if (snapshot.data != null)
                      return Icon(snapshot.data?Icons.flash_on:Icons.flash_off);
                    else
                      return Container();
                  })),
          IconButton(
              onPressed: () async {
                await controller.flipCamera();
              },
              icon: FutureBuilder(
                  future: controller.getCameraInfo(),

                  builder: (context, snapshot) {
                    if (snapshot.data != null)
                  return Icon(Icons.switch_camera);
                    else
                      return Container();
                }
              ))
        ],
      ),
    );
  }
}
