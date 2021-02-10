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

  UserC(
      {@required this.userID,
      @required this.email,
      this.userName,
      this.lastName,
      this.superUser,
      this.katildigimEtkinlikler,
      this.katilacagimEtkinlikler});

  Map<String, dynamic> toMap() {
    return {
      'Ad': userName,
      "Soyad": lastName,
      'E-mail': email,
      'Katıldığım Etkinlikler': katildigimEtkinlikler,
      'Katılacağım Etkinlikler': katilacagimEtkinlikler,
      'SuperUser': superUser,
      "UserID": userID
    };
  }

  UserC.userfromMap(Map<String, dynamic> map)
      : userID = map['UserID'],
        email = map['E-mail'],
        userName = map['Ad'],
        lastName = map["Soyad"],
        superUser = map["SuperUser"],
        katildigimEtkinlikler = map["katildigimEtkinlikler"],
        katilacagimEtkinlikler = map["katilacagimEtkinlikler"];
  //profilURL = map['profilURL'],

  UserC.idveResim({@required this.userID, @required this.profilURL});

  @override
  String toString() {
    return 'User{userID: $userID, email: $email, userName: $userName, lastname: $lastName, superUser: $superUser}';
  }
}
