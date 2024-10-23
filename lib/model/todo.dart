import 'package:flutter/cupertino.dart';

class ToDo{
  String? id;
  String? todotext;
  bool isDone;

  ToDo({
    required this.id,
    required this.todotext,
    this.isDone = false
  });
  static List<ToDo> todolist(){
    return [
      ToDo(id: "1", todotext: "OHAIO SEKAI GOOD MORNING WORLD!", isDone: true),
      ToDo(id: "2", todotext: "afternoon snack", isDone: true),
      ToDo(id: "3", todotext: "evening cake", isDone: false),
      ToDo(id: "4", todotext: "night dinner", isDone: false),
      ToDo(id: "5", todotext: "play games", isDone: false),
      ToDo(id: "6", todotext: "study", isDone: false)
    ];
  }

}