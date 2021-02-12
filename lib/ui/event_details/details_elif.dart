import 'package:flutter/material.dart';

import '../const.dart';
import 'komiteler.dart';

class DetailsPage extends StatelessWidget {
  final int index;
  final Function press;
  Size size;

  DetailsPage({Key key, this.index, this.press}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Column(
          children: [
            buildHeader(size),
            SizedBox(
              height: 150,
            ),
            buildBody(size, index),
            SizedBox(
              height: 20,
            ),
            buildButtons(size),
            SizedBox(
              height: 20,
            ),
            buildBackAndQr(context)
          ],
        ),
      ),
    );
  }

  Widget buildHeader(Size size) {
    return Container(
      height: size.height * 0.25,
      decoration: BoxDecoration(
          color: detailsColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 7,
            )
          ]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Ayrıntılar",
              style: headerText,
            ),
          ),
        ],
      ),
    );
  }

  buildBody(Size size, index) {
    return Column(
      children: [
        SizedBox(
          height: 8.0,
        ),
        Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              height: size.height * 0.25,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: detailsColor2,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: size.width * 0.2,
                  ),
                  Text(
                    "Tarih: 22.01.2020",
                    style: miniHeader2,
                  ),
                  Text(
                    "Buluşma Yeri: Discord",
                    style: miniHeader2,
                  )
                ],
              ),
            ),
            Positioned(
              top: -140,
              left: 35,
              child: Container(
                height: size.height * 0.3,
                width: size.width * 0.6,
                child: Hero(
                    tag: "post" + index.toString(),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "${etkinliklerJpg[index]}",
                          fit: BoxFit.cover,
                        ))),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildButtons(Size size) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: detailsColor, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              "Katılıyorum",
              style: miniHeader2,
            ),
          ),
        ),
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: detailsColor, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: Text(
              "Kimler Katılıyor?",
              style: miniHeader2,
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBackAndQr(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back_sharp,
                  color: detailsColor,
                ),
                Text(
                  "Geri",
                  style: TextStyle(color: detailsColor, fontSize: 20),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              gradient: indigoButton, borderRadius: BorderRadius.circular(10)),
          child: Icon(
            Icons.camera_alt,
            color: Colors.white,
            size: 30,
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              gradient: indigoButton, borderRadius: BorderRadius.circular(10)),
          child: Icon(
            Icons.qr_code,
            color: Colors.white,
            size: 35,
          ),
        ),
      ],
    );
  }
}
