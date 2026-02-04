import 'package:flutter/cupertino.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage {
  final FlutterSecureStorage storage = const FlutterSecureStorage();

  Future<void> writeSecurData(String key,String value) async{
    await storage.write(key: key, value: value);
    debugPrint('[SecureStorage] write key=$key value = $value');
  }

  // Future<String?> readSecurData(String key ) async {
  //   String value = await storage.read(key: key) ?? "No data found";
  //   return value;
  // }

  Future<Map<String,String>> readSecur(String key ) async {
    String value = await storage.read(key: key) ?? "0";
    debugPrint('[SecureStorage] readSecurKey key=$key value = $value');


    return {'key' : key ,
            'value': value};  //เป็นการ return กลับเเบบ Map<String, String>

  }


  // Future<String> readSecurValue(String key ) async {
  //   String value = await storage.read(key: key) ?? "0";
  //   debugPrint('[SecureStorage] SecurValue key=$key value = $value');
  //
  //   return value;
  // }
}
