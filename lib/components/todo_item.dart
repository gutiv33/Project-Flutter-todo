import 'package:flutter/material.dart';
import '../model/todo.dart';


class TodoItem extends StatelessWidget {
  final Todo todo;
  final onToDoChanged;
  final onDeleteItem;
  final Function(Todo) onEditItem;


  const TodoItem({
    Key? key,
    required this.todo,
    required this.onDeleteItem,
    required this.onToDoChanged,
    required this.onEditItem
  }):super(key: key);

  @override
  Widget build(BuildContext context) { // Error ที่เกิดถ้าไม่เขียน Missing concrete implementation of 'abstract class StatelessWidget extends Widget.build'.
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap:() {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20)
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20 ,vertical: 15),
        tileColor: Color.fromARGB(233, 234, 200, 241),
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank_sharp,
          color: Color.fromARGB(255, 244, 76, 120), //ช่องสี่เหลี่ยม
        ),
        title: Text(
          '${todo.toDoText}  \n Due Date: ${todo.dueDate.day}/${todo.dueDate.month}/${todo.dueDate.year}',
          style: TextStyle(
            fontSize: 16,
            color: Colors.white, // สีตัวอักษร
            fontWeight: FontWeight.bold,
            decoration:todo.isDone ? TextDecoration.lineThrough:null
          ),
        ),

        trailing:  Row(//Container(
          // margin: EdgeInsets.symmetric(vertical: 12),
          // height: 35,
          // width: 35,
          // decoration: BoxDecoration(
          //   color: Colors.cyan[50], //สีกล่องที่มี icon อยู่ภายใน
          //   borderRadius: BorderRadiusGeometry.circular(5)
          // ),
          mainAxisSize: MainAxisSize.min,
          children: [
              icon(),
              SizedBox(width: 5),
              iconbox()
          ]
        ),
      ),
    );
  }
  Widget icon() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: Colors.cyan[50], //สีกล่องที่มี icon อยู่ภายใน
          borderRadius: BorderRadiusGeometry.circular(5)
      ),
      child:
      IconButton(
        onPressed: (){
          onDeleteItem(todo.id);
        },
        color: Colors.redAccent[100],
        iconSize: 18,
        icon: Icon(Icons.delete),

      ),
    );
  }

  Widget iconbox() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 12),
      height: 35,
      width: 35,
      decoration: BoxDecoration(
          color: Colors.cyan[50], //สีกล่องที่มี icon อยู่ภายใน
          borderRadius: BorderRadiusGeometry.circular(5)
      ),
      child:
      IconButton(
        onPressed: () {
          onEditItem(todo); // 👈 เรียกฟังก์ชันจาก Home
        },
        icon: Icon(Icons.edit),
        iconSize: 18,
        color: Colors.orange[200],
      ),
    );
  }
}
