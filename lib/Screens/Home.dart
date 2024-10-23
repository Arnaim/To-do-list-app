import 'package:flutter/material.dart';
import '../Widgets/todo_item.dart';
import '../model/todo.dart';

class Home extends StatefulWidget{

  final VoidCallback toggleThemeMode;
  final taskController = TextEditingController();


  Home({required this.toggleThemeMode});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final todoslist = ToDo.todolist();
  List <ToDo> FoundToDo = [];

  @override
  void initState() {
    FoundToDo = todoslist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: Text("Your To Do List"),
      backgroundColor: Colors.yellow[700],
      actions: [
        IconButton(
          icon: Icon(Icons.brightness_6),
          onPressed: widget.toggleThemeMode, // Toggle the theme when pressed
        ),
      ],
    ),
    body: Container(
      padding: EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      //margin: EdgeInsets.symmetric(vertical: 30),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: ListView(
                children: [
                  Searchbox(),
                  SizedBox(height: 20,),
                  for(ToDo todoo in FoundToDo.reversed)
                  todoitem(
                    Todo: todoo,
                    todochanged: handletodochange,
                    ondeleteitem: handledelete,
                  ),
            ],
          )
          )
        ],
      ),
    ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _showAddTaskDialog(context);
        },
        child: const Icon(Icons.add, color: Colors.black,),
        backgroundColor: Colors.yellow[700],
      ),
  );
  }

  // Method to show the add task dialog
  void _showAddTaskDialog(BuildContext context) {
    final TextEditingController taskController = TextEditingController();

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Add a Task"),
          content: TextField(
            controller: taskController,
            decoration: const InputDecoration(hintText: "Enter task name"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog without saving
              },
              child: const Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                if (taskController.text.isNotEmpty) {
                  _addTask(taskController.text); // Call to add the task
                }
                Navigator.of(context).pop(); // Close the dialog
              },
              child: const Text("Add"),
            ),
          ],
        );
      },
    );
  }

  //checked and unchecked
  void handletodochange(ToDo todo){
    setState(() {
      todo.isDone = !todo.isDone;
    });
  }

  //delete
  void handledelete(String id){
    setState(() {
      todoslist.removeWhere((item)=> item.id == id);
    });
  }

  //searchbox
  Widget Searchbox(){
    return  Container(

      decoration: BoxDecoration(
          color: Colors.white10,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: Colors.black26,// Border color
            width: 2.0, // Border width
          )
      ),
      child: TextField(
        onChanged: (value) => searcheditems(value),
        decoration: InputDecoration(
            contentPadding: EdgeInsets.all(20),
            prefixIcon: Icon(Icons.search,),
            border: InputBorder.none,
            hintText: "Search your to do list"
        ),
      ),
    );
  }

//add items
  void _addTask(String todo) {
    setState(() {
      todoslist.add(ToDo(id: DateTime.now().microsecondsSinceEpoch.toString(), todotext: todo));
    });
  }
//search
  void searcheditems(String enteredKeyword){
    List<ToDo> results = [];
    if(enteredKeyword.isEmpty){
      results = todoslist;
    }else{
      results = todoslist.where((item)=>item.todotext!.toLowerCase().contains(enteredKeyword.toLowerCase())).toList();
    }
    setState(() {
     FoundToDo = results;
    });
  }
}

