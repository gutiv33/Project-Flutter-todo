import 'package:flutter_application_todo/model/todo.dart';

abstract class Todostorage {
  Future<void> saveTodo(List<Todo> todoList);
  Future<List<Todo>>loadTodo();
}