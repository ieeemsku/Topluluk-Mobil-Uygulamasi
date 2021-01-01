import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../const.dart';

class Create_Event extends StatefulWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static Key key1 = new GlobalKey();
  static Key key2 = new GlobalKey();
  static Key key3 = new GlobalKey();

  @override
  _Create_EventState createState() => _Create_EventState();
}

class _Create_EventState extends State<Create_Event> {
  @override
  Size size;

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Expanded(
          child: Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Theme(
                  data: ThemeData(primaryColor: new_event_color),
                  child: buildingHeaderAndTextForm(context)),
              buildingBack(context)
            ],
          )),
    );
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
              color: new_event_color,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)),
            ),
            child: Padding(
              padding: EdgeInsets.only(
                  left: MediaQuery.of(context).size.width * 0.1,
                  bottom: MediaQuery.of(context).size.width * 0.1),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Yeni Etkinlik Oluştur",
                    style: headerText,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.23,
            right: size.width * 0.1,
            left: size.width * 0.1,
            child: Container(
              height: size.height * 0.6,
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
                key: Create_Event.formKey,
                child: Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width * 0.1,
                      right: 30,
                      left: 30),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextFormField(
                          style: TextStyle(color: Colors.grey),
                          decoration: InputDecoration(
                            prefixIcon: Icon(CupertinoIcons.bubble_right,
                                color: new_event_color),
                            hintStyle: TextStyle(
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 17),
                            hintText: "Etkinlik",
                          ),
                          key: Create_Event.key1,
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextFormField(
                          style: TextStyle(color: Colors.indigo.shade200),
                          key: Create_Event.key2,
                          decoration: InputDecoration(
                            hintText: "Etkinliğin Konumu",
                            prefixIcon: Icon(
                              CupertinoIcons.map,
                              color: new_event_color,
                            ),
                            hintStyle: TextStyle(
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 17),
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        buildDropdown(context),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        Center(
                          child: Container(
                            height: size.height * 0.15,
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(color: new_event_color)),
                            child: Center(
                                child: Text(
                              "Resim Yok",
                              style: TextStyle(
                                  color: Colors.grey.shade600,
                                  fontWeight: FontWeight.bold),
                            )),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          Positioned(
              top: size.height * 0.78,
              left: size.width * 0.333,
              child: Container(
                child: Center(
                    child: Text(
                  "Resim Ekle",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )),
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  end: Alignment.bottomLeft,
                  stops: [
                    0.1,
                    1.0,
                  ],
                  colors: [
                    Color.fromRGBO(30, 227, 167, 1),
                    Color.fromRGBO(220, 247, 239, 1),
                  ]),
                    borderRadius: butonBorder),
                height: size.height * 0.09,
                width: size.width * 0.3,
              ))
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
            color: new_event_color,
            size: 30,
          ),
          Text(
            "Geri",
            style: TextStyle(
                color: new_event_color,
                fontWeight: FontWeight.bold,
                fontSize: 20),
          ),
          SizedBox(
            height: size.height*0.15,
            width: size.width * 0.45,
          ),
          Container(
            decoration: BoxDecoration(
              borderRadius: butonBorder,
              gradient: LinearGradient(
                  begin: Alignment.bottomLeft,
                  end: Alignment.bottomRight,
                  stops: [
                    0.1,
                    0.8,
                  ],
                  colors: [
                    Color.fromRGBO(30, 227, 167, 1),
                    Color.fromRGBO(220, 247, 239, 1),
                  ]),
            ),
            height: size.height * 0.08,
            width: size.width * 0.15,
            child: Icon(
              Icons.save,
              color: Colors.white,
              size: 40,
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget buildDropdown(BuildContext context) {
    String dropdownValue = 'Komite Seçiniz';
    return Container(
      child: DropdownButton<String>(
        value: dropdownValue,
        icon: Icon(
          Icons.arrow_downward,
          color: new_event_color,
        ),
        iconSize: 24,
        elevation: 16,
        isExpanded: true,
        style: TextStyle(color: Colors.grey, fontWeight: FontWeight.bold),
        underline: Container(
          height: 2,
          color: new_event_color,
        ),
        onChanged: (String newValue) {
          setState(() {
            dropdownValue = newValue;
          });
        },
        items: <String>[
          'Komite Seçiniz',
          'Woman In Engineering',
          'Computer Society',
          'PES'
        ].map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );
  }
}
