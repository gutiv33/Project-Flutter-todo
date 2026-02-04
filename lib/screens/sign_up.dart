import 'package:flutter/material.dart';
import 'package:flutter_application_todo/model/user_manager.dart';
import 'package:go_router/go_router.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {

  late TextEditingController userController = TextEditingController();
  late TextEditingController passController = TextEditingController();
  var manager = UserManager();
  String text = "";

  // late List<UserData> userList = [];
  // String? selectGender ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 197, 170, 236) ,
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 157, 87, 232),
        elevation: 3,
        title: Text(
            "SignUp",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w800,
            fontFamily: 'Caveat'
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                'กรอกข้อมูล',
                 style: TextStyle(
                   color:Colors.black,
                   fontWeight: FontWeight.w600,
                   fontSize: 15
                 ),
              ),
              // SizedBox(height: 8),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: 'name',
              //     filled: true,
              //     fillColor: Colors.white,
              //     border: OutlineInputBorder(
              //       borderRadius: BorderRadius.circular(12),
              //       borderSide: BorderSide.none
              //     )
              //   ),
              // ),
      //         SizedBox(height: 8),
      //         DropdownButtonFormField<String>(
      //            initialValue: selectGender,
      //           decoration: InputDecoration(
      //             filled: true,
      //             fillColor: Colors.white,
      //             border: OutlineInputBorder(
      //               borderRadius: BorderRadius.circular(12),
      //               borderSide: BorderSide.none
      //             )
      //           ),
      //           hint: Text('เลือกเพศ'),
      //           items:[
      //             DropdownMenuItem(
      //               value: 'Girl',
      //               child: Text('Girl'),
      //             ),
      //             DropdownMenuItem(
      //                 value: 'Boy',
      //                 child: Text('Boy')
      //             )
      //           ],
      //             onChanged:(value) {
      //             setState(() {
      //               selectGender = value;
      //             });
      // }
      //         ),
              SizedBox(height: 10),
              TextField(
                controller: userController,
                decoration: InputDecoration(
                    hintText: 'UserName',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none
                    )
                ),
              ),
              SizedBox(height: 10),
              TextField(
                controller: passController,
                decoration: InputDecoration(
                    hintText: 'Password',
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12),
                        borderSide: BorderSide.none
                    )
                ),
              ),
              SizedBox(height: 30),

              ElevatedButton(
                onPressed: ()async {
                  final result = await manager.addNewUser(userController.text, passController.text) ; // เปลี่ยนค่าเป็น str เพื่อที่จะใช้งานฟังก์ชัน checkUser ได้
                  setState(()  {
                    text = result;

                  });

                  if (text == "Create the correct user") {
                    context.go('/welcome');
                    // Navigator.pop(context,Welcome());
                  }

                },
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent[200],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                    )

                ),

                child: Text(
                  "ลงทะเบียนเรียบร้อย",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white
                  ),
                ),

              ),
              SizedBox(height: 10,),
              const Text('ข้อความเเจ้งเตือน'),
              Text(
                text,
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  color:text == "Create the correct user"?Colors.teal[700]:Colors.redAccent[200],
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
      ),
    );
  }
}
