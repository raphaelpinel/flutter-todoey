import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.lightBlueAccent, // status bar color
    ));
    return MaterialApp(
      theme: ThemeData(
          primaryColor: Colors.lightBlueAccent,
          scaffoldBackgroundColor: Colors.lightBlueAccent,
      ),
        home: const TasksScreen()
    );
  }
}
