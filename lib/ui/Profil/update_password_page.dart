import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/app/exceptions.dart';
import 'package:stuventmobil/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:stuventmobil/viewmodel/user_model.dart';

import '../const.dart';

class ChangePassword extends StatelessWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static Key key1 = new GlobalKey();
  static Key key2 = new GlobalKey();
  static Key key3 = new GlobalKey();
  var _scaffoldKey = GlobalKey<ScaffoldState>();

  String mail, oldPassword, newPassword;

  @override
  Size size;
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        key: _scaffoldKey,
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
              height: size.height * 0.55,
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
                          validator: _emailKontrol,
                          onSaved: (String value) => mail = value,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          obscureText: true,
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
                          validator: (String value) {
                            if (value.length < 6) {
                              return "En az 6 karakter gerekli";
                            }
                            return null;
                          },
                          onSaved: (String value) => oldPassword = value,
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        TextFormField(
                          obscureText: true,
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
                          validator: (String value) {
                            if (value.length < 6) {
                              return "En az 6 karakter gerekli";
                            }
                            return null;
                          },
                          onSaved: (String value) => newPassword = value,
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
          GestureDetector(
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.indigo,
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
                  color: Colors.indigo,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: size.width * 0.4,
          ),
          GestureDetector(
            child: Container(
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
            ),
            onTap: () {
              _updatePassword(context);
            },
          )
        ],
      ),
    );
  }

  String _emailKontrol(String mail) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(mail))
      return 'Geçersiz mail';
    else
      return null;
  }

  Future<void> _updatePassword(BuildContext context) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Şifreniz Güncelleniyor..."),
        duration: Duration(seconds: 3),
      ));

      UserModel _userModel = Provider.of<UserModel>(context, listen: false);
      String userMail = _userModel.user.email;
      try {
        if (userMail == mail) {
          await _userModel
              .signInWithEmailandPassword(mail, oldPassword)
              .then((value) async {
            bool sonuc = await _userModel.sifreGuncelle(newPassword);
            if (sonuc == true || sonuc == null) {
              var sonuc1 = await PlatformDuyarliAlertDialog(
                baslik: "Şifreniz Güncellendi 👍",
                icerik: "Şifreniz başarılı bir şekilde güncellendi",
                anaButonYazisi: "Tamam",
              ).goster(context);

              if (sonuc1) {
                Navigator.pop(context);
              }
            } else {
              final sonuc = await PlatformDuyarliAlertDialog(
                baslik: "Şifreniz Güncellenemedi 😕",
                icerik: "Şifreniz güncellenirken bir sorun oluştu.\n" +
                    "İnternet bağlantınızı kontrol edin",
                anaButonYazisi: "Tamam",
              ).goster(context);

              if (sonuc) {
                Navigator.pop(context);
              }
            }
          }).catchError((e) {
            PlatformDuyarliAlertDialog(
              baslik: "Şifre Güncelleme HATA",
              icerik: Exceptions.goster(e.toString()),
              anaButonYazisi: "Tamam",
            ).goster(context);
          });
        } else {
          PlatformDuyarliAlertDialog(
            baslik: "Girilen E-Posta Adresi HATA",
            icerik: "Kendi e-posta adresinizi doğru girdiğinizden emin olun",
            anaButonYazisi: "Tamam",
          ).goster(context);
        }
      } on PlatformException catch (e) {
        PlatformDuyarliAlertDialog(
          baslik: "Şifre Güncelleme HATA",
          icerik: Exceptions.goster(e.code),
          anaButonYazisi: "Tamam",
        ).goster(context);
      }
    } else {
      _scaffoldKey.currentState.showSnackBar(SnackBar(
        content: Text("Lütfen Değerleri Doğru Giriniz..."),
        duration: Duration(seconds: 3),
      ));
    }
  }
}
