import 'package:flutter/material.dart';
import '../const.dart';

class CreateAcc extends StatelessWidget {
  static GlobalKey<FormState> formKeyy = GlobalKey<FormState>();
  static Key keyy1 = new GlobalKey();
  static Key keyy2 = new GlobalKey();
  static Key keyy3 = new GlobalKey();
  Size size;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Container(
      decoration: BoxDecoration(gradient: createAccBg),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                buildHeader(),
                Theme(
                    data: ThemeData(primaryColor: new_event_color),
                    child: buildTextField()),
                buildBackButton(context)
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Container(
        height: size.height * 0.25,
        width: size.width * 0.85,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Hesap\nOluştur",
              style: headerText,
            )
          ],
        ));
  }

  Widget buildTextField() {
    return Container(
        height: size.height * 0.52,
        width: size.width * 0.85,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                offset: Offset(1, 2),
                blurRadius: 4,
                color: Colors.grey.shade600)
          ],
        ),
        child: Form(
            key: formKeyy,
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0, right: 30, left: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    style: TextStyle(color: Colors.grey.shade400),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.mail,
                          color: Colors.yellow.shade500,
                          size: 30,
                        ),
                        hintStyle: TextStyle(
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                            fontSize: 17),
                        hintText: "E-Posta Adresi"),
                    key: keyy1,
                  ),
                  TextFormField(
                    key: keyy2,
                    style: TextStyle(color: Colors.grey.shade400),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.yellow.shade500,
                          size: 30,
                        ),
                        hintStyle: TextStyle(
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                            fontSize: 17),
                        hintText: "Kullanıcı Adı"),
                  ),
                  TextFormField(
                    key: keyy3,
                    style: TextStyle(color: Colors.grey.shade400),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock_sharp,
                          color: Colors.yellow.shade500,
                          size: 30,
                        ),
                        hintStyle: TextStyle(
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                            fontSize: 17),
                        hintText: "Şifre"),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Hakkımızda",
                          style: TextStyle(
                              color: Colors.grey.shade400,
                              fontWeight: FontWeight.bold,
                              fontSize: 18)),
                      Container(
                        height: 50,
                        width: 100,
                        decoration: BoxDecoration(
                            gradient: orangeButton,
                            borderRadius: BorderRadius.circular(10)),
                        child:
                            Icon(Icons.arrow_forward_ios, color: Colors.white),
                      )
                    ],
                  ),
                ],
              ),
            )));
  }

  buildBackButton(context) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.width * 0.1),
      child: Row(
        children: [
          Container(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
              size: 30,
            ),
          ),
          Text(
            "Geri",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
          )
        ],
      ),
    );
  }
}
