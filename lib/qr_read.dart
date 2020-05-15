import 'package:flutter/material.dart';
import 'package:flutterqrapp/util.dart';
import 'package:qr_mobile_vision/qr_camera.dart';

import 'qr_gen.dart';

class QRRead extends StatefulWidget {
  @override
  _QRReadState createState() => _QRReadState();
}

class _QRReadState extends State<QRRead> {
  String code = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            code,
          ),
          SizedBox(
            width: 300,
            height: 300,
            child: QrCamera(
              qrCodeCallback: (code) {
                setState(() {
                  this.code = code;
                });
              },
            ),
          ),
          FlatButton(
            onPressed: ()=> navegarHacia(context, QRGen()),
            child: Text("Generar QR"),
          )
        ],
      ),
    );
  }
}