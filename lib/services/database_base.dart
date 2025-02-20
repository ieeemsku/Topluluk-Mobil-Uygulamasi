import 'package:stuventmobil/model/userC.dart';

abstract class DBBase {
  Future<bool> setData(
      String collection, String document, Map<String, dynamic> map);
  Future<UserC> readUser(String userID);
  Future<bool> eventDel(String document);
  Future<bool> update(
      String collection, String documentName, String alan, dynamic newData);
  Future<List<String>> getEtkinlikler();
  Future<bool> yoklamaAl(String userName, String userID, String eventName);
  Future<bool> katilacagimEtkinliklerEkle(String userID, String eventName);
  Future<List<String>> readFiles(String anaKlasor, String etkinlikAdi);
  Future<List<dynamic>> readParticipants(String eventName);
  Future<List<dynamic>> readEvents(String userID);
  Future<List<dynamic>> readWillEvents(String userId);
  Future<bool> setProfil(String userID, String secilenBolum, String ilgiAlani,
      String hobi, String komite);
}
