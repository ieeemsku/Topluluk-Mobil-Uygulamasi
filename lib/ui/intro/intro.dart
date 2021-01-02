import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Intro extends StatefulWidget {
  @override
  _IntroState createState() => _IntroState();
}

class _IntroState extends State<Intro> {
  static String path = 'assets/Logolar/';
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
        heroAssetPath: path + 'CS/IEEE-CS_LogoTM-orange.png',
        title: Text("Computer Society", style: titleTextStyle),
        body: Text(
            "Küresel bir teknoloji liderleri topluluğu için güvenilir bilgi, ağ "
            "iletişimi ve kariyer geliştirme kaynağıdır, 100.000'den fazla üyesi "
            "ile dünyada bu alandaki en büyük topluluktur.",
            textAlign: TextAlign.center,
            style: bodyTextStyle),
        iconAssetPath: path + 'CS/IEEE-CS_LogoTM-white.png'),
    PageModel(
        color: color,
        heroAssetPath: path + 'EA_420x.png',
        title: Text(
          "Educational Activities",
          style: titleTextStyle,
          textAlign: TextAlign.center,
        ),
        body: Text(
            "Daha öncesinde Sosyal Sorumluluk Projesi (SSP) olarak bilinen ve "
            "eğitim amacını vurgulamak hedefi ile 2018-2019 eğitim yılına giriş "
            "yaparken Educational Activities (EA) adı altında faaliyet yürütmesi "
            "kararı alınmış bir IEEE komitesidir.",
            textAlign: TextAlign.center,
            style: bodyTextStyle),
        iconAssetPath: path + 'EA_90x.png'),
    PageModel(
        color: color,
        heroAssetPath: path + 'CSoc_420x.png',
        title: Text(
          "Communications Society",
          style: titleTextStyle,
          textAlign: TextAlign.center,
        ),
        body: Text(
            "IEEE Communications Society (ComSoc) Dünya çapında geliştirilen mühendislik metodolojisini "
            "haberleşme teknolojisine uygulayan, bu amaçla insan yaşam kalitesini arttırmaya yönelik; mesleki "
            "gelişimi sağlama, mesleğe teşviki arttırmayı ilke edinmiş telekomünikasyon mühendisleri topluluğudur.",
            textAlign: TextAlign.center,
            style: bodyTextStyle),
        iconAssetPath: path + 'CSoc_90x.png'),
    PageModel(
        color: color,
        heroAssetPath: path + 'PES/IEEE-PES-Logo-RGB.png',
        title: Text(
          "Power And Energy Society",
          style: titleTextStyle,
          textAlign: TextAlign.center,
        ),
        body: Text(
            "PES enerji alanında daha verimli bir geleceği inşa etmeyi hedefler "
            "'MORE POWER TO THE FUTURE'.",
            textAlign: TextAlign.center,
            style: bodyTextStyle),
        iconAssetPath: path + 'PES/IEEE-PES-Logo-White.png'),
    PageModel(
        color: color,
        heroAssetPath: path + 'WIE/WIE_K_logo_72.png',
        title: Text("Women in Engineering", style: titleTextStyle),
        body: Text(
            "Mühendislikte kadının öneminin vurgulandığı , cinsiyet eşitliliğini "
            "topluma yaymak adına kadın erkek herkesin desteklediği ve "
            "çalışmaların düzenlendiği IEEE alt birimidir.",
            textAlign: TextAlign.center,
            style: bodyTextStyle),
        iconAssetPath: path + 'WIE/WIE_90.png'),
    PageModel(
        color: color,
        heroAssetPath: path + 'RAS/IEEE_RAS_logo_4C_stacked.png',
        title: Text(
          "Robotics & Automation Society",
          style: titleTextStyle,
          textAlign: TextAlign.center,
        ),
        body: Text(
            "IEEE Robotics and Automation Society amaçları bilimsel, edebi ve "
            "eğitsel niteliktedir. Bizler, robotik ve otomasyon mühendisliği ve bilimi,"
            " müttefik sanatlar, bilimler teorisi ve pratiğinin ilerletilmesi ve "
            "üyeleri arasındaki yüksek mesleki standartların IEEE Anayasası ve Tüzüğü "
            "ile uyumlu olarak sürdürülmesi için çaba göstermekteyiz.",
            textAlign: TextAlign.center,
            style: bodyTextStyle),
        iconAssetPath: path + 'RAS/IEEE_RAS_logo White_stacked.png')
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FancyOnBoarding(
        doneButtonText: "Tamam",
        skipButtonText: "Geç",
        pageList: pageList,
        onDoneButtonPressed: () {
          Navigator.pop(context);
        },
        onSkipButtonPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }
}
