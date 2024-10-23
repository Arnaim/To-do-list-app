import 'package:flutter/material.dart';
import 'Screens/Home.dart';

void main() {
  runApp(TodoList());
}

class TodoList extends StatefulWidget {
  @override
  _TodoListState createState() => _TodoListState();
}

class _TodoListState extends State<TodoList> {
  ThemeMode _themeMode = ThemeMode.system;

  void _toggleThemeMode() {
    setState(() {
      // Toggle between light and dark modes
      if (_themeMode == ThemeMode.light) {
        _themeMode = ThemeMode.dark;
      } else {
        _themeMode = ThemeMode.light;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.yellow[700],
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Colors.yellow[700],
        appBarTheme: AppBarTheme(
            titleTextStyle: TextStyle(color: Colors.black, fontSize: 25, fontWeight: FontWeight.bold)),
      ),
      themeMode: _themeMode, // Apply current theme mode
      home: Home(toggleThemeMode: _toggleThemeMode),
    );
  }
}
