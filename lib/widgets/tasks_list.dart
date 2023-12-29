import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    Key? key,
    required this.tasks,
    required this.handleCheckboxChange,
  }) : super(key: key);

  final List<Task> tasks;
  final void Function(Task task, bool? value) handleCheckboxChange;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: tasks.length,
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 0.0),
          child: ListTile(
            title: Text(
              tasks[index].name,
              style: const TextStyle(fontSize: 18.0),
            ),
            trailing: Checkbox(
              value: tasks[index].isDone,
              onChanged: (bool? value) {
                handleCheckboxChange(tasks[index], value);
              },
            ),
          ),
        );
      },
    );
  }
}
