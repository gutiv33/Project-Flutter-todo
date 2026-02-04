import 'package:flutter/material.dart';
import 'package:flutter_application_todo/model/user_manager.dart';
import 'package:go_router/go_router.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  // late List<Userdata> userList = [];
  late TextEditingController userController = TextEditingController();
  late TextEditingController passController = TextEditingController();
  var manager = UserManager();
  String text = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 235, 213, 140),
      appBar: _build(),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'กรอก userName และ Password',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                  hint: Icon(
                      Icons.supervised_user_circle),
                      // hintText: 'Username', ไม่สามารถใส่ hint,hintText ซ้อนกันใน InputDecoration ได้
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passController,
                decoration: InputDecoration(
                  hint: Icon(
                      Icons.password),
                  // hintText: "Password", -> ไม่สามารถใส่ hint,hintText ซ้อนกันใน InputDecoration ได้
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                  )
                ),
              ),
              SizedBox(
                // width: double.infinity,
                height:30
              ),

              ElevatedButton(

                  onPressed: () async{
                    final result = await manager.checkUser(userController.text, passController.text);
                    setState(() {
                      text = result;

                    });
                    // debugPrint('text = $text');
                    if (text == "เข้าสู่ระบบเรียบร้อย") {
                      context.go('/home');
                      // Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
                    }
                  },

                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromARGB(255, 162, 213, 248),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)
                      )
                  ),
                  child: Text(
                    'ลงชื่อเข้าใช้',
                    style: TextStyle(fontSize: 16),
                  )),
              SizedBox(height: 10,),
              const Text('ข้อความการเเจ้งเตือน'),
              Text(
                text,

                  // debugPrint('text = $text');
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color:text == "เข้าสู่ระบบเรียบร้อย"?Colors.teal[700]:Colors.redAccent[200],
                  fontWeight: FontWeight.bold
                ),
              )
            ],
          ),
      )
    );
  }
}

AppBar _build(){
  return AppBar(
    backgroundColor: Colors.deepOrangeAccent[200],
    elevation: 3, //เป็น เงา (shadow) เพื่อให้ดูเหมือนลอยอยู่เหนือพื้นหลัง (แนว Material Design)

    title: Text(
        'LOGIN',
      style: TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontFamily: "Caveat",
        fontSize: 25
      ),
    ),
  );
}