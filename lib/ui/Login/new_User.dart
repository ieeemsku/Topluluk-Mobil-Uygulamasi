import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/app/exceptions.dart';
import 'package:stuventmobil/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:stuventmobil/model/userC.dart';
import 'package:stuventmobil/ui/intro/intro.dart';
import 'package:stuventmobil/viewmodel/user_model.dart';
import 'package:url_launcher/url_launcher.dart';

import '../const.dart';

class CreateAcc extends StatefulWidget {
  static GlobalKey<FormState> formKeyy = GlobalKey<FormState>();
  static Key keyy1 = new GlobalKey();
  static Key keyy2 = new GlobalKey();
  static Key keyy3 = new GlobalKey();
  static Key keyy4 = new GlobalKey();

  @override
  _CreateAccState createState() => _CreateAccState();
}

class _CreateAccState extends State<CreateAcc> {
  Size size;

  String name, lastName, mail, password;

  String ieeeMskuTuzuk = "http://ieeemsku.com/ieee-msku-tuzugu/";

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
                    child: buildTextField(context)),
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

  Widget buildTextField(BuildContext context) {
    return Container(
        height: size.height * 0.60,
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
            key: CreateAcc.formKeyy,
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 15.0, right: 30, left: 30, bottom: 5),
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
                    key: CreateAcc.keyy1,
                    validator: _emailKontrol,
                    onSaved: (String value) => mail = value,
                  ),
                  TextFormField(
                    key: CreateAcc.keyy2,
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
                        hintText: "Adınız"),
                    validator: _isimKonrol,
                    onSaved: (String value) => name = value,
                  ),
                  TextFormField(
                    key: CreateAcc.keyy4,
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
                        hintText: "Soyadınız"),
                    validator: _soyisimKonrol,
                    onSaved: (String value) => lastName = value,
                  ),
                  TextFormField(
                    obscureText: true,
                    key: CreateAcc.keyy3,
                    style: TextStyle(color: Colors.grey.shade400),
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.lock,
                          color: Colors.yellow.shade500,
                          size: 30,
                        ),
                        hintStyle: TextStyle(
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.bold,
                            color: Colors.grey.shade400,
                            fontSize: 17),
                        hintText: "Şifre"),
                    validator: (String value) {
                      if (value.length < 6) {
                        return "En az 6 karakter gerekli";
                      }
                      return null;
                    },
                    onSaved: (String value) => password = value,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        child: Text("Hakkımızda",
                            style: TextStyle(
                                color: Colors.grey.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: 18)),
                        onTap: () async {
                          if (await canLaunch(ieeeMskuTuzuk)) {
                            await launch(ieeeMskuTuzuk);
                          } else {
                            debugPrint("Could not launch: $ieeeMskuTuzuk");
                          }
                        },
                      ),
                      GestureDetector(
                        child: Container(
                          height: 50,
                          width: 100,
                          decoration: BoxDecoration(
                              gradient: orangeButton,
                              borderRadius: BorderRadius.circular(10)),
                          child: Icon(Icons.arrow_forward_ios,
                              color: Colors.white),
                        ),
                        onTap: () {
                          _generateNewUser(context);
                        },
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
          GestureDetector(
              child: Container(
                child: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                  size: 30,
                ),
              ),
              onTap: () {
                Navigator.pop(context);
              }),
          GestureDetector(
            child: Text(
              "Geri",
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            onTap: () {
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }

  String _isimKonrol(String isim) {
    RegExp regex = RegExp(
        "^[abcçdefgğhıijklmnoöprsştuüvyzqwxABCÇDEFGHIİJKLMNOÖPRSŞTUÜVYZQWX]+\$");
    if (!regex.hasMatch(isim))
      return 'Isim numara veya boşluk içermemeli';
    else
      return null;
  }

  String _soyisimKonrol(String soyisim) {
    RegExp regex = RegExp(
        "^[abcçdefgğhıijklmnoöprsştuüvyzqwxABCÇDEFGHIİJKLMNOÖPRSŞTUÜVYZQWX]+\$");
    if (!regex.hasMatch(soyisim))
      return 'Soyisim numara veya boşluk içermemeli';
    else
      return null;
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

  Future<void> _generateNewUser(BuildContext context) async {
    if (CreateAcc.formKeyy.currentState.validate()) {
      CreateAcc.formKeyy.currentState.save();
      PlatformDuyarliAlertDialog(
        baslik: "Üye Kayıt Ediliyor...",
        icerik: "Üye kayıt edilirken lütfen bekleyiniz",
        anaButonYazisi: "Tamam",
      ).goster(context);

      final _userModel = Provider.of<UserModel>(context, listen: false);
      try {
        UserC _user = await _userModel.createUserWithEmailandPassword(
            name, lastName, mail, password, false);
        if (_user != null) {
          Navigator.pop(context);
          var sonuc = await PlatformDuyarliAlertDialog(
            baslik: "Kaydınız Başarıyla Gerçekleştirildi 👍",
            icerik: "Biraz sonra gösterilecek tanıtımdan sonra giriş ekranına " +
                "dönerek e-posta adresiniz ve şifreniz ile giriş yapabilirsiniz.\n" +
                "Stuvent'ın keyfini çıkarabilirsiniz 🥳",
            anaButonYazisi: "Tamam",
          ).goster(context);
          if (sonuc) {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => Intro()));
          }
        } else {
          Navigator.pop(context);
          PlatformDuyarliAlertDialog(
            baslik: "Üye Kayıt Edilirken HATA 😕",
            icerik: "Üye kayıt edilirken bir sorun oluştu.\n" +
                "Lütfen internet bağlantınızı kontrol edin",
            anaButonYazisi: "Tamam",
          ).goster(context);
        }
      } catch (e) {
        Navigator.pop(context);
        PlatformDuyarliAlertDialog(
          baslik: "Kullanıcı Oluşturma HATA 😕",
          icerik: Exceptions.goster(e.code),
          anaButonYazisi: "Tamam",
        ).goster(context);
      }
    } else {
      PlatformDuyarliAlertDialog(
        baslik: "Değerleri Doğru Giriniz",
        icerik: "Lütfen istenilen değerleri tam ve doğru giriniz",
        anaButonYazisi: "Tamam",
      ).goster(context);
    }
  }
}
