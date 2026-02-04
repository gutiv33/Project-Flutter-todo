import 'package:flutter/material.dart';
import 'package:flutter_application_todo/model/todo_local_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../model/todo.dart';


class Add extends StatefulWidget {
  final Todo? todo;

  const Add({Key? key, this.todo}) : super(key: key);

  @override
  State<Add> createState() => _AddState();
}

class _AddState extends State<Add> {
  late TextEditingController _textController;
  late DateTime _selectedDate;
  final storage = Todolocalstorage();
  // bool get isEdit => widget.todo != null;

  @override
  void initState() {
    super.initState();
    _textController =
        TextEditingController(text: widget.todo?.toDoText );
    _selectedDate = widget.todo?.dueDate ?? DateTime.now();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  Future<void> _pickDate() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime(2025),
      lastDate: DateTime(2030),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveTodo() {
    if (_textController.text.trim().isEmpty) return; // เช็คการมีอยู่ว่ามีการกรอกเข้ามาหรือยัง

    final newTodo = Todo(
      id: widget.todo?.id ??
          DateTime.now().millisecondsSinceEpoch.toString(),
      toDoText: _textController.text,
      dueDate: _selectedDate,
      isDone: widget.todo?.isDone ?? false,
    );

    context.pop(newTodo); // เป็นการออกจากหน้านี้เเล้วส่งค่ากลับไปที่หน้า Home()
     // Navigator.pop(context,newTodo );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F7FB),
      appBar: AppBar(
        title: Text('Add Page'), //(isEdit ? 'แก้ไขรายการ' : 'เพิ่มรายการ'),
        backgroundColor: Colors.blue[300],
        actions: [
          IconButton(
            icon: const Icon(Icons.check),
            onPressed: _saveTodo,
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'สิ่งที่ต้องทำ',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _textController,
              decoration: InputDecoration(
                hintText: 'พิมพ์รายการที่ต้องทำ',
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
              ),
            ),

            const SizedBox(height: 20),

            /// Date picker
            const Text(
              'วันที่',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            InkWell(
              onTap: _pickDate,
              child: Container(
                padding:
                const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('dd / MM / yyyy').format(_selectedDate),
                    ),
                    const Icon(Icons.calendar_today),
                  ],
                ),
              ),
            ),

            const Spacer(),

            /// Save button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                onPressed: _saveTodo,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green[400],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: Text(
                  'เพิ่มรายการ',
                  // isEdit ? 'บันทึกการแก้ไข' : 'เพิ่มรายการ',
                  style: const TextStyle(fontSize: 16),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
