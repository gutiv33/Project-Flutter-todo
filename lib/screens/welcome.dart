import 'package:flutter/material.dart';
import 'package:flutter_application_todo/screens/sign_up.dart';
import 'package:go_router/go_router.dart';
import 'Login.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 107, 229, 178) ,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
                'Welcome',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                fontFamily: 'Caveat'
              ),
            ),
            ElevatedButton.icon(
                onPressed: () {
                  context.go('/login');
                  // Navigator.push(context,MaterialPageRoute(builder:(context) => Login()));
                },
                icon: Icon(
                    Icons.login,
                    size: 40,
                ),
                label: Text(
                  'LOGIN',
                   style: TextStyle(
                     fontSize: 20
                   ),
                ),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
                onPressed: () {
                  context.go('/signup');
                  // Navigator.push(context, MaterialPageRoute(builder:(context) => Signup()));
                },
                icon:Icon(
                  Icons.assignment_ind,
                  size: 40
                ),
                label: Text(
                  'SIGN IN',
                  style: TextStyle(
                    fontSize: 20
                  ),
                ),
            )
          ],
        ),
      ),
    );
  }
}
