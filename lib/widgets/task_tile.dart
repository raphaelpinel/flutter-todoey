import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/models/task_data.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.task,
  });

  final Task task;

  @override
  Widget build(BuildContext context) {
    final taskData = Provider.of<TaskData>(context);
    return ListTile(
      title: GestureDetector(
        child: TextFormField(
          onTap: () {
            taskData.startEditing();
          },
          initialValue: task.name,
          style: const TextStyle(fontSize: 18.0),
          decoration: const InputDecoration(border: InputBorder.none),
          onChanged: (value) {
            taskData.editTaskName(task, value);
          },
          onFieldSubmitted: (value) {
            taskData.endEditing();
          },
        ),
      ),
      trailing: Checkbox(
        value: task.isDone,
        onChanged: (bool? value) {
          taskData.checkTask(task, value);
        },
      ),
    );
  }
}
