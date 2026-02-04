class Todo {

  final String id;

  String toDoText = " ";

  bool isDone ;

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