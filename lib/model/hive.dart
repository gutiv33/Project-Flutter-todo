import 'package:hive/hive.dart';
import 'package:flutter_application_todo/model/todo.dart';

class TodoRepository {
  final Box<Todo> todoBox = Hive.box<Todo>('todos');

  //Get all todos
  List<Todo> getTodos() {
    return todoBox.values.toList();
  }

  //Add todo
  Future<void> addTodo(Todo todo) async {
    await todoBox.put(todo.id, todo);
  }

  //Update todo
  Future<void> updateTodo(Todo todo) async {
    await todoBox.put(todo.id,todo);
  }

  //Delete todo
  Future<void> deleteTodo(String id) async {
    await todoBox.delete(id);
  }
}