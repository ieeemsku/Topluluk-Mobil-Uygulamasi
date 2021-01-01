import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/app/exceptions.dart';
import 'package:stuventmobil/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:stuventmobil/model/userC.dart';
import 'package:stuventmobil/ui/Login/new_User.dart';
import 'package:stuventmobil/ui/intro/intro.dart';
import 'package:stuventmobil/viewmodel/user_model.dart';

import '../const.dart';

class LoginPage extends StatelessWidget {
  static GlobalKey<FormState> formKey = GlobalKey<FormState>();
  static Key key1 = new GlobalKey();
  static Key key2 = new GlobalKey();
  Size size;

  String mail, password;
  bool otomatikKontrol = false;

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    UserModel _userModel = Provider.of<UserModel>(context);

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
                      child: buildFormfield(_userModel, context)),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  child: googleButton(),
                  onTap: () {
                    gSignIn(context);
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    child: hesapOlustur(),
                    onTap: (() => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => CreateAcc()))))
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

  Widget buildFormfield(UserModel userModel, BuildContext context) {
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
              validator: (String value) {
                if (value.length < 6) {
                  return "En az 6 karakter gerekli";
                }
                return null;
              },
              onSaved: (String value) => password = value,
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
                  onTap: () {
                    _sifremiUnuttum(userModel, context);
                  },
                ),
                GestureDetector(
                  child: Container(
                      height: size.height * 0.07,
                      width: size.width * 0.25,
                      decoration: BoxDecoration(
                          gradient: indigoButton,
                          borderRadius: BorderRadius.circular(5)),
                      child: Icon(Icons.forward, color: Colors.white)),
                  onTap: () {
                    emailvesifregiris(context);
                  },
                )
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

  String _emailKontrol(String value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = new RegExp(pattern);
    if (!regex.hasMatch(value))
      return 'Geçersiz mail';
    else
      return null;
  }

  Future<void> _sifremiUnuttum(
      UserModel userModel, BuildContext context) async {
    formKey.currentState.save();
    if (mail == "") {
      PlatformDuyarliAlertDialog(
        baslik: "E-posta Alanı",
        icerik: "E-posta alanını boş bırakamazsınız",
        anaButonYazisi: "Tamam",
      ).goster(context);
    } else {
      try {
        bool sonuc = await userModel.sendPasswordResetEmail(mail);
        if (sonuc == true || sonuc == null) {
          PlatformDuyarliAlertDialog(
            baslik: "Şifre Sıfırlama Mailı Gönderildi",
            icerik:
                "Şifre sıfırlama mailı başarılı bir şekilde $mail adresine gönderildi",
            anaButonYazisi: "Tamam",
          ).goster(context);
        } else {
          PlatformDuyarliAlertDialog(
            baslik: "Şifre Sıfırlama Mailı Gönderilemedi 😕",
            icerik: "Şifre sıfırlama mailı gönderilirken bir sorun oluştu. \n" +
                "İnternet bağlantınızı kontrol edin",
            anaButonYazisi: "Tamam",
          ).goster(context);
        }
      } on PlatformException catch (e) {
        PlatformDuyarliAlertDialog(
          baslik: "Şifre Sıfırlama Maili HATA",
          icerik: Exceptions.goster(e.code),
          anaButonYazisi: "Tamam",
        ).goster(context);
      }
    }
  }

  Future<void> emailvesifregiris(BuildContext context) async {
    if (formKey.currentState.validate()) {
      formKey.currentState.save();

      final _usermodel = Provider.of<UserModel>(context, listen: false);
      try {
        UserC userC =
            await _usermodel.signInWithEmailandPassword(mail, password);
        if (userC != null) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => Intro()));
        }
      } catch (e) {
        PlatformDuyarliAlertDialog(
          baslik: "E-posta ve Şifre ile Giriş HATA",
          icerik: Exceptions.goster(e.code),
          anaButonYazisi: "Tamam",
        ).goster(context);
      }
    }
  }

  Future<void> gSignIn(BuildContext context) async {
    final _userModel = Provider.of<UserModel>(context, listen: false);
    UserC userC = await _userModel.signInWithGoogle();
    if (userC != null) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Intro()));
    }
  }
}
