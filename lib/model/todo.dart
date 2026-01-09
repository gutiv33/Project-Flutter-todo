import 'package:hive/hive.dart';

// ต้องมีการ build file ขึ้นมาก่อน flutter pub run build_runner build เเต่ถ้าเคยพังมาก่อน ใช้:
// flutter pub run build_runner build --delete-conflicting-outputs

part 'todo.g.dart'; //เป็นไฟล์ที่เเปลงข้อมูลที่จะไปเก็บใน data base ในตัวเครื่อง (todo -> hive)

@HiveType(typeId: 0)
class Todo {

  // late String id ; กำหนดค่าในภายหลัง
  @HiveField(0) //เป็นการกำหนดตำแหน่งของข้อมูลตัวนั้น -> เพื่อให้ง่ายต่อการเก็บเเละอ่าน
  final String id;

  @HiveField(1)
  String toDoText = " ";

  @HiveField(2)
  bool isDone ;

  @HiveField(3)
  DateTime dueDate ;
  /* List<String> toDoList = [];*/
  // Array<Todo> toDoList = []; -> ไม่มีการเขียนแบบนี้

  Todo({                            //constructor

    required this.id , //ต้องกำหนดค่าทันที
    required this.toDoText ,
    this.isDone = false,
    required this.dueDate

  });

  

}