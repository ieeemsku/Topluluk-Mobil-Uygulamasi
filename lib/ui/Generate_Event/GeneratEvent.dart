import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:stuventmobil/viewmodel/user_model.dart';

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
  Size size;

  List<String> etkinlikler = [];

  String event_name, location, url;

  int category;

  File _secilenResim;

  bool _eventInProgress = false;

  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    UserModel _userModel = Provider.of<UserModel>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Theme(
                data: ThemeData(primaryColor: new_event_color),
                child: buildingHeaderAndTextForm(context, _userModel)),
            buildingBack(context, _userModel)
          ],
        ));
  }

  Widget buildingHeaderAndTextForm(context, UserModel userModel) {
    getEtkinlikler(userModel);
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
              height: size.height * 0.7,
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
                            prefixIcon: Icon(CupertinoIcons.conversation_bubble,
                                color: new_event_color),
                            hintStyle: TextStyle(
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 17),
                            hintText: "Etkinlik",
                          ),
                          key: Create_Event.key1,
                          validator: (String value) {
                            if (etkinlikler.contains(value)) {
                              return "Bu etkinlik bulunmaktadır";
                            } else if (value.length == 0) {
                              return "Etkinlik adı belirtmelisiniz";
                            } else
                              return null;
                          },
                          onSaved: (String value) => event_name = value,
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextFormField(
                          style: TextStyle(color: Colors.indigo.shade200),
                          key: Create_Event.key2,
                          decoration: InputDecoration(
                            hintText: "Etkinliğin Konumu",
                            prefixIcon: Icon(
                              Icons.map,
                              color: new_event_color,
                            ),
                            hintStyle: TextStyle(
                                fontFamily: "Catamaran",
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                                fontSize: 17),
                          ),
                          validator: (String value) {
                            if (value.length == 0) {
                              return "Etkinlik Konumu belirtmelisiniz";
                            } else {
                              return null;
                            }
                          },
                          onSaved: (String value) => location = value,
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
                            child: GestureDetector(
                              child: Center(
                                  child: _secilenResim == null
                                      ? Text(
                                          "Resim Yok",
                                          style: TextStyle(
                                              color: Colors.grey.shade600,
                                              fontWeight: FontWeight.bold),
                                        )
                                      : Image.file(_secilenResim)),
                              onTap: _galeriResimUpload,
                            ),
                          ),
                        ),
                      ]),
                ),
              ),
            ),
          ),
          Positioned(
              top: size.height * 0.85,
              left: size.width * 0.333,
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
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
                ),
                onTap: _galeriResimUpload,
              ))
        ],
        overflow: Overflow.visible,
      ),
    );
  }

  Widget buildingBack(context, UserModel userModel) {
    return Padding(
      padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          top: MediaQuery.of(context).size.width * 0.08),
      child: Row(
        children: [
          GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: new_event_color,
              size: 30,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          GestureDetector(
            child: Text(
              "Geri",
              style: TextStyle(
                  color: new_event_color,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            height: size.height * 0.15,
            width: size.width * 0.45,
          ),
          GestureDetector(
            child: Container(
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
                _eventInProgress ? Icons.lock : Icons.save,
                color: Colors.white,
                size: 40,
              ),
            ),
            onTap: () {
              if (!_eventInProgress) {
                _veriEkle(userModel);
              }
            },
          )
        ],
      ),
    );
  }

  Widget buildDropdown(BuildContext context) {
    String dropdownValue = 'Komite Seçiniz';
    return Container(
      child: DropdownButton<int>(
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
        items: [
          buildDropdownMenuItem("Computer Society", 1),
          buildDropdownMenuItem("Communications Society", 2),
          buildDropdownMenuItem("Power And Energy Society", 3),
          buildDropdownMenuItem("Robotics & Automation Society", 4),
          buildDropdownMenuItem("Educational Activities", 5),
          buildDropdownMenuItem("Women in Engineering", 6),
        ],
        onChanged: (int secilen) {
          setState(() {
            category = secilen;
          });
        },
        hint: Text(dropdownValue),
        value: category,
      ),
    );
  }

  DropdownMenuItem<int> buildDropdownMenuItem(String text, int value) {
    return DropdownMenuItem<int>(
      child: Row(
        children: <Widget>[
          Container(
            width: 20,
            height: 24,
            //margin: EdgeInsets.only(right: 10),
          ),
          Text(text),
        ],
      ),
      value: value,
    );
  }

  Future<void> getEtkinlikler(UserModel userModel) async {
    etkinlikler = await userModel.getEtkinlikler();
  }

  _galeriResimUpload() async {
    final picker = ImagePicker();
    var pickedFile = await picker.getImage(source: ImageSource.gallery);

    setState(() {
      _secilenResim = File(pickedFile.path);
    });
  }

  _veriEkle(UserModel userModel) async {
    setState(() {
      _eventInProgress = true;
    });
    if (_secilenResim == null) {
      PlatformDuyarliAlertDialog(
        baslik: "HATA",
        icerik: "Lütfen resim yükleyiniz!!!",
        anaButonYazisi: "Tamam",
      ).goster(context);
      setState(() {
        _eventInProgress = false;
      });
    } else {
      if (Create_Event.formKey.currentState.validate()) {
        Create_Event.formKey.currentState.save();

        String url = await userModel.uploadFile(
            "Etkinlikler", _secilenResim, event_name, "event_photo.png");

        List katilimcilar = [];

        List categoryList = [0];
        categoryList.add(category);

        Map<String, dynamic> docMap = {};

        Create_Event.formKey.currentState.save();
        Map<String, dynamic> data = Map();
        data["Etkinlik Adı"] = event_name;
        data["Etkinlik Konumu"] = location;
        data["Etkinlik Photo Url"] = url;
        data["category"] = categoryList;
        data["Katilimcilar"] = katilimcilar;
        data["Dosyalar"] = docMap;

        bool sonuc = await userModel.setData("Etkinlikler", event_name, data);

        if (sonuc == true || sonuc == null) {
          final sonuc1 = await PlatformDuyarliAlertDialog(
            baslik: "Etkinlik Oluşturuldu",
            icerik: "Etkinlik Başarıyla Oluşturuldu 👍",
            anaButonYazisi: "Tamam",
          ).goster(context);
          if (sonuc1) {
            Navigator.pop(context);
          }
        } else {
          PlatformDuyarliAlertDialog(
            baslik: "Etkinlik Oluşturulamadı",
            icerik: "Etkinlik oluşturulurken sorun oluştu 😕",
            anaButonYazisi: "Tamam",
          ).goster(context);
          setState(() {
            _eventInProgress = false;
          });
        }
      } else {
        PlatformDuyarliAlertDialog(
          baslik: "Değerleri Doğru Giriniz",
          icerik: "Lütfen istenilen değerleri tam ve doğru giriniz",
          anaButonYazisi: "Tamam",
        ).goster(context);
        setState(() {
          _eventInProgress = false;
        });
      }
    }
  }
}
