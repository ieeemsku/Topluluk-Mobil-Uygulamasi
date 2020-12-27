import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/material.dart';
import 'package:stuventmobil/ui/Login/login.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  static String path = 'assets/png/';
  static Color white = Colors.white;
  static Color color = Color(0xFF678FB4);
  static TextStyle titleTextStyle =
      TextStyle(fontWeight: FontWeight.w800, color: white, fontSize: 34.0);
  static TextStyle bodyTextStyle = TextStyle(
    color: white,
    fontSize: 18,
  );

  final pageList = [
    PageModel(
        color: color,
        heroImagePath: path + 'CS_420x.png',
        title: Text("Computer Society", style: titleTextStyle),
        body: Text(
            "IEEE Computer Society genelini bilgisayar/bilişim mühendislerinin "
            "oluşturduğu, IEEE'nin alt topluluklarından birisidir. 100,000'den "
            "fazla üyesi ile dünyanın bilgisayar alanında en büyük mesleki ve "
            "teknik kuruluşudur.",
            textAlign: TextAlign.center,
            style: bodyTextStyle),
        iconImagePath: path + 'CS_90x.png'),
    PageModel(
        color: color,
        heroImagePath: path + 'EA_420x.png',
        title: Text("Educational Activities", style: titleTextStyle),
        body: Text(
            "Daha öncesinde Sosyal Sorumluluk Projesi (SSP) olarak bilinen ve "
            "eğitim amacını vurgulamak hedefi ile 2018-2019 eğitim yılına giriş "
            "yaparken Educational Activities (EA) adı altında faaliyet yürütmesi "
            "kararı alınmış bir IEEE komitesidir.",
            textAlign: TextAlign.center,
            style: bodyTextStyle),
        iconImagePath: path + 'EA_90x.png'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyOnBoarding(
        doneButtonText: "Tamam",
        skipButtonText: "Geç",
        pageList: pageList,
        onDoneButtonPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        ),
        onSkipButtonPressed: () => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Login()),
        ),
      ),
    );
  }
}
