import 'package:flutter_application_todo/model/todo.dart';
import 'package:flutter_application_todo/screens/Login.dart';
import 'package:flutter_application_todo/screens/add.dart';
import 'package:flutter_application_todo/screens/edit.dart';
import 'package:flutter_application_todo/screens/home.dart';
import 'package:flutter_application_todo/screens/sign_up.dart';
import 'package:flutter_application_todo/screens/welcome.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
    initialLocation: '/welcome',
    routes: [
      GoRoute(
        path: '/welcome',
        builder: (context,state) => Welcome(),
      ),

      GoRoute(
          path: '/login',
          builder: (context,state) => Login(),
      ),
      GoRoute(
        path: '/signup',
        builder: (context,state) => Signup(),
      ),
      GoRoute(
        path: '/home',
        builder: (context,state) => Home(),
      ),
      GoRoute(
        path: '/add',
        builder: (context,state) => Add(),
      ),
      GoRoute(
        path:'/edit',
        builder: (context,state) {
          final todo = state.extra as Todo;
          return Edit(todo: todo);
        }
      )

  ],
);


