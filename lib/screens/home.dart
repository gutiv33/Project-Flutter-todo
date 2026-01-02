import 'package:flutter/material.dart';
import '../model/todo.dart';
import '../components/todo_item.dart';
import '../screens/edit.dart';
import '../screens/add.dart';

class Home extends StatefulWidget {

  Home({Key? key}) :super(key: key);

  @override
  State<Home> createState() => _HomeState(); 
   
}

class _HomeState extends State<Home> {

  // final todoList :Todo;
  late List<Todo> todoList = [];
  final _todoController = TextEditingController();

  // @override
  // void initState() {
  //   _foundTodo = todoList;
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Color.fromARGB(255, 196, 224, 244),  // พื้นหลัง
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: EdgeInsets.symmetric(
              horizontal:20,
              vertical:15,
            ),
            child: Column(
              children: [
                searchBox(),
                Expanded(
                  child:ListView(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            top: 60,
                            bottom: 30,
                          ),
                          child: Text(
                            "All To Do",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        for (Todo todoo in todoList)
                          TodoItem(
                            todo: todoo,
                            onToDoChanged: _handleToDoChange,
                            onDeleteItem: _deleteTodoItem,
                            onEditItem: _goToEditPage
                        )
                      ],
                  )
                )
              ],
            ),
          ),
          Align(
            // alignment: Alignment.bottomCenter,
            alignment: Alignment.bottomRight,
            child:Row(children: [
              // Expanded(child:Container(
              //   margin: EdgeInsets.only(
              //     bottom: 20,
              //     right: 20,
              //     left:20,
              //   ),
              //   padding: EdgeInsets.symmetric(
              //     horizontal: 20,
              //     vertical: 5
              //   ),
                // decoration: BoxDecoration(
                //   color: Colors.white, // กล่องเพิ่มข้อความ
                //   boxShadow: const [
                //     BoxShadow(
                //       color: Colors.blueGrey, //สีของเงา
                //       offset: Offset(0, 0),
                //       blurRadius: 10,
                //       spreadRadius: 0,
                //
                //     ),
                //   ],
                //   borderRadius: BorderRadius.circular(10)
                // ),
                // child: TextField(
                //   controller: _todoController,
                //   decoration: InputDecoration(
                //     hintText: 'Add item to do',
                //     border: InputBorder.none
                //   ),
                // ),
            //   ),
            // ),
            Container(
              margin: EdgeInsets.only(
                bottom: 20,
                right: 20,
              ),
              child: ElevatedButton(
                child: Text(
                    '+',
                    style: TextStyle(
                    fontSize:40,
                )),
                onPressed:() {
                  _goToAddPage();
                    // _addToDoItem(_todoController.text);
                },
                style: ElevatedButton.styleFrom(
                    backgroundColor:Color.fromARGB(255, 175, 238, 120), //สีของปุ่ม +
                    minimumSize: Size(60, 60),
                    elevation: 10
                )
              ),
            ),
          ],
        ),
      ),
     ]),
    );
  }
  void _handleToDoChange(Todo todo) {
    setState((){
      todo.isDone = !todo.isDone;
    });
  }

  void _deleteTodoItem(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  // void _addToDoItem(String text) {
  //   setState(() {
  //     todoList.add(Todo(
  //       id:DateTime.now().millisecondsSinceEpoch.toString(),
  //       toDoText: text ,
  //       isDone: false,
  //       dueDate: DateTime.now(),
  //     ));
  //   });
  //   // _todoController.clear();
  // }

  void _runFilter(String enteredKeyword) {
    List<Todo> results = [];
    if (enteredKeyword.isNotEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) => item.toDoText
          .toLowerCase()
          .contains(enteredKeyword.toLowerCase()))
          .toList();
    }
    setState(() {
      todoList = results;
    });
  }

  void _editToDo(Todo todo) {
  setState(() {

    final index = todoList.indexWhere((item) => item.id == todo.id);
    if (index != -1) {
      todoList[index] ;

    }

  });
}

  void _goToAddPage() async {
    final Todo? result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => Add()),
    );

    if (result != null) {
      // _addToDoItem(_todoController.text);
      setState(() {
        todoList.add(result);
      });
    }
  }


  void _goToEditPage(Todo todo) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => Edit(todo: todo),
      ),
    );

    if (result != null) {
      // _editToDo(todo);
      setState(() {
        final index = todoList.indexWhere((item) => item.id == todo.id);
        if (index != -1) {
          todoList[index] = result ;

        }
      });
    }
  }

  Widget searchBox() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.orange[100],
          borderRadius: BorderRadius.circular(20)
      ),
      child: TextField(
        onChanged: (value) => _runFilter(value),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black87, //สี icon
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              minWidth: 25
          ),
          border: InputBorder.none,
          hintText: 'SEARCH',
          hintStyle: TextStyle(color: Colors.brown), //สีตัวอักษรที่เป็นตัว hint
        ),
      ),
    );
  }


  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.blue[300],
      elevation: 0,
      title: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
        Icon(
              Icons.menu_open_rounded,
              color: Colors.black87,
              size: 30,
            ),
        Text(
          'TO DO',
          style: TextStyle(
            color: Color.fromARGB(228, 7, 6, 123),
            fontSize: 18,
            fontWeight: FontWeight.bold
          ),
        ),
        Container(
          height: 40,
          width: 40,
          child: ClipRRect(
            borderRadius: BorderRadiusGeometry.circular(20),
            child: Image.asset('asserts/images_profile.png'),
          ),
        )
      ],),
    );
  }
}





