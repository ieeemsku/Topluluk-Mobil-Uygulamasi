import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:stuventmobil/model/userC.dart';
import 'package:stuventmobil/ui/Profil/update_password_page.dart';
import 'package:stuventmobil/viewmodel/user_model.dart';

import 'file:///C:/Users/HAKKICAN/AndroidStudioProjects/Topluluk-Mobil-Uygulamasi/lib/ui/Profil/take_info_page.dart';

import '../const.dart';

class Profil extends StatefulWidget {
  @override
  _ProfilState createState() => _ProfilState();
}

class _ProfilState extends State<Profil> {
  final formKey = GlobalKey<FormState>();
  String name = "",
      mail = "",
      bolum = "",
      ilgiAlani = "",
      hobi = "",
      komite = "";
  bool superU = false;

  @override
  Widget build(BuildContext context) {
    UserModel _userModel = Provider.of<UserModel>(context, listen: false);
    read(_userModel);
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Column(children: <Widget>[
        buildHeader(context, size),
        buildPassword(),
        SizedBox(
          height: 35,
        ),
        buildBackAndLogOut(_userModel),
        SizedBox(
          height: 30,
        ),
        buildLegal(size),
      ]),
    );
  }

  Future<void> read(UserModel userModel) async {
    UserC user = await userModel.currentUser();
    setState(() {
      name = user.lastName == null
          ? "${user.userName}"
          : "${user.userName} ${user.lastName}";
      mail = user.email;
      superU = user.superUser;
      bolum = user.bolum;
      ilgiAlani = user.ilgiAlani;
      hobi = user.hobi;
      komite = user.komite;
    });
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
                        size: 45,
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        name,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 30,
                            fontFamily: "Ubuntu",
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        mail,
                        style: mail.length < 20
                            ? headerText2
                            : headerText2.copyWith(fontSize: 20),
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
                    padding:
                        const EdgeInsets.only(left: 20.0, top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Bölüm : $bolum",
                          style: textStyle4,
                        ),
                        Text(
                          "İlgi Alanı : $ilgiAlani",
                          style: textStyle4,
                        ),
                        Text(
                          "Hobi : $hobi",
                          style: textStyle4,
                        ),
                        Text(
                          "Komite : $komite",
                          style: textStyle4,
                        )
                      ],
                    ),
                  ),
                )),
          ),
          Positioned(
            left: size.width * 0.79,
            top: size.height * 0.54,
            child: GestureDetector(
              child: Container(
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                    boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
                    shape: BoxShape.circle,
                    color: Colors.grey.shade300),
                child: Icon(Icons.edit),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TakeInfo()),
                );
              },
            ),
          ),
        ],
        overflow: Overflow.visible,
      ),
    );
  }

  buildPassword() {
    return GestureDetector(
      child: Container(
        height: 50,
        width: 220,
        decoration: BoxDecoration(
          boxShadow: [BoxShadow(blurRadius: 10, color: Colors.grey)],
          color: Color.fromRGBO(57, 28, 178, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(child: Text("Şifremi Güncelle", style: miniHeader2)),
      ),
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ChangePassword()),
        );
      },
    );
  }

  buildBackAndLogOut(UserModel userModel) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0),
      child: Row(
        children: [
          IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              }),
          GestureDetector(
            child: Text(
              "Geri",
              style: textStyle4,
            ),
            onTap: () {
              Navigator.pop(context);
            },
          ),
          SizedBox(
            width: 150,
          ),
          IconButton(
              icon: Icon(MaterialCommunityIcons.logout),
              onPressed: () {
                _cikisIcinOnayIste(context, userModel);
              }),
          GestureDetector(
            child: Text(
              "Çıkış",
              style: textStyle4,
            ),
            onTap: () {
              _cikisIcinOnayIste(context, userModel);
            },
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

  Future<void> _cikisyap(BuildContext context, UserModel userModel) async {
    try {
      await userModel.signOut();

      final sonuc = await PlatformDuyarliAlertDialog(
        baslik: "Oturumunuz Kapatıldı 😞",
        icerik: "Oturumunuz başarıyla kapatıldı\n" + "Yine Bekleriz...",
        anaButonYazisi: "Tamam",
      ).goster(context);
      if (sonuc) {
        Navigator.pop(context);
      }
    } catch (e) {
      print("sign out hata:" + e.toString());
    }
  }

  Future<void> _cikisIcinOnayIste(
      BuildContext context, UserModel userModel) async {
    final sonuc = await PlatformDuyarliAlertDialog(
      baslik: "Emin Misiniz?",
      icerik: "Oturumu kapatmak istediğinizden emin misiniz?",
      anaButonYazisi: "Evet",
      iptalButonYazisi: "Vazgeç",
    ).goster(context);

    if (sonuc) {
      _cikisyap(context, userModel);
    }
  }
}
