import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task_data.dart';
import 'package:todoey_flutter/screens/tasks_screen.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    return ChangeNotifierProvider(
      create: (context) => TaskData(),
      child: MaterialApp(
          theme: ThemeData(
            primaryColor: Colors.lightBlueAccent,
            scaffoldBackgroundColor: Colors.lightBlueAccent,
          ),
          home: const TasksScreen()
      ),
    );
  }
}
