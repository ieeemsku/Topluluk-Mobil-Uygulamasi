import 'package:flutter/material.dart';

import "../const.dart";

class Notice extends StatelessWidget {
  var formKey = GlobalKey<FormState>();
  var key1 = GlobalKey<FormState>();
  var key2 = GlobalKey<FormState>();
  var key3 = GlobalKey<FormState>();
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildHeader(context),
            Theme(
                data: ThemeData(primaryColor: Color.fromRGBO(0, 182, 183, 1)),
                child: buildTextFormField(context)),
            buildBackAndSave(context)
          ],
        ),
      ),
    );
  }

  Widget buildHeader(context) {
    return Container(
      height: size.height * 0.25,
      width: size.width,
      decoration: BoxDecoration(
        color: Color.fromRGBO(0, 182, 183, 1),
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30),
          bottomRight: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: size.width * 0.1),
            child: Text(
              "Bildirim\nOluştur",
              style: headerText,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildTextFormField(BuildContext context) {
    return Column(
      children: [
        Form(
            key: formKey,
            child: Padding(
              padding: EdgeInsets.only(
                  left: size.width * 0.1, right: size.width * 0.1),
              child: Column(
                children: [
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.grey.shade700),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 182, 183, 1))),
                      hintText: 'Bildirim Başlığı',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    key: key1,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormField(
                    style: TextStyle(color: Colors.grey.shade700),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 182, 183, 1))),
                      hintText: 'Bildirim Özeti',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    key: key2,
                  ),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  TextFormField(
                    style: TextStyle(
                      color: Colors.grey.shade600,
                    ),
                    key: key3,
                    keyboardType: TextInputType.multiline,
                    minLines: 3,
                    maxLines: 3,
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide(
                              color: Color.fromRGBO(0, 182, 183, 1))),
                      hintText: 'Bildirim Uzun Mesaj',
                      counterText: "50 karakter",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20)),
                    ),
                  ),
                ],
              ),
            ))
      ],
    );
  }

  Widget buildBackAndSave(context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.width * 0.08),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(0, 182, 183, 1),
            size: 30,
          ),
          Text(
            "Geri",
            style: TextStyle(
                color: Color.fromRGBO(0, 182, 183, 1),
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            width: size.width * 0.4,
          ),
          Container(
              decoration: BoxDecoration(
                borderRadius: butonBorder,
                gradient: blueBotton,
              ),
              height: size.height * 0.09,
              width: size.width * 0.25,
              child: Center(
                  child: Text(
                "Kaydet",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              )))
        ],
      ),
    );
  }
}
