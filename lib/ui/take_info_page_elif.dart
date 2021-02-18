import 'package:flutter/material.dart';
import 'package:topluluk_tasarim/const.dart';

class TakeInfo extends StatefulWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static Key key1 = new GlobalKey();
  static Key key2 = new GlobalKey();
  static Key key3 = new GlobalKey();

  @override
  _TakeInfoState createState() => _TakeInfoState();
}

class _TakeInfoState extends State<TakeInfo> {
  Size size;

  String dropdownValue = categories[0];
  String dropdownValue2 = categories2[0];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      decoration: BoxDecoration(gradient: homePageBg),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        body: Column(
          children: [
            SizedBox(
              height: 100,
            ),
            buildHeader(),
            buildForm()
          ],
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Center(
      child: Container(
        height: 90,
        width: 350,
        child: Text(
          "PROFİL BİLGİLERİNİ TAMAMLA",
          style: headerText2,
        ),
      ),
    );
  }

  buildForm() {
    return Container(
      height: 330,
      width: 370,
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
        key: TakeInfo.formKey,
        child: Padding(
          padding: EdgeInsets.only(top: 30, right: 15, left: 25),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Row(
              children: [
                Text(
                  "Bölüm :",
                  style: textStyle2,
                ),
                SizedBox(
                  width: 7,
                ),
                DropdownButton<String>(
                  value: dropdownValue,
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  iconSize: 20,
                  style: textStyle3,
                  underline: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                    });
                  },
                  items:
                      categories.map<DropdownMenuItem<String>>((dynamic value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextFormField(
              cursorColor: Colors.grey,
              style: TextStyle(color: Colors.indigo.shade200),
              key: TakeInfo.key2,
              decoration: InputDecoration(
                  hintText: "İlgi Alanı", hintStyle: textStyle3),
            ),
            SizedBox(
              height: 20,
            ),
            TextFormField(
              style: TextStyle(color: Colors.indigo.shade200),
              key: TakeInfo.key3,
              decoration:
                  InputDecoration(hintText: "Hobi", hintStyle: textStyle3),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Text(
                  "Komite :",
                  style: textStyle2,
                ),
                SizedBox(
                  width: 7,
                ),
                DropdownButton<String>(
                  value: dropdownValue2,
                  icon: Icon(Icons.keyboard_arrow_down_sharp),
                  iconSize: 20,
                  style: textStyle3,
                  underline: Container(
                    height: 2,
                    color: Colors.grey,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue2 = newValue;
                    });
                  },
                  items: categories2
                      .map<DropdownMenuItem<String>>((dynamic value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(
                        value,
                      ),
                    );
                  }).toList(),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
