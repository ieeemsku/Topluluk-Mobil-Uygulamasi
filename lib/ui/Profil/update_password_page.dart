import 'package:flutter/material.dart';

import '../const.dart';

class ChangePassword extends StatelessWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static Key key1 = new GlobalKey();
  static Key key2 = new GlobalKey();
  static Key key3 = new GlobalKey();
  @override
  Size size;
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [buildingHeaderAndTextForm(context), buildingBack(context)],
        ));
  }

  Widget buildingHeaderAndTextForm(context) {
    return Container(
      height: size.height * 0.8,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.3,
            decoration: BoxDecoration(
              color: Color.fromRGBO(57, 28, 178, 1),
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Şifremi\nGüncelle",
                    style: headerText,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.26,
            right: size.width * 0.1,
            left: size.width * 0.1,
            child: Container(
              height: size.height * 0.5,
              width: size.width * 0.6,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Form(
                key: formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.15,
                      right: 30,
                      left: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.indigo.shade200),
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.mail,
                              color: Colors.indigo.shade200,
                            ),
                            hintStyle: TextStyle(
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo.shade200,
                                fontSize: 17),
                            hintText: "E-Posta Adresi",
                          ),
                          key: key1,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.indigo.shade200),
                          key: key2,
                          decoration: InputDecoration(
                            hintText: "Eski Şifren",
                            prefixIcon: Icon(
                              Icons.lock_open,
                              color: Colors.indigo.shade200,
                            ),
                            hintStyle: TextStyle(
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo.shade200,
                                fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          style: TextStyle(color: Colors.indigo.shade200),
                          key: key3,
                          decoration: InputDecoration(
                            hintText: "Yeni Şifre",
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.indigo.shade200,
                            ),
                            hintStyle: TextStyle(
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.bold,
                                color: Colors.indigo.shade200,
                                fontSize: 17),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
        ],
        overflow: Overflow.visible,
      ),
    );
  }

  Widget buildingBack(context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.width * 0.08),
      child: Row(
        children: [
          Icon(
            Icons.arrow_back_ios,
            color: Colors.indigo,
            size: 30,
          ),
          Text(
            "Geri",
            style: TextStyle(
                color: Colors.indigo,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            width: size.width * 0.4,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: butonBorder,
              gradient: indigoButton,
            ),
            height: size.height * 0.1,
            width: size.width * 0.2,
            child: Icon(
              Icons.save,
              color: Colors.white,
              size: 50,
            ),
          )
        ],
      ),
    );
  }
}
