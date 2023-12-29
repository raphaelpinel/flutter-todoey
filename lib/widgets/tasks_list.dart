import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasks,
    required this.handleCheckboxChange,
    required this.handleEditTaskName,
    required this.startEditing,
    required this.endEditing,
  }) : super(key: key);

  final List<Task> tasks;
  final void Function(Task task, bool? value) handleCheckboxChange;
  final void Function(Task task, String newTaskName) handleEditTaskName;
  final void Function() startEditing;
  final void Function() endEditing;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
            child: TaskTile(
              task: tasks[index],
              handleCheckboxChange: handleCheckboxChange,
              handleEditTaskName: handleEditTaskName,
              startEditing: startEditing,
              endEditing: endEditing,
            )
        );
      },
    );
  }
}
