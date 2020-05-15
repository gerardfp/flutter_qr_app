import 'dart:typed_data';
import 'dart:ui';

import 'package:esys_flutter_share/esys_flutter_share.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:uuid/uuid.dart';


class QRGen extends StatefulWidget {
  @override
  _QRGenState createState() => _QRGenState();
}

class _QRGenState extends State<QRGen> {
  GlobalKey globalKey = GlobalKey();

  Future<void> _capturePng() async {
    // https://master-docs-flutter-io.firebaseapp.com/flutter/rendering/RenderRepaintBoundary/toImage.html
    Uint8List pngBytes = (await (await (globalKey.currentContext.findRenderObject() as RenderRepaintBoundary).toImage()).toByteData(format: ImageByteFormat.png)).buffer.asUint8List();
    await Share.file("QRCode", 'qr_code.png', pngBytes, 'image/png', );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: RepaintBoundary(
          key: globalKey,
          child: GestureDetector(
            onTap: _capturePng,
            child: QrImage(
              data: Uuid().v4(),
              size: 200,
            ),
          ),
        ),
      ),
    );
  }
}
