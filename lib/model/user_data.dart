class UserData {
  // String name = "";
  // String gender = "";
  String userName = "";
  String password = "";

  UserData({ //ต้องมีการประกาศเป็นชื่อของฟังก์ชัน ถ้าต้องการจะสร้าง constructor
    // required this.name,
    // required this.gender,
    required this.userName ,
    required this.password
});

  // /// แปลง object → Map
  // Map<String, dynamic> toJson() => {
  //   'name': name,
  //   'gender': gender,
  //   'userName': userName,
  //   'password': password,
  // };
  //
  // /// แปลง Map → object
  // factory UserData.fromJson(Map<String, dynamic> json) {
  //   return UserData(
  //     name: json['name'],
  //     gender: json['gender'],
  //     userName: json['userName'],
  //     password: json['password'],
  //   );
  // }
  //
  // /// แปลง object → String (JSON)
  // String toJsonString() => jsonEncode(toJson());
  //
  // /// แปลง String (JSON) → object
  // factory UserData.fromJsonString(String jsonString) {
  //   return UserData.fromJson(jsonDecode(jsonString));
  // }
}