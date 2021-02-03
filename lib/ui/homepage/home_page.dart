import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/app_state.dart';
import 'package:stuventmobil/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:stuventmobil/model/category.dart';
import 'package:stuventmobil/model/event.dart';
import 'package:stuventmobil/model/userC.dart';
import 'package:stuventmobil/notification_handler.dart';
import 'package:stuventmobil/styleguide.dart';
import 'package:stuventmobil/ui/Profil/profil.dart';
import 'package:stuventmobil/ui/Profil/update_password_page.dart';
import 'package:stuventmobil/ui/event_details/event_details_page.dart';
import 'package:stuventmobil/ui/homepage/my_events.dart';
import 'package:stuventmobil/viewmodel/user_model.dart';

import '../../configuration.dart';
import 'category_widget.dart';
import 'event_widget.dart';

final TextStyle menuFontStyle = TextStyle(color: Colors.black, fontSize: 18);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double ekranYuksekligi, ekranGenisligi;

  bool menuAcikMi = false;

  AnimationController _controller;
  Animation<Offset> _menuOffsetAnimation;
  final Duration _duration = Duration(milliseconds: 300);

  final color = Color(0xFFFF4700);

  String name = "";

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    events.clear();
    NotificationHandler().initializeFCMNotification(context);
    _controller = AnimationController(vsync: this, duration: _duration);
    _menuOffsetAnimation = Tween(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
    currentUser();
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ekranGenisligi = MediaQuery.of(context).size.width;
    ekranYuksekligi = MediaQuery.of(context).size.height;

    return Scaffold(
      body: ChangeNotifierProvider<AppState>(
        create: (_) => AppState(),
        child: SafeArea(
          child: Stack(
            children: <Widget>[
              menuOlustur(context),
              // HomePageBackground(
              //   screenHide: ekranYuksekligi,
              // ),
              AnimatedPositioned(
                top: menuAcikMi ? 0.16 * ekranYuksekligi : 0,
                bottom: menuAcikMi ? 0.16 * ekranYuksekligi : 0,
                left: menuAcikMi ? 0.5 * ekranGenisligi : 0,
                right: menuAcikMi ? -0.4 * ekranGenisligi : 0,
                duration: _duration,
                child: RefreshIndicator(
                  onRefresh: read,
                  child: Material(
                    elevation: 8,
                    color: color,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: (ekranGenisligi / 30)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              mainAxisSize: MainAxisSize.max,
                              children: <Widget>[
                                InkWell(
                                  onTap: () {
                                    menuAcikMiDegistir();
                                  },
                                  child: Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ),
                                ),
                                Text(
                                  "STUVENT ETKİNLİK HABERCİSİ",
                                  style: fadedTextStyle,
                                ),
                                IconButton(
                                  icon: Icon(
                                    Icons.person,
                                    color: Color(0x99FFFFFF),
                                  ),
                                  tooltip: "Profil Ayarları",
                                  onPressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profil()),
                                    );
                                  },
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 32.0),
                            child: Text(
                              "Çevrendeki Etkinliklere Gözat 🥳",
                              style: whiteHeadingTextStyle,
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 24.0),
                            child: Consumer<AppState>(
                              builder: (context, appState, _) =>
                                  SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  children: <Widget>[
                                    for (final category in categories)
                                      CategoryWidget(category: category)
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: FutureBuilder<void>(
                              future: read(),
                              builder: (context, sonuc) => Consumer<AppState>(
                                builder: (context, appState, _) => Column(
                                  children: <Widget>[
                                    for (final event in events)
                                      if (event.categoryIds.contains(
                                          appState.selectedCategoryId))
                                        GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      EventDetailsPage(
                                                    event: event,
                                                  ),
                                                ));
                                          },
                                          child: EventWidget(
                                            event: event,
                                          ),
                                        )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuOlustur(BuildContext context) {
    return SlideTransition(
      position: _menuOffsetAnimation,
      child: Container(
        color: primaryGreen,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 40,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/icon.png'),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                      Text(
                        "Bölüm",
                        style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w300,
                            color: Colors.white60),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Column(
                children: drawerItems
                    .map(
                      (e) => Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                        child: Row(
                          children: <Widget>[
                            FlatButton.icon(
                                onPressed: () {
                                  if (e['title'] == 'Etkinliklerim') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => MyEvents()),
                                    );
                                  } else if (e['title'] == 'Profil') {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Profil()),
                                    );
                                  } else if (e['title'] == 'Şifremi Güncelle') {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                ChangePassword()));
                                  }
                                },
                                icon: Icon(
                                  e['icon'],
                                  color: Colors.white60,
                                  size: 24,
                                ),
                                label: Text(
                                  e['title'],
                                  style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ))
                          ],
                        ),
                      ),
                    )
                    .toList(),
              ),
            ),
            Container(
                margin: EdgeInsets.symmetric(
                  horizontal: 20,
                  vertical: 20,
                ),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      child: Text(
                        'Oturumu Kapat',
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 16,
                        ),
                      ),
                      onTap: () {
                        _cikisIcinOnayIste(context);
                      },
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }

  void menuAcikMiDegistir() {
    setState(() {
      if (menuAcikMi) {
        _controller.reverse();
      } else {
        _controller.forward();
      }
      menuAcikMi = !menuAcikMi;
    });
  }

  Future<void> currentUser() async {
    UserModel userModel = Provider.of<UserModel>(context, listen: false);
    UserC user = await userModel.currentUser();
    setState(() {
      name = user.lastName == null
          ? "${user.userName}"
          : "${user.userName} ${user.lastName}";
    });
  }

  Future<void> _cikisyap(BuildContext context) async {
    try {
      UserModel userModel = Provider.of<UserModel>(context, listen: false);
      await userModel.signOut();
    } catch (e) {
      print("sign out hata:" + e.toString());
    }
  }

  Future<void> _cikisIcinOnayIste(BuildContext context) async {
    final sonuc = await PlatformDuyarliAlertDialog(
      baslik: "Emin Misiniz?",
      icerik: "Oturumu kapatmak istediğinizden emin misiniz?",
      anaButonYazisi: "Evet",
      iptalButonYazisi: "Vazgeç",
    ).goster(context);

    if (sonuc) {
      _cikisyap(context);
    }
  }
}
