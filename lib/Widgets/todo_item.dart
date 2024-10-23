import 'package:flutter/material.dart';
import '../model/todo.dart';
class todoitem extends StatelessWidget {
  final ToDo Todo;
  final todochanged;
  final ondeleteitem;
  const todoitem({Key? key, required this.Todo, required this.todochanged, required this.ondeleteitem}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.only(bottom: 5),
          padding: EdgeInsets.symmetric(vertical: 10),
          child: ListTile(
            onTap: () {
              todochanged(Todo);
            },
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
            leading: Icon(
              Todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
              color: Colors.yellow[700],
            ),
            tileColor: Colors.blue[900],
            title: Stack(
              children: [
                // Overlay line for the line-through effect
                if (Todo.isDone)
                  Positioned(
                    left: 0,
                    right: 0,
                    top: 15, // Adjust the position of the line as needed
                    child: Container(
                      height: 2.5, // Change this value to make the line thicker
                      color: Colors.red, // Change to your desired line-through color
                    ),
                  ),
                // Actual text
                Text(
                  Todo.todotext!,
                  style: TextStyle(
                    height: 2,
                    color: Colors.white,
                    decoration: Todo.isDone ? TextDecoration.lineThrough  : null, // Prevent default line-through
                  ),
                ),
              ],
            ),
            trailing: Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                color: Colors.red,
              ),
              child: IconButton(
                iconSize: 15,
                icon: Icon(Icons.delete),
                onPressed: () {
                  ondeleteitem(Todo.id);
                },
                color: Colors.white,
              ),
            ),
          ),
        ),
      ],
    );
  }

}