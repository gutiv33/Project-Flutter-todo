import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'Navigation/nav.dart';


void main() async {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}):super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: Colors.tealAccent)
    );
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'App Todo',
      routerConfig: appRouter, // ⭐ สำคัญที่สุด (เป็นการบอกเส้นทางภายในเเอป)
    );
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: 'App Todo',
    //   // home: context.go('/welcome') -> ใช้แบบนี้ไม่ได้ เพราะ home: (ต้องการ widget เเต่ context.go('welcome') ไม่ใช่ widget)
    //   // home: Welcome(),
    // );
  }
}


