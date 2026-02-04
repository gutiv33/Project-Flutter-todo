import 'dart:convert';
import 'package:flutter_application_todo/model/todo.dart';
import 'package:flutter_application_todo/model/todoStorage.dart';
import 'package:shared_preferences/shared_preferences.dart';


const Todo_Key = "List_Todo";

class Todolocalstorage implements Todostorage{

  @override
  Future<void> saveTodo(List<Todo> todoList) async{
    final prefs = await SharedPreferences.getInstance();

    final data = todoList.map((i) => {
      'id': i.id,
      'toDoText': i.toDoText,
      'dueDate': i.dueDate.toIso8601String(),// แปลง DateTime -> String
      'isDone': i.isDone,
    }).toList();

    await prefs.setString(Todo_Key, jsonEncode(data));
 }

  @override
  Future<List<Todo>> loadTodo() async {
    final prefs = await SharedPreferences.getInstance();
    final raw = prefs.getString(Todo_Key);

    if (raw == null) return [];

    final List<dynamic> parsed = jsonDecode(raw);
    final List<Todo> todoList = parsed.map((item) => Todo(
        id: item['id'],
        toDoText: item['toDoText'],
        dueDate: DateTime.parse(item['dueDate']),// แปลง String -> DateTime
        isDone: item['isDone']
    )).toList();

    return todoList;
  }
}

//เพิ่มเติม
//toIso8601String() -> เมธอด (method) ในภาษาโปรแกรม (เช่น Dart/Flutter) สำหรับแปลงค่าวันที่และเวลา (DateTime) ให้อยู่ในรูปแบบข้อความตามมาตรฐานสากล ISO 8601
// ซึ่งเป็นรูปแบบที่นิยมใช้ในการส่งข้อมูลระหว่างระบบคอมพิวเตอร์ เพื่อให้มีความแม่นยำและเข้าใจตรงกัน โดยจะแสดงผลในรูปแบบ เช่น YYYY-MM-DDTHH:mm:ss.sssZ หรือ 2026-01-13T10:30:00.123Z (ตัว Z หมายถึง UTC).