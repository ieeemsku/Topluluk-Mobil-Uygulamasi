import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:stuventmobil/app/exceptions.dart';
import 'package:stuventmobil/common_widget/platform_duyarli_alert_dialog.dart';
import 'package:stuventmobil/model/event.dart';
import 'package:stuventmobil/ui/QrCode/scan.dart';
import 'package:stuventmobil/ui/event_details/participants_page.dart';
import 'package:stuventmobil/viewmodel/user_model.dart';

import '../const.dart';

class EventDetailsPage extends StatelessWidget {
  final Function press;
  var size;
  final Event event;

  EventDetailsPage({Key key, this.press, this.event}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    UserModel _userModel = Provider.of<UserModel>(context);
    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Column(
            children: [
              buildHeader(size),
              SizedBox(
                height: 150,
              ),
              buildBody(size),
              SizedBox(
                height: 20,
              ),
              buildButtons(size, _userModel, context),
              SizedBox(
                height: 20,
              ),
              buildBackAndQr(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader(Size size) {
    return Container(
      height: size.height * 0.25,
      decoration: BoxDecoration(
          color: detailsColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              spreadRadius: 2,
              blurRadius: 7,
            )
          ]),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Text(
              "Ayrıntılar",
              style: headerText,
            ),
          ),
        ],
      ),
    );
  }

  buildBody(Size size) {
    return Column(
      children: [
        SizedBox(
          height: 8.0,
        ),
        Stack(
          overflow: Overflow.visible,
          children: [
            Container(
              height: size.height * 0.25,
              width: size.width * 0.8,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: detailsColor2,
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 50,
                  ),
                  Text(
                    "Buluşma Yeri: " + event.location,
                    style: miniHeader2,
                  )
                ],
              ),
            ),
            Positioned(
              top: -140,
              left: 35,
              child: Container(
                height: size.height * 0.3,
                width: size.width * 0.6,
                child: Hero(
                    tag: event.title,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: FadeInImage.assetNetwork(
                          placeholder: "assets/loading.gif",
                          image: event.imageURL,
                          fit: BoxFit.cover,
                        ))),
              ),
            )
          ],
        ),
      ],
    );
  }

  Widget buildButtons(Size size, UserModel userModel, BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: detailsColor, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: GestureDetector(
              child: Text(
                "Katılıyorum",
                style: miniHeader2,
              ),
              onTap: () {
                katiliyorum(userModel, event.title, context);
              },
            ),
          ),
        ),
        Container(
          height: 50,
          width: 150,
          decoration: BoxDecoration(
              color: detailsColor, borderRadius: BorderRadius.circular(20)),
          child: Center(
            child: GestureDetector(
              child: Text(
                "Kimler Katılıyor?",
                style: miniHeader2,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ParticipantsPage(
                            eventName: event.title,
                          )),
                );
              },
            ),
          ),
        ),
      ],
    );
  }

  Widget buildBackAndQr(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Container(
            child: Row(
              children: [
                Icon(
                  Icons.arrow_back,
                  color: detailsColor,
                ),
                Text(
                  "Geri",
                  style: TextStyle(color: detailsColor, fontSize: 20),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 50,
          width: 50,
          decoration: BoxDecoration(
              gradient: indigoButton, borderRadius: BorderRadius.circular(10)),
          child: GestureDetector(
            child: Icon(
              Icons.camera_alt,
              color: Colors.white,
              size: 35,
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => ScanScreen()),
              );
            },
          ),
        ),
        SizedBox(
          width: 50,
        ),
      ],
    );
  }

  Future<void> katiliyorum(
      UserModel userModel, String eventName, BuildContext context) async {
    try {
      bool sonuc = await userModel.katilacagimEtkinliklerEkle(
          userModel.user.userID, eventName);
      if (sonuc == true || sonuc == null) {
        PlatformDuyarliAlertDialog(
          baslik: "Katılacağım Etkinlikler Listesi Güncellendi",
          icerik: "Katılacağım Etkinlikler Listesi başarıyla güncellendi",
          anaButonYazisi: "Tamam",
        ).goster(context);
      } else {
        PlatformDuyarliAlertDialog(
          baslik: "Katılacağım Etkinlikler Listesi Güncellenemedi 😕",
          icerik:
              "Katılacağım Etkinlikler Listesi güncellenirken bir sorun oluştu.\n" +
                  "İnternet bağlantınızı kontrol edin.",
          anaButonYazisi: "Tamam",
        ).goster(context);
      }
    } on PlatformException catch (e) {
      PlatformDuyarliAlertDialog(
        baslik: "Katılacağım Etkinlikler Listesi Güncelleme HATA",
        icerik: Exceptions.goster(e.code),
        anaButonYazisi: "Tamam",
      ).goster(context);
    }
  }
}
