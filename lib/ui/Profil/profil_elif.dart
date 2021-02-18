import 'package:flutter/material.dart';

import '../const.dart';

class Profile extends StatelessWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static Key key1 = new GlobalKey();
  static Key key2 = new GlobalKey();
  static Key key3 = new GlobalKey();
  Size size;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(
        children: [
          buildHeader(context, size),
          buildPassword(),
          SizedBox(
            height: 35,
          ),
          buildBackAndLogOut(),
          SizedBox(
            height: 35,
          ),
          buildLegal(size),
        ],
      ),
    );
  }

  buildHeader(context, Size size) {
    return Container(
      height: size.height * 0.68,
      child: Stack(
        children: [
          Container(
            width: size.width,
            height: size.height * 0.33,
            decoration: BoxDecoration(
              color: Colors.black,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.person,
                        color: Colors.white,
                        size: 70,
                      ),
                      Text(
                        "Elif Bilge",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 55,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "elf.prlk64@gmail.com",
                        style: headerText2,
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.28,
            right: size.width * 0.1,
            left: size.width * 0.1,
            child: Container(
                height: size.height * 0.30,
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
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bölüm : Bilgisayar Mühendisliği",
                          style: textStyle2,
                        ),
                        Text(
                          "İlgi Alanı : Flutter",
                          style: textStyle2,
                        ),
                        Text(
                          "Hobi : Masa Tenisi",
                          style: textStyle2,
                        ),
                        Text(
                          "Komite : Computer Society",
                          style: textStyle2,
                        )
                      ],
                    ),
                  ),
                )),
          ),
          Positioned(
            left: size.width * 0.79,
            top: size.height * 0.54,
            child: Container(
              height: 60,
              width: 60,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
                  shape: BoxShape.circle,
                  color: Colors.grey.shade300),
              child: Icon(Icons.edit),
            ),
          ),
        ],
        overflow: Overflow.visible,
      ),
    );
  }

  buildPassword() {
    return Container(
      height: 50,
      width: 220,
      decoration: BoxDecoration(
        boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
        color: Color.fromRGBO(57, 28, 178, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(child: Text("Şifremi Güncelle", style: miniHeader2)),
    );
  }

  buildBackAndLogOut() {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          IconButton(icon: Icon(Icons.arrow_back_outlined), onPressed: () {}),
          Text(
            "Geri",
            style: textStyle4,
          ),
          SizedBox(
            width: 200,
          ),
          IconButton(icon: Icon(Icons.logout), onPressed: () {}),
          Text(
            "Çıkış",
            style: textStyle4,
          ),
        ],
      ),
    );
  }

  buildLegal(Size size) {
    return Row(
      children: [
        SizedBox(
          width: size.width * 0.19,
        ),
        Icon(Icons.copyright),
        SizedBox(
          width: 2,
        ),
        Text("2020 IEEE MSKU Tüm Hakları Saklıdır.")
      ],
    );
  }
}
