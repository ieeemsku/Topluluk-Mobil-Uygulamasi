import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/common_widget/merkez_widget.dart';
import 'package:stuventmobil/model/userC.dart';
import 'package:stuventmobil/viewmodel/user_model.dart';

class MyEvents extends StatefulWidget {
  @override
  _MyEventsState createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  List<dynamic> myEvents = [];

  @override
  Widget build(BuildContext context) {
    readEvents();
    return Scaffold(
      appBar: AppBar(
        title: Text("Etkinliklerim"),
      ),
      body: myEvents.length == 0
          ? MerkezWidget(
              children: [
                Image.asset(
                  "assets/icon.png",
                  height: 100,
                  width: 100,
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  "Etkinlikleriniz Yükleniyor",
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(
                  height: 10,
                ),
                CircularProgressIndicator(
                  backgroundColor: Colors.white,
                  valueColor: AlwaysStoppedAnimation<Color>(Color(0xfff1c984)),
                )
              ],
            )
          : ListView(
              children: <Widget>[
                ExpansionTile(
                  leading: Icon(Icons.event),
                  title: Text(
                    "Katıldığım Etkinlikler",
                    style: TextStyle(fontSize: 20),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder<void>(
                        future: readEvents(),
                        builder: (context, sonuc) => Column(
                          children: <Widget>[
                            for (final myEvent in myEvents)
                              ListTile(
                                leading: Text(
                                  (myEvents.indexOf(myEvent) + 1).toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                title: Text(
                                  myEvent,
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                ExpansionTile(
                  leading: Icon(Icons.add_alert),
                  title: Text(
                    "Katılacağım Etkinlikler",
                    style: TextStyle(fontSize: 20),
                  ),
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FutureBuilder<void>(
                        future: readEvents(),
                        builder: (context, sonuc) => Column(
                          children: <Widget>[
                            for (final myEvent in myEvents)
                              ListTile(
                                leading: Text(
                                  (myEvents.indexOf(myEvent) + 1).toString(),
                                  style: TextStyle(fontSize: 20),
                                ),
                                title: Text(
                                  myEvent,
                                  style: TextStyle(fontSize: 20),
                                ),
                              )
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
    );
  }

  Future<void> readEvents() async {
    try {
      UserModel userModel = Provider.of<UserModel>(context);
      UserC userC = await userModel.currentUser();
      String userId = userC.userID;
      myEvents = await userModel.readEvents(userId);
    } catch (e) {
      print("readEvents hata: " + e.toString());
    }
  }
}
