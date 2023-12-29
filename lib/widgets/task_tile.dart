import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
    required this.handleCheckboxChange,
    required this.handleEditTaskName,
    required this.startEditing,
    required this.endEditing,
  });

  final Task task;
  final void Function(Task task, bool? value) handleCheckboxChange;
  final void Function(Task task, String newTaskName) handleEditTaskName;
  final void Function() startEditing;
  final void Function() endEditing;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: GestureDetector(
        child: TextFormField(
          onTap: () {
            startEditing();
          },
          initialValue: task.name,
          style: const TextStyle(fontSize: 18.0),
          decoration: const InputDecoration(border: InputBorder.none),
          onChanged: (value) {
            handleEditTaskName(task, value);
          },
          onFieldSubmitted: (value) {
            endEditing();
          },
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (bool? value) {
          handleCheckboxChange(task, value);
        },
      ),
    );
  }
}
