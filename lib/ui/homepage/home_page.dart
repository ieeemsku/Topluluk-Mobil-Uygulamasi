import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/app_state.dart';
import 'package:stuventmobil/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:stuventmobil/configuration.dart';
import 'package:stuventmobil/model/event.dart';
import 'package:stuventmobil/model/userC.dart';
import 'package:stuventmobil/notification_handler.dart';
import 'package:stuventmobil/ui/Generate_Event/GeneratEvent.dart';
import 'package:stuventmobil/ui/Generate_Notification/GenerateNotification.dart';
import 'package:stuventmobil/ui/Profil/profil.dart';
import 'package:stuventmobil/ui/Profil/update_password_page.dart';
import 'package:stuventmobil/ui/homepage/category_widget.dart';
import 'package:stuventmobil/ui/homepage/event_widget.dart';
import 'package:stuventmobil/viewmodel/user_model.dart';

import '../const.dart';
import '../event_details/event_details_page.dart';
import '../komiteler.dart';
import 'myEvents.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  var size;
  double ekranYuksekligi, ekranGenisligi;

  bool menuAcikMi = false, superUser = false;

  AnimationController _controller;
  Animation<Offset> _menuOffsetAnimation;
  final Duration _duration = Duration(milliseconds: 300);

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
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    ekranGenisligi = size.width;
    ekranYuksekligi = size.height;

    return ChangeNotifierProvider<AppState>(
      create: (_) => AppState(),
      child: SafeArea(
        child: Scaffold(
          body: Stack(
            children: <Widget>[
              menuOlustur(context),
              AnimatedPositioned(
                top: menuAcikMi ? 0.16 * ekranYuksekligi : 0,
                bottom: menuAcikMi ? 0.16 * ekranYuksekligi : 0,
                left: menuAcikMi ? 0.6 * ekranGenisligi : 0,
                right: menuAcikMi ? -0.55 * ekranGenisligi : 0,
                duration: _duration,
                child: RefreshIndicator(
                  onRefresh: read,
                  child: Container(
                    decoration: BoxDecoration(gradient: homePageBg),
                    child: Scaffold(
                      resizeToAvoidBottomInset: true,
                      backgroundColor: Colors.transparent,
                      body: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 30,
                            ),
                            header(),
                            SizedBox(
                              height: 25,
                            ),
                            komiteHeader(),
                            SizedBox(
                              height: 15,
                            ),
                            komiteler(size, context),
                            cevreText(),
                            SizedBox(
                              height: 25,
                            ),
                            FutureBuilder<void>(
                              future: read(),
                              builder: (context, sonuc) => Consumer<AppState>(
                                builder: (context, appState, _) => Container(
                                    child: etkinlikler(context, appState)),
                              ),
                            ),
                          ],
                        ),
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
        color: primaryGrey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5,
                vertical: 25,
              ),
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 10,
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
                            fontSize: 14,
                            fontWeight: FontWeight.w300,
                            color: Colors.white60,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(
                horizontal: 5,
              ),
              child: Column(
                children: <Widget>[
                  for (final e in drawerItems)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 14,
                      ),
                      child: Row(
                        children: <Widget>[
                          FlatButton.icon(
                              onPressed: () {
                                if (e['title'] == "Etkinliklerim") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => MyEvents()),
                                  );
                                } else if (e['title'] == "Profil") {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Profil()),
                                  );
                                } else if (e['title'] == "Şifremi Güncelle") {
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
                  if (superUser)
                    for (final e in superUserdrawerItems)
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 14,
                        ),
                        child: Row(
                          children: <Widget>[
                            FlatButton.icon(
                                onPressed: () {
                                  if (e['title'] == "Yeni Etkinlik Oluştur") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Create_Event()),
                                    );
                                  } else if (e['title'] ==
                                      "Yeni Bildirim Oluştur") {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => Notice()),
                                    );
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
                ],
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

  Widget header() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
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
          "Stuvent",
          style: headerText,
        ),
        SizedBox(
          width: 25,
        ),
      ],
    );
  }

  Widget komiteHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Komiteler",
          style: headerText2,
        )
      ],
    );
  }

  Widget komiteler(Size size, context) {
    return Container(
      height: 120,
      child: Consumer<AppState>(
        builder: (context, appState, _) => ListView.builder(
          itemCount: komiteIsimler.length,
          itemBuilder: (context, index) {
            return Row(
              children: [
                SizedBox(
                  width: 10,
                ),
                CategoryWidget(
                  categoryId: index,
                ),
                SizedBox(
                  width: 10,
                )
              ],
            );
          },
          scrollDirection: Axis.horizontal,
        ),
      ),
    );
  }

  cevreText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Çevrenizdeki Etkinlikler",
          style: headerText2,
        ),
      ],
    );
  }

  Widget etkinlikler(context, AppState appState) {
    return Container(
      height: komitelerList[appState.selectedCategoryId] * 350.0,
      width: 320,
      child: Column(
        children: [
          for (final event in events)
            if (event.categoryIds.contains(appState.selectedCategoryId))
              Container(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => EventDetailsPage(
                            event: event,
                          ),
                        ));
                  },
                  child: EventWidget(
                    event: event,
                  ),
                ),
              ),
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  Future<void> currentUser() async {
    UserModel userModel = Provider.of<UserModel>(context, listen: false);
    UserC user = await userModel.currentUser();
    setState(() {
      name = user.lastName == null
          ? "${user.userName}"
          : "${user.userName} ${user.lastName}";
      superUser = user.superUser;
    });
  }

  Future<void> _cikisIcinOnayIste(BuildContext context) async {
    final sonuc = await PlatformDuyarliAlertDialog(
      baslik: "Emin Misiniz?",
      icerik: "Oturumu kapatmak istediğinizden emin misiniz?",
      anaButonYazisi: "Evet",
      iptalButonYazisi: "Vazgeç",
    ).goster(context);

    if (sonuc) {
      _cikisYap(context);
    }
  }

  Future<void> _cikisYap(BuildContext context) async {
    try {
      UserModel userModel = Provider.of<UserModel>(context, listen: false);
      await userModel.signOut();
    } catch (e) {
      print("sign out hata: " + e.toString());
    }
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
}
