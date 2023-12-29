import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
import 'package:todoey_flutter/screens/add_task_screen.dart';
import 'package:todoey_flutter/widgets/tasks_list.dart';

class TasksScreen extends StatefulWidget {
  const TasksScreen({super.key});

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  final List<Task> tasks = [
    Task(name: 'Buy milk', isDone: true),
    Task(name: 'Buy eggs', isDone: true),
    Task(name: 'Buy bread', isDone: false),
  ];

  var isEditingTask = false;
  late TextEditingController taskController;

  @override
  void initState() {
    super.initState();
    taskController = TextEditingController();
  }

  @override
  void dispose() {
    taskController.dispose();
    super.dispose();
  }

  void _addTask(String newTaskTitle) {
    if (newTaskTitle.isEmpty) return;
    setState(() {
      tasks.add(Task(name: newTaskTitle));
    });
  }

  void _checkTask(Task task, bool? value) {
    setState(() {
      task.toggleDone();
    });
  }

  void _editTaskName(Task task, String newTaskName) {
    setState(() {
      isEditingTask = true;
      task.name = newTaskName;
    });
  }

  void _startEditing() {
    setState(() {
      isEditingTask = true;
    });
  }

  void _endEditing() {
    setState(() {
      isEditingTask = false;
    });
  }

  void _openAddTaskModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      barrierColor: Colors.grey[300]!.withOpacity(0.7),
      context: context,
      builder: (BuildContext context) {
        return AddTaskScreen(
          addTask: _addTask,
          taskController: taskController,
        );
      },
    ).whenComplete(() => taskController.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlueAccent,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(
                top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 30.0,
                  child: Icon(Icons.list,
                      size: 30.0, color: Colors.lightBlueAccent),
                ),
                const SizedBox(
                  height: 10.0,
                ),
                const Text(
                  'Todoey',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 50.0,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${tasks.length} tasks',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
              ),
              child: TasksList(
                  tasks: tasks,
                  handleCheckboxChange: _checkTask,
                  handleEditTaskName: _editTaskName,
                  startEditing: _startEditing,
                  endEditing: _endEditing),
            ),
          ),
        ],
      ),
      floatingActionButton: isEditingTask
          ? null
          : FloatingActionButton(
              backgroundColor: Colors.lightBlueAccent,
              shape: const CircleBorder(),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: () {
                _openAddTaskModal(context);
              },
            ),
    );
  }
}
