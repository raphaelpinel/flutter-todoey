import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';

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
          child: ListTile(
            title: GestureDetector(
              child: TextFormField(
                onTap: () {
                  startEditing();
                },
                initialValue: tasks[index].name,
                style: const TextStyle(fontSize: 18.0),
                decoration: const InputDecoration(border: InputBorder.none),
                onChanged: (value) {
                  handleEditTaskName(tasks[index], value);
                },
                onFieldSubmitted: (value) {
                  endEditing();
                },
              ),
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
