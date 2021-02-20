import 'dart:core';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/app/exceptions.dart';
import 'package:stuventmobil/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:stuventmobil/ui/komiteler.dart';
import 'package:stuventmobil/viewmodel/user_model.dart';

import '../const.dart';

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

  String dropdownValue = "Fakülte Seçiniz";
  String komite = "Komite Seçiniz";
  String secilenBolum = "Bölüm Seçiniz";
  String ilgiAlani, hobi;

  int fakulte;

  List<String> bolum;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(gradient: homePageBg),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        floatingActionButton: Padding(
          padding: const EdgeInsets.only(bottom: 20, left: 10),
          child: Container(
            height: 70.0,
            width: 70.0,
            child: FittedBox(
              child: FloatingActionButton(
                onPressed: () {},
                child: Icon(
                  Icons.save,
                  color: Colors.grey.shade800,
                ),
              ),
            ),
          ),
        ),
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
      child: Padding(
        padding: const EdgeInsets.only(left: 17),
        child: Container(
          height: 90,
          width: 350,
          child: Text(
            "PROFİL BİLGİLERİNİ TAMAMLA",
            style: headerText2,
          ),
        ),
      ),
    );
  }

  buildForm() {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 15),
      child: Container(
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
            padding: EdgeInsets.only(top: 20, right: 30, left: 25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Row(
                children: [
                  Text(
                    "Fakülte :",
                    style: textStyle1,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  DropdownButton<int>(
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 20,
                    style: textStyle1,
                    underline: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    items: buildFakultelerItems(),
                    onChanged: (int secilen) {
                      setState(() {
                        fakulte = secilen;
                      });
                      switch (fakulte) {
                        case 0:
                          bolum = dalamanSivilHavacilikYuksekokulu;
                          break;
                        case 1:
                          bolum = disHekimligi;
                          break;
                        case 2:
                          bolum = edebiyat;
                          break;
                        case 3:
                          bolum = egitim;
                          break;
                        case 4:
                          bolum = fen;
                          break;
                        case 5:
                          bolum = isletme;
                          break;
                        case 6:
                          bolum = fethiyeSaglik;
                          break;
                        case 7:
                          bolum = iktisadi;
                          break;
                        case 8:
                          bolum = islami;
                          break;
                        case 9:
                          bolum = veteriner;
                          break;
                        case 10:
                          bolum = mimarlik;
                          break;
                        case 11:
                          bolum = muhendislik;
                          break;
                        case 12:
                          bolum = saglik;
                          break;
                        case 13:
                          bolum = seydikemer;
                          break;
                        case 14:
                          bolum = su;
                          break;
                        case 15:
                          bolum = teknoloji;
                          break;
                        case 16:
                          bolum = tip;
                          break;
                        case 17:
                          bolum = turizm;
                          break;
                      }
                    },
                    hint: Text(
                      dropdownValue,
                      style: TextStyle(fontSize: 14),
                    ),
                    value: fakulte,
                  ),
                ],
              ),
              if (bolum != null)
                Row(
                  children: [
                    Text(
                      "Bölüm :",
                      style: textStyle1,
                    ),
                    SizedBox(
                      width: 7,
                    ),
                    DropdownButton<String>(
                      icon: Icon(Icons.keyboard_arrow_down),
                      iconSize: 20,
                      style: textStyle1,
                      underline: Container(
                        height: 2,
                        color: Colors.grey,
                      ),
                      items: buildBolumItems(),
                      onChanged: (String secilen) {
                        setState(() {
                          secilenBolum = secilen;
                        });
                      },
                      hint: Text(
                        secilenBolum,
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
              TextFormField(
                cursorColor: Colors.grey,
                style: TextStyle(color: Colors.grey.shade600),
                key: TakeInfo.key2,
                decoration: InputDecoration(
                    hintText: "İlgi Alanı", hintStyle: textStyle1),
                onSaved: (String text) {
                  ilgiAlani = text;
                },
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                style: TextStyle(color: Colors.grey.shade600),
                key: TakeInfo.key3,
                decoration:
                    InputDecoration(hintText: "Hobi", hintStyle: textStyle1),
                onSaved: (String text) {
                  hobi = text;
                },
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Text(
                    "Komite :",
                    style: textStyle1,
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  DropdownButton<String>(
                    icon: Icon(Icons.keyboard_arrow_down),
                    iconSize: 20,
                    style: textStyle1,
                    underline: Container(
                      height: 2,
                      color: Colors.grey,
                    ),
                    onChanged: (String newValue) {
                      setState(() {
                        komite = newValue;
                      });
                    },
                    items: komiteler
                        .map<DropdownMenuItem<String>>((dynamic value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(
                          value,
                          style: TextStyle(fontSize: 12),
                        ),
                      );
                    }).toList(),
                    hint: Text(
                      komite,
                      style: TextStyle(fontSize: 12),
                    ),
                  ),
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }

  DropdownMenuItem<int> buildDropdownMenuItemInt(String text, int value) {
    return DropdownMenuItem<int>(
      child: Text(
        text,
        style: TextStyle(fontSize: 11),
      ),
      value: value,
    );
  }

  DropdownMenuItem<String> buildDropdownMenuItemString(String text) {
    return DropdownMenuItem<String>(
      child: Text(
        text,
        style: TextStyle(fontSize: 10),
      ),
      value: text,
    );
  }

  List<DropdownMenuItem<int>> buildFakultelerItems() {
    List<DropdownMenuItem<int>> fakultelerList = [];
    for (int i = 0; i < fakulteler.length; i++) {
      fakultelerList.add(buildDropdownMenuItemInt(fakulteler[i], i));
    }
    return fakultelerList;
  }

  List<DropdownMenuItem<String>> buildBolumItems() {
    List<DropdownMenuItem<String>> bolumlerList = [];
    for (String bolumString in bolum) {
      bolumlerList.add(buildDropdownMenuItemString(bolumString));
    }
    return bolumlerList;
  }

  Future<void> save(BuildContext context) async {
    try {
      if (secilenBolum == "Bölüm Seçiniz" || komite == "Komite Seçiniz") {
        PlatformDuyarliAlertDialog(
          baslik: "Bölüm ve Komite Seçmelisiniz",
          icerik: "Bölüm veya Komiteyi doğru seçmediniz.\n" +
              "Lütfen doğru bir bölüm ve komite seçiniz",
          anaButonYazisi: "Tamam",
        ).goster(context);
      } else {
        TakeInfo.formKey.currentState.save();
        final _userModel = Provider.of<UserModel>(context, listen: false);
        bool sonuc = await _userModel.setProfil(
            _userModel.user.userID, secilenBolum, ilgiAlani, hobi, komite);
        if (sonuc == true || sonuc == null) {
          PlatformDuyarliAlertDialog(
            baslik: "Profil Bilgileriniz Güncellendi",
            icerik: "Profil bilgileriniz başarıyla güncellendi",
            anaButonYazisi: "Tamam",
          ).goster(context);
        } else {
          PlatformDuyarliAlertDialog(
            baslik: "Profil Bilgileriniz Güncellenemedi 😕",
            icerik: "Profil bilgileriniz güncellenirken bir sorun oluştu.\n" +
                "İnternet bağlantınızı kontrol edin.",
            anaButonYazisi: "Tamam",
          ).goster(context);
        }
        Navigator.pop(context);
      }
    } on PlatformException catch (e) {
      PlatformDuyarliAlertDialog(
        baslik: "Profil Bilgileriniz Güncelleme HATA",
        icerik: Exceptions.goster(e.code),
        anaButonYazisi: "Tamam",
      ).goster(context);
    }
  }
}
