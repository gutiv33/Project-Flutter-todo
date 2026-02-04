import 'package:flutter/cupertino.dart';
import 'package:flutter_application_todo/model/secure_storage.dart';

class UserManager {
  // late List<UserData> userList = [];
  var storage =  SecureStorage();
  
  Future<String> addNewUser(String userName ,String password) async{

    // var check = userList.any((user) =>
    //     user.userName == userData.userName);

    var check = await storage.readSecur(userName);
    String message = " ";

    if (userName.isNotEmpty && password.isNotEmpty) {
      if (check['value'] == "0") {
        // userList.add(userData);
        await storage.writeSecurData(userName, password);
        message = "Create the correct user";
      } else {
        message = "Create the uncorrect user";
      }
    } else {
      message = "กรอกข้อมูลให้ครบถ้วน";
    }
    return message;
  }
  
  // String checkUser(String userName,String password) {
  //   var check = userList.any((user) =>
  //       user.userName == userName &&
  //       user.password == password
  //   );
  //
  //   if (check) {
  //     return "correct" ;
  //
  //   } else {
  //     return "uncorrect";
  //   }
  // }

  Future<String> checkUser(String userName , String password) async {
    final data = await storage.readSecur(userName); //ที่มันไม่เข้าเงื่อนไข เพราะว่า final key = storage.readSecurKey(userName); - key-> ตรงนี้มี type  Future<String>
    // final value = await storage.readSecurValue(userName);
    var massage = "";

    debugPrint('parameter username : $userName   parameter password : $password');
    // if (username.isEmpty && password.isEmpty) {
    //   massage = "ไม่มีการกรอกข้อมูล";
    // }

    switch (userName.isNotEmpty && password.isNotEmpty) {
      case true :
        if (data['value'] != "0") {
          // debugPrint('เข้าเงื่อนไข key == username');
          debugPrint('เข้าเงื่อนไข key == username -ค่า key : ${data['key']} ,ค่า username :$userName');

          if (data['value'] == password) {
            massage = "เข้าสู่ระบบเรียบร้อย";
            debugPrint('เข้าเงื่อนไข key == username - ค่า username :$userName ค่า message :$massage');
            break;
          }
          else {
            massage = "กรอก Password ผิดพลาด";
            debugPrint('เข้าเงื่อนไข key == username เเต่ password ผิด - ค่า username :$userName ค่า message :$massage');
            break;
          }
        } else {
          debugPrint('เข้าเงื่อนไข key != username');
          massage = "กรอก UserName ผิดพลาด";
          debugPrint('เข้าเงื่อนไข key != username  - ค่า username :$userName ค่า message :$massage');
          break;
        }

      case false :
        massage = "ไม่มีการกรอกข้อมูล";
        debugPrint('ค่า message :$massage');
        break;

    // default:
    //   massage = "ไม่มีการกรอกข้อมูล";
    //   break;
    }
    return massage;
  }
}
