import 'package:flutter/material.dart';

List categories = [
  "Bilgisayar Mühendisliği",
  "Elektrik Elektronik Mühendisliği",
  "İnşaat Mühendisliği"
];
List categories2 = ["Wie", "Cs", "Ea"];
const detailsColor = Color.fromRGBO(151, 175, 255, 1);
const detailsColor2 = Color.fromRGBO(213, 217, 255, 1);

const headerText = TextStyle(
    fontFamily: "Ubuntu",
    color: Colors.white,
    fontSize: 42,
    fontWeight: FontWeight.bold,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(3.0, 3.0),
        blurRadius: 8.0,
        color: Color.fromARGB(43, 43, 43, 0),
      ),
    ]);
const headerText2 = TextStyle(
    fontFamily: "Ubuntu",
    color: Colors.white,
    fontSize: 30,
    fontWeight: FontWeight.bold,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(3.0, 3.0),
        blurRadius: 8.0,
        color: Color.fromARGB(43, 43, 43, 0),
      ),
    ]);

const miniHeader = TextStyle(
    fontFamily: "Catamaran",
    color: Colors.white,
    fontSize: 15,
    fontWeight: FontWeight.bold,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(5.0, 5.0),
        blurRadius: 10.0,
        color: Color.fromARGB(43, 43, 43, 0),
      ),
    ]);

const miniHeader2 = TextStyle(
    fontFamily: "Catamaran",
    color: Colors.white,
    fontSize: 18,
    fontWeight: FontWeight.bold,
    shadows: <Shadow>[
      Shadow(
        offset: Offset(5.0, 5.0),
        blurRadius: 10.0,
        color: Color.fromARGB(43, 43, 43, 0),
      ),
    ]);

var splashBg = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: <double>[
      0.1,
      0.9,
    ],
    colors: [
      Color.fromRGBO(255, 255, 255, 1),
      Color.fromRGBO(112, 128, 144, 1),
    ]);
var textStyle4 = TextStyle(
    color: Colors.grey.shade900,
    fontFamily: "Catamaran",
    fontSize: 18,
    fontWeight: FontWeight.bold);

var textStyle3 = TextStyle(
    color: Colors.grey.shade500,
    fontFamily: "Catamaran",
    fontSize: 18,
    fontWeight: FontWeight.bold);

var textStyle2 = TextStyle(
    color: Colors.grey.shade700,
    fontFamily: "Catamaran",
    fontSize: 22,
    fontWeight: FontWeight.bold);

var textStyle1 = TextStyle(
    color: Colors.grey.shade700, fontFamily: "Catamaran", fontSize: 16);
var indigoButton = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: <double>[
      0.1,
      0.5,
      0.9
    ],
    colors: [
      Color.fromRGBO(206, 210, 242, 1),
      Color.fromRGBO(138, 149, 243, 1),
      Color.fromRGBO(124, 127, 225, 1)
    ]);
var detailsButton = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: <double>[
      0.1,
      0.4,
      0.9
    ],
    colors: [
      Color.fromRGBO(151, 175, 255, 1),
      Color.fromRGBO(151, 175, 255, 1),
      Color.fromRGBO(255, 255, 255, 1),
    ]);

var homePageBg = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [0.1, 0.6, 0.9],
    colors: [Colors.grey.shade900, Colors.grey, Colors.white]);

var loginPageBg = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    stops: [
      0.1,
      0.6,
      0.9
    ],
    colors: [
      Color.fromRGBO(0, 5, 161, 1),
      Color.fromRGBO(138, 149, 243, 1),
      Color.fromRGBO(201, 206, 251, 1),
    ]);

const createAccBg = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [
      0.1,
      0.5,
      0.9
    ],
    colors: [
      Color.fromRGBO(255, 255, 252, 1),
      Color.fromRGBO(255, 241, 151, 1),
      Color.fromRGBO(250, 164, 26, 1)
    ]);
const orangeButton = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [
      0.1,
      0.4,
      0.9
    ],
    colors: [
      Color.fromRGBO(255, 255, 252, 1),
      Color.fromRGBO(255, 241, 151, 1),
      Color.fromRGBO(250, 164, 26, 1),
    ]);

var butonBorder = BorderRadius.circular(10);

var new_event_color = Color.fromRGBO(30, 227, 167, 1);

const new_event_color_button = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [
      0.1,
      0.4,
      0.9
    ],
    colors: [
      Color.fromRGBO(30, 227, 167, 1),
      Color.fromRGBO(220, 247, 239, 1),
      Color.fromRGBO(250, 164, 26, 1)
    ]);

const blueBotton = LinearGradient(
    begin: Alignment.topRight,
    end: Alignment.bottomLeft,
    stops: [
      0.1,
      0.7,
      0.9
    ],
    colors: [
      Color.fromRGBO(0, 150, 183, 1),
      Color.fromRGBO(141, 211, 212, 1),
      Color.fromRGBO(141, 211, 225, 1),
    ]);

const qrColor = Color.fromRGBO(242, 210, 242, 1);

const fakulteler = [
  "Dalaman Sivil Havacılık",
  "Diş Hekimliği",
  "Edebiyat",
  "Eğitim",
  "Fen",
  "Fethiye İşletme",
  "Fethiye Sağlık Bilimleri",
  "İktisadi ve İdari Bilimler",
  "İslami İlimler",
  "Milas Veteriner",
  "Mimarlık",
  "Mühendislik",
  "Sağlık Bilimleri",
  "Seydikemer Uygulamalı Bilimler",
  "Su Ürünleri",
  "Teknoloji",
  "Tıp",
  "Turizm"
];

const dalamanSivilHavacilikYuksekokulu = ["Havacılık Yönetimi"];

const disHekimligi = ["Diş Hekimliği"];

const edebiyat = [
  "Arkeoloji",
  "Çağdaş Türk Lehçeleri ve Edebiyatları",
  "Felsefe",
  "İngiliz Dili ve Edebiyatı",
  "İngilizce Mütercim ve Tercümanlık",
  "Psikoloji",
  "Sanat Tarihi",
  "Sosyoloji",
  "Tarih",
  "Tarih (İÖ)",
  "Türk Dili ve Edebiyatı",
  "Türk Dili ve Edebiyatı (İÖ)"
];

const egitim = [
  "Almanca Öğretmenliği",
  "Fen Bilgisi Öğretmenliği",
  "İlköğretim Matematik Öğretmenliği",
  "İngilizce Öğretmenliği (İngilizce)",
  "Okul Öncesi Öğretmenliği",
  "Özel Eğitim Öğretmenliği",
  "Rehberlik ve Psikolojik Danışmanlık",
  "Sınıf Öğretmenliği",
  "Sosyal Bilgiler Öğretmenliği",
  "Türkçe Öğretmenliği"
];

const fen = [
  "Biyoloji",
  "Fizik",
  "İstatistik",
  "Kimya",
  "Matematik",
  "Moleküler Biyoloji ve Genetik"
];

const isletme = [
  "Ekonomi ve Finans",
  "İşletme",
  "Turizm İşletmeciliği",
  "Uluslararası Ticaret ve Lojistik",
  "Yönetim Bilişim Sistemleri"
];

const fethiyeSaglik = ["Beslenme ve Diyetetik", "Hemşirelik"];

const iktisadi = [
  "Çalışma Ekonomisi ve Endüstri İlişkileri",
  "Çalışma Ekonomisi ve Endüstri İlişkileri (İÖ)",
  "İktisat",
  "İktisat (İngilizce)",
  "İktisat (İngilizce) (İÖ)",
  "İktisat (İÖ)",
  "İşletme",
  "İşletme (İÖ)",
  "Kamu Yönetimi",
  "Kamu Yönetimi (İÖ)",
  "Siyaset Bilimi ve Uluslararası İlişkiler",
  "Uluslararası Ticaret ve Finansman",
  "Uluslararası Ticaret ve Finansman (İÖ)"
];

const islami = ["İslami İlimler"];

const veteriner = ["Veterinerlik"];

const mimarlik = ["Mimarlık", "Şehir ve Bölge Planlama"];

const muhendislik = [
  "Bilgisayar Mühendisliği",
  "Elektrik-Elektronik Mühendisliği",
  "İnşaat Mühendisliği",
  "Maden Mühendisliği",
  "Metalürji ve Malzeme Mühendisliği"
];

const saglik = [
  "Beslenme ve Diyetetik",
  "Fizyoterapi ve Rehabilitasyon",
  "Hemşirelik",
  "Sağlık Yönetimi"
];

const seydikemer = ["Muhasebe ve Finans Yönetimi", "Sosyal Hizmet"];

const su = ["Su Ürünleri Mühendisliği"];

const teknoloji = [
  "Ağaç İşleri Endüstri Mühendisliği",
  "Bilişim Sistemleri Mühendisliği",
  "Enerji Sistemleri Mühendisliği"
];

const tip = ["Tıp", "Tıp (İngilizce)"];

const turizm = [
  "Turizm İşletmeciliği",
  "Turizm İşletmeciliği (İngilizce)",
  "Yiyecek ve İçecek İşletmeciliği",
  "Yiyecek ve İçecek İşletmeciliği (KKTC Uyruklu)"
];
