import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

class TasksList extends StatelessWidget {
  const TasksList({
    super.key,
    required this.tasks,
  });

  final List<Task> tasks;

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
              onChanged: (bool? value) {},
            ),
          ),
        );
      },
    );
  }
}
