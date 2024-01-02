import 'dart:collection';

import 'package:flutter/foundation.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskData extends ChangeNotifier {
  final List<Task> _tasks = [
    Task(name: 'Buy milk'),
    Task(name: 'Buy eggs'),
    Task(name: 'Buy bread'),
  ];

  bool isEditing = false;

  UnmodifiableListView<Task> get tasks => UnmodifiableListView(_tasks);

  int get taskCount => _tasks.length;

  void addTask(String newTaskTitle) {
    if (newTaskTitle.isEmpty) return;
    _tasks.add(Task(name: newTaskTitle));
    notifyListeners();
  }

  void checkTask(Task task, bool? value) {
    task.toggleDone();
    notifyListeners();
  }

  void editTaskName(Task task, String newTaskName) {
    task.name = newTaskName;
    notifyListeners();
  }

  void startEditing() {
    isEditing = true;
    notifyListeners();
  }

  void endEditing() {
    isEditing = false;
    notifyListeners();
  }
}
