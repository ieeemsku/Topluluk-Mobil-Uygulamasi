import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../const.dart';

class GenerateScreen extends StatefulWidget {
  String text;

  GenerateScreen(this.text);

  @override
  State<StatefulWidget> createState() => GenerateScreenState(text);
}

class GenerateScreenState extends State<GenerateScreen> {
  String _dataString;

  GenerateScreenState(this._dataString);

  GlobalKey globalKey = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: <Widget>[
          buildHeader(size),
          _contentWidget(),
        ],
      ),
    );
  }

  Widget buildHeader(Size size) {
    return Container(
      height: 200,
      width: size.width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(35),
            bottomRight: Radius.circular(35),
          ),
          color: qrColor),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Yoklama İçin QR",
              style: headerText,
            ),
          ),
        ],
      ),
    );
  }

  _contentWidget() {
    final bodyHeight = MediaQuery.of(context).size.height -
        MediaQuery.of(context).viewInsets.bottom;
    return Container(
      color: const Color(0xFFFFFFFF),
      child: Column(
        children: <Widget>[
          Center(
            child: RepaintBoundary(
              key: globalKey,
              child: QrImage(
                data: _dataString,
                size: bodyHeight * 0.5,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
