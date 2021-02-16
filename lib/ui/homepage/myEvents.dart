import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/model/userC.dart';
import 'package:stuventmobil/viewmodel/user_model.dart';

import '../const.dart';

class MyEvents extends StatefulWidget {
  @override
  _MyEventsState createState() => _MyEventsState();
}

class _MyEventsState extends State<MyEvents> {
  var bankSelected;
  List<dynamic> katildigimEtkinlikler = [], katilacagimEtkinlikler = [];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    readEvents();
    return Scaffold(
      body: Container(
        height: size.height,
        child: Column(
          children: [
            buildHeader(size),
            SizedBox(
              height: 15,
            ),
            oldEvents(katildigimEtkinlikler, "Katıldıklarım", size, context),
            newEvents(katilacagimEtkinlikler, "Katılacaklarım", size, context)
          ],
        ),
      ),
    );
  }

  Future<void> readEvents() async {
    try {
      UserModel userModel = Provider.of<UserModel>(context);
      UserC userC = await userModel.currentUser();
      String userId = userC.userID;
      katildigimEtkinlikler = await userModel.readEvents(userId);
      katilacagimEtkinlikler = await userModel.readWillEvents(userId);
    } catch (e) {
      print("readEvents hata: " + e.toString());
    }
  }

  Widget buildHeader(Size size) {
    return Container(
      height: 200,
      width: size.width,
      decoration: BoxDecoration(
          color: Colors.purple.shade100,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          )),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Text(
              "Etkinliklerim",
              style: headerText,
            ),
          ),
        ],
      ),
    );
  }

  oldEvents(List<dynamic> list, String hint, Size size, context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 24, top: 12),
      child: Container(
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Colors.grey.shade300),
        child: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.grey.shade300,
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown: true,
                )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                iconEnabledColor: Colors.grey.shade900,
                items: list.map((dynamic value) {
                  return DropdownMenuItem<dynamic>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Container(
                        height: 50,
                        width: size.width - 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              value,
                              style: textStyle1,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
                hint: Text(
                  hint,
                  style: TextStyle(),
                ),
                onChanged: (dynamic value) {
                  return null;
                },
                value: bankSelected,
              ),
            )),
      ),
    );
  }

  newEvents(List<dynamic> list, String hint, Size size, context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30, bottom: 24, top: 12),
      child: Container(
        height: 50,
        width: size.width,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(3)),
            color: Colors.grey.shade300),
        child: Theme(
            data: Theme.of(context).copyWith(
                canvasColor: Colors.grey.shade300,
                buttonTheme: ButtonTheme.of(context).copyWith(
                  alignedDropdown: true,
                )),
            child: DropdownButtonHideUnderline(
              child: DropdownButton<dynamic>(
                iconEnabledColor: Colors.grey.shade900,
                items: list.map((dynamic value) {
                  return DropdownMenuItem<dynamic>(
                    value: value,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 5.0),
                      child: Container(
                        height: 50,
                        width: size.width - 150,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              value,
                              style: textStyle1,
                            ),
                            SizedBox(
                              height: 20,
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }).toList(),
                hint: Text(
                  hint,
                  style: TextStyle(),
                ),
                onChanged: (dynamic value) {
                  return null;
                },
                value: bankSelected,
              ),
            )),
      ),
    );
  }
}
