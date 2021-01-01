import 'package:fancy_on_boarding/fancy_on_boarding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
        heroAssetPath: path + 'CS_420x.png',
        title: Text("Computer Society", style: titleTextStyle),
        body: Text(
            "IEEE Computer Society genelini bilgisayar/bilişim mühendislerinin "
            "oluşturduğu, IEEE'nin alt topluluklarından birisidir. 100,000'den "
            "fazla üyesi ile dünyanın bilgisayar alanında en büyük mesleki ve "
            "teknik kuruluşudur.",
            textAlign: TextAlign.center,
            style: bodyTextStyle),
        iconAssetPath: path + 'CS_90x.png'),
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
        heroAssetPath: path + 'PES_420x.png',
        title: Text(
          "Power And Energy Society",
          style: titleTextStyle,
          textAlign: TextAlign.center,
        ),
        body: Text(
            "Power and Energy Society(PES) yani Güç ve Enerji Topluluğu,IEEE‘nin bünyesinde barındırdığı "
            "39 topluluk arasında en eski olanlarından biridir. Temel olarak uğraştığı sektör enerji sektörüdür. "
            "Enerjiyi mümkün olduğu kadar çevreci, verimli, olabilecek en yüksek faydada, hayati tehlike taşımadan,"
            "plan yapan ve çalışan bir topluluktur.",
            textAlign: TextAlign.center,
            style: bodyTextStyle),
        iconAssetPath: path + 'PES_90x.png'),
    PageModel(
        color: color,
        heroAssetPath: path + 'WIE _420x.png',
        title: Text("Women in Engineering", style: titleTextStyle),
        body: Text(
            " WIE, IEEE’nin diğer komitelerinden farklı olarak bir farkındalık komitesidir. IEEE WIE, "
            "kadınların da kendi istedikleri meslekleri seçmesi ve bu mesleklerde kendilerini daha iyi ifade "
            "etmeleri için farkındalık çalışmalarını yürütüyor. Özellikle kadınların da mühendislik, bilim, "
            "kariyer ve yönetim alanlarında en az erkekler kadar sektörün içinde ve onlar kadar söz sahibi "
            "olmasını sağlamaya çalışıyor.",
            textAlign: TextAlign.center,
            style: bodyTextStyle),
        iconAssetPath: path + 'WIE_90.png'),
    PageModel(
        color: color,
        heroAssetPath: path + 'RAS_420x.png',
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
        iconAssetPath: path + 'RAS_90.png')
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
