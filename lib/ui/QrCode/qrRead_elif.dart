import 'package:flutter/material.dart';
import 'package:topluluk_tasarim/const.dart';

class QrRead extends StatelessWidget {
  Size size;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Column(
        children: [buildHeader(size)],
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
          )
        ],
      ),
    );
  }
}
