import 'package:flutter/material.dart';

class UserC {
  String userID;
  String email;
  String userName;
  String lastName;
  String profilURL;
  bool superUser = false;
  List<dynamic> katildigimEtkinlikler;
  List<dynamic> katilacagimEtkinlikler;
  String bolum;
  String ilgiAlani;
  String hobi;
  String komite;

  UserC(
      {@required this.userID,
      @required this.email,
      this.userName,
      this.lastName,
      this.superUser,
      this.katildigimEtkinlikler,
      this.katilacagimEtkinlikler,
      this.bolum,
      this.ilgiAlani,
      this.hobi,
      this.komite});

  Map<String, dynamic> toMap() {
    return {
      'Ad': userName,
      "Soyad": lastName,
      'E-mail': email,
      'katildigimEtkinlikler': katildigimEtkinlikler,
      'katilacagimEtkinlikler': katilacagimEtkinlikler,
      'SuperUser': superUser,
      "UserID": userID,
      "Bölüm": bolum != null ? bolum : "-",
      "İlgiAlani": ilgiAlani != null ? ilgiAlani : "-",
      "Hobi": hobi != null ? hobi : "-",
      "Komite": komite != null ? komite : "-",
    };
  }

  UserC.userfromMap(Map<String, dynamic> map)
      : userID = map['UserID'],
        email = map['E-mail'],
        userName = map['Ad'],
        lastName = map["Soyad"],
        superUser = map["SuperUser"],
        katildigimEtkinlikler = map["katildigimEtkinlikler"],
        katilacagimEtkinlikler = map["katilacagimEtkinlikler"],
        bolum = map["Bölüm"],
        ilgiAlani = map["İlgiAlani"],
        hobi = map["Hobi"],
        komite = map["Komite"];
  //profilURL = map['profilURL'],

  UserC.idveResim({@required this.userID, @required this.profilURL});

  @override
  String toString() {
    return 'User{userID: $userID, email: $email, userName: $userName, lastname: $lastName, superUser: $superUser}';
  }
}
