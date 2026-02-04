import "package:flutter_application_todo/model/secure_storage.dart";
import "package:flutter_application_todo/model/user_data.dart";
import "package:flutter_application_todo/model/user_manager.dart";

class UserViewModel {

  var manager = UserManager() ;

  var storage = SecureStorage();

  addUser(String UserName ,String password) {
    manager.addNewUser(UserName ,password);
    // i
    // storage.writeSecurData(userData.userName, userData);
  }
}

// String result = manager.addNewUser(userData);
//
// if (result == 'success') {
// await storage.writeSecureData(
// userData.userName,
// userData.toJsonString(),
// );
// }