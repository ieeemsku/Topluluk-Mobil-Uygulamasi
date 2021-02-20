import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';

class Event {
  final String title, location, imageURL;
  final List categoryIds, participants;
  final Map<String, dynamic> documentsMap;

  @override
  String toString() {
    return "title: $title \n" +
        "location: $location \n" +
        "categoryIds: $categoryIds \n" +
        "documentsList: $documentsMap \n" +
        "imageURL: $imageURL \n" +
        "participants: $participants";
  }

  Event(
      {@required this.title,
      @required this.location,
      @required this.categoryIds,
      @required this.imageURL,
      @required this.documentsMap,
      @required this.participants});
}

final List<Event> events = [];
final List<int> komitelerList = [];

final FirebaseFirestore _firestore = FirebaseFirestore.instance;

String ad, konum, url;
List categoryList, katilimcilar;
Map<String, dynamic> docMap;

int cs = 0, com = 0, pes = 0, ras = 0, ea = 0, wie = 0;

Future<void> read() async {
  events.clear();

  QuerySnapshot querySnapshot =
      await _firestore.collection("Etkinlikler").get();

  List<DocumentSnapshot> documentSnapshotList = querySnapshot.docs;

  documentSnapshotList.forEach((documentSnapshot) {
    try {
      Map<String, dynamic> data = documentSnapshot.data();
      ad = data["Etkinlik Adı"];
      konum = data["Etkinlik Konumu"];
      url = data["Etkinlik Photo Url"];
      categoryList = data["category"];
      docMap = data["Dosyalar"];
      katilimcilar = data["Katilimcilar"];

      Event event = new Event(
          title: ad,
          location: konum,
          categoryIds: categoryList,
          imageURL: url,
          documentsMap: docMap,
          participants: katilimcilar);
      events.add(event);

      switch (categoryList[1]) {
        case 1:
          cs++;
          break;
        case 2:
          com++;
          break;
        case 3:
          pes++;
          break;
        case 4:
          ras++;
          break;
        case 5:
          ea++;
          break;
        case 6:
          wie++;
          break;
      }
    } catch (e) {
      debugPrint("Hata: $e");
    }
  });
  komitelerList.add(events.length);
  komitelerList.add(cs);
  komitelerList.add(com);
  komitelerList.add(pes);
  komitelerList.add(ras);
  komitelerList.add(ea);
  komitelerList.add(wie);
}
