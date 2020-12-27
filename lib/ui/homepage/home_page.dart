import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/app_state.dart';
import 'package:stuventmobil/model/category.dart';
import 'package:stuventmobil/model/event.dart';
import 'package:stuventmobil/notification_handler.dart';
import 'package:stuventmobil/styleguide.dart';
import 'package:stuventmobil/ui/Profil/profil.dart';
import 'package:stuventmobil/ui/event_details/event_details_page.dart';
import 'package:url_launcher/url_launcher.dart';

import 'category_widget.dart';
import 'event_widget.dart';

final TextStyle menuFontStyle = TextStyle(color: Colors.black, fontSize: 18);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  double ekranYuksekligi;

  bool menuAcikMi = false;

  AnimationController _controller;
  Animation<Offset> _menuOffsetAnimation;
  final Duration _duration = Duration(milliseconds: 300);

  final color = Color(0xFFFF4700);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    events.clear();
    NotificationHandler().initializeFCMNotification(context);
    _controller = AnimationController(vsync: this, duration: _duration);
    _menuOffsetAnimation = Tween(begin: Offset(-1, 0), end: Offset(0, 0))
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn));
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
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
                top: menuAcikMi ? 0.2 * ekranYuksekligi : 0,
                bottom: menuAcikMi ? 0.2 * ekranYuksekligi : 0,
                left: menuAcikMi ? 0.5 * width : 0,
                right: menuAcikMi ? -0.4 * width : 0,
                duration: _duration,
                child: RefreshIndicator(
                  onRefresh: read,
                  child: Material(
                    borderRadius: menuAcikMi
                        ? BorderRadius.all(Radius.circular(50))
                        : null,
                    elevation: 8,
                    color: color,
                    child: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Padding(
                            padding:
                                EdgeInsets.symmetric(horizontal: (width / 30)),
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
                            child: menuAcikMi
                                ? Container(
                                    width: width,
                                    height: ekranYuksekligi,
                                  )
                                : FutureBuilder<void>(
                                    future: read(),
                                    builder: (context, sonuc) =>
                                        Consumer<AppState>(
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
    String ieeeMskuTuzuk = "http://ieeemsku.com/ieee-msku-tuzugu/";

    return SlideTransition(
      position: _menuOffsetAnimation,
      child: Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FlatButton.icon(
                  onPressed: () {
                    menuAcikMiDegistir();
                  },
                  icon: Icon(
                    Icons.home,
                    color: color,
                  ),
                  label: Text(
                    "Ana Sayfa",
                    style: menuFontStyle,
                  )),
              SizedBox(
                height: 10,
              ),
              FlatButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.account_balance,
                    color: color,
                  ),
                  label: Text(
                    "Komitelerimiz",
                    style: menuFontStyle,
                  )),
              SizedBox(
                height: 10,
              ),
              FlatButton.icon(
                  onPressed: () async {
                    if (await canLaunch(ieeeMskuTuzuk)) {
                      await launch(ieeeMskuTuzuk);
                    } else {
                      debugPrint("Could not launch: $ieeeMskuTuzuk");
                    }
                  },
                  icon: Icon(
                    Icons.info,
                    color: color,
                  ),
                  label: Text(
                    "Hakkımızda",
                    style: menuFontStyle,
                  )),
              SizedBox(
                height: 10,
              ),
              FlatButton.icon(
                  onPressed: null,
                  icon: Icon(
                    Icons.mail,
                    color: color,
                  ),
                  label: Text(
                    "İletişim",
                    style: menuFontStyle,
                  )),
              SizedBox(
                height: 10,
              ),
            ],
          ),
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
}
