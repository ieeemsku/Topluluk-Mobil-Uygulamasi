import 'package:flutter/material.dart';
import '../const.dart';

class LoginPage extends StatelessWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static Key key1 = new GlobalKey();
  static Key key2 = new GlobalKey();
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(gradient: loginPageBg),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                buildHeader(),
                Padding(
                  padding: const EdgeInsets.only(),
                  child: Theme(
                      data: ThemeData(primaryColor: Colors.indigo.shade200),
                      child: buildFormfield()),
                ),
                SizedBox(
                  height: 20,
                ),
                googleButton(),
                SizedBox(
                  height: 10,
                ),
                hesapOlustur()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.only(top: 30.0),
      child: Container(
          height: size.height * 0.29,
          width: size.width * 0.86,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Stuvent Etkinlik Habercisi",
                style: headerText,
              ),
              Text(
                "Devam etmek için giriş yapın",
                style: miniHeader,
              )
            ],
          )),
    );
  }

  Widget buildFormfield() {
    return Container(
      height: size.height * 0.39,
      width: size.width * 0.86,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(10)),
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.only(top: 20.0, right: 30, left: 30),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                hintText: "Şifre",
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
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text(
                    "Şifreni mi unuttun?",
                    style: TextStyle(
                        fontSize: 18,
                        fontFamily: "Catamaran",
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo.shade200),
                  ),
                ),
                Container(
                    height: 50,
                    width: 100,
                    decoration: BoxDecoration(
                        gradient: indigoButton,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(Icons.forward, color: Colors.white))
              ],
            ),
          ]),
        ),
      ),
    );
  }

  Widget googleButton() {
    return Container(
      height: 45,
      width: 170,
      decoration: BoxDecoration(
          color: Color.fromRGBO(124, 127, 225, 1),
          borderRadius: BorderRadius.circular(18)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Google",
            style: TextStyle(
                color: Colors.white, fontFamily: "Catamaran", fontSize: 20),
          ),
        ],
      ),
    );
  }

  Widget hesapOlustur() {
    return Center(
      child: Container(
        height: 40,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              "Hesap Oluştur",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
