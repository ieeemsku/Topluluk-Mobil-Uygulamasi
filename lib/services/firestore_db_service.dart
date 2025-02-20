import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stuventmobil/model/userC.dart';
import 'package:stuventmobil/services/database_base.dart';

class FirestoreDBService implements DBBase {
  final FirebaseFirestore _firebaseDB = FirebaseFirestore.instance;

  @override
  Future<UserC> readUser(String userID) async {
    DocumentSnapshot _okunanUser =
        await _firebaseDB.collection("Users").doc(userID).get();
    Map<String, dynamic> _okunanUserBilgileriMap = _okunanUser.data();

    UserC _okunanUserNesnesi = UserC.userfromMap(_okunanUserBilgileriMap);

    return _okunanUserNesnesi;
  }

  @override
  Future<bool> update(String collection, String documentName, String alan,
      dynamic newData) async {
    try {
      await _firebaseDB
          .collection(collection)
          .doc(documentName)
          .update({alan: newData}).catchError((onError) {
        print("db_service update hata: " + onError.toString());
        return false;
      });
      return true;
    } catch (e) {
      print("db_service update catch hata: " + e.toString());
      return false;
    }
  }

  @override
  Future<bool> setData(
      String collection, String document, Map<String, dynamic> map) async {
    await _firebaseDB
        .collection(collection)
        .doc(document)
        .set(map)
        .catchError((onError) {
      print("db setData hata: " + onError.toString());
      return false;
    });
    return true;
  }

  @override
  Future<bool> eventDel(String document) async {
    await _firebaseDB
        .collection("Etkinlikler")
        .doc(document)
        .delete()
        .catchError((onError) {
      print("db setData hata: " + onError.toString());
      return false;
    });
    return true;
  }

  @override
  Future<List<String>> getEtkinlikler() async {
    QuerySnapshot querySnapshot =
        await _firebaseDB.collection("Etkinlikler").get();

    List<DocumentSnapshot> documentSnapshotList = querySnapshot.docs;

    List<String> etkinlikler = [];
    documentSnapshotList.forEach((documentSnapshot) {
      Map<String, dynamic> data = documentSnapshot.data();
      etkinlikler.add(data["Etkinlik Adı"]);
    });

    return etkinlikler;
  }

  @override
  Future<List<dynamic>> readParticipants(String eventName) async {
    DocumentSnapshot docSnapshot =
        await _firebaseDB.collection("Etkinlikler").doc(eventName).get();

    Map<String, dynamic> data = docSnapshot.data();
    List<dynamic> participants = data["Katilimcilar"];

    return participants;
  }

  @override
  Future<List<dynamic>> readEvents(String userId) async {
    DocumentSnapshot docSnapshot =
        await _firebaseDB.collection("Users").doc(userId).get();

    Map<String, dynamic> data = docSnapshot.data();
    List<dynamic> myEvents = data["katildigimEtkinlikler"];

    return myEvents;
  }

  @override
  Future<List<dynamic>> readWillEvents(String userId) async {
    DocumentSnapshot documentSnapshot =
        await _firebaseDB.collection("Users").doc(userId).get();

    Map<String, dynamic> data = documentSnapshot.data();
    List<dynamic> katilacagimEtkinlikler = data["katilacagimEtkinlikler"];

    return katilacagimEtkinlikler;
  }

  @override
  Future<bool> yoklamaAl(String userName, String userID, String eventName) {
    DocumentReference eventRef = _firebaseDB.doc("Users/$userID");

    List katildigimEtkinlikler, katilacagimEtkinlikler;
    _firebaseDB.runTransaction((Transaction transaction) async {
      DocumentSnapshot eventData = await eventRef.get();
      Map<String, dynamic> data = eventData.data();
      katildigimEtkinlikler = data["katildigimEtkinlikler"];
      katilacagimEtkinlikler = data["katilacagimEtkinlikler"];
      if (!katildigimEtkinlikler.contains(eventName)) {
        katildigimEtkinlikler.add(eventName);
        transaction
            .update(eventRef, {"katildigimEtkinlikler": katildigimEtkinlikler});
      }
      if (katilacagimEtkinlikler.contains(eventName)) {
        katilacagimEtkinlikler.remove(eventName);
        transaction.update(
            eventRef, {"katilacagimEtkinlikler": katilacagimEtkinlikler});
      }
    });

    DocumentReference eventRef1 = _firebaseDB.doc("Etkinlikler/$eventName");

    List katilimcilar;
    _firebaseDB.runTransaction((Transaction transaction) async {
      DocumentSnapshot eventRefData = await eventRef1.get();
      Map<String, dynamic> data = eventRefData.data();
      katilimcilar = data["Katilimcilar"];
      if (!katilimcilar.contains(userName)) {
        katilimcilar.add(userName);
        transaction.update(eventRef1, {"Katilimcilar": katilimcilar});
      }
    });

    return Future.value(true);
  }

  @override
  Future<bool> katilacagimEtkinliklerEkle(String userID, String eventName) {
    DocumentReference documentReference = _firebaseDB.doc("Users/$userID");

    List katilacagimEtkinlikler;
    _firebaseDB.runTransaction((Transaction transaction) async {
      DocumentSnapshot documentSnapshot = await documentReference.get();
      Map<String, dynamic> data = documentSnapshot.data();
      katilacagimEtkinlikler = data["katilacagimEtkinlikler"];
      if (!katilacagimEtkinlikler.contains(eventName)) {
        katilacagimEtkinlikler.add(eventName);
        transaction.update(documentReference,
            {"katilacagimEtkinlikler": katilacagimEtkinlikler});
      }
    });
    return Future.value(true);
  }

  @override
  Future<bool> setProfil(String userID, String secilenBolum, String ilgiAlani,
      String hobi, String komite) {
    DocumentReference documentReference = _firebaseDB.doc("Users/$userID");

    _firebaseDB.runTransaction((Transaction transaction) async {
      transaction.update(documentReference, {
        "Bölüm": secilenBolum,
        "Hobi": hobi,
        "Komite": komite,
        "İlgiAlani": ilgiAlani
      });
    });
    return Future.value(true);
  }

  @override
  Future<List<String>> readFiles(String anaKlasor, String etkinlikAdi) async {
    DocumentSnapshot _okunanEtkinlik =
        await _firebaseDB.collection(anaKlasor).doc(etkinlikAdi).get();
    Map<String, dynamic> _okunanEtkinlikMap = _okunanEtkinlik.data();
    Map<String, dynamic> _dosyalarMap = _okunanEtkinlikMap["Dosyalar"];
    List<String> files = [];
    _dosyalarMap.forEach((key, value) {
      files.add(key);
    });
    return files;
  }
}
