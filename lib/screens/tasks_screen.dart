import 'package:flutter/material.dart';
import 'package:todoey_flutter/models/task.dart';
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

  void _addTask() {
    final String newTaskTitle = taskController.text;
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

  void _openAddTaskModal(BuildContext context) {
    showModalBottomSheet(
      isScrollControlled: true,
      useSafeArea: true,
      barrierColor: Colors.grey[300]!.withOpacity(0.7),
      context: context,
      builder: (BuildContext context) {
        return SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Container(
            decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            padding:
                const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const Text(
                  'Add Task',
                  style: TextStyle(
                    color: Colors.lightBlueAccent,
                    fontSize: 30.0,
                    fontWeight: FontWeight.w500,
                  ),
                  textAlign: TextAlign.center,
                ),
                // const SizedBox(height: 10.0),
                Container(
                  decoration: const BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.lightBlueAccent,
                        width: 4.0,
                      ),
                    ),
                  ),
                  child: TextField(
                    autofocus: true,
                    controller: taskController,
                    style: const TextStyle(fontSize: 18.0),
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      contentPadding: EdgeInsets.zero,
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        _addTask();
                        Navigator.pop(
                            context); // Close the modal after adding the task
                      }
                    },
                  ),
                ),
                const SizedBox(height: 35.0),
                ElevatedButton(
                  onPressed: () {
                    // Add task logic here (if needed separately)
                    // This is for the button to close the modal without adding the task
                    _addTask();
                    Navigator.pop(context);
                    taskController.clear();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightBlueAccent,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(0.0)),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const SizedBox(
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Add',
                        style: TextStyle(color: Colors.white, fontSize: 18.0),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20.0), // Additional space at the bottom
              ],
            ),
          ),
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
                padding:
                    const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0),
                  ),
                ),
                child:
                    TasksList(tasks: tasks, handleCheckboxChange: _checkTask),
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.lightBlueAccent,
          shape: const CircleBorder(),
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
          onPressed: () {
            _openAddTaskModal(context);
          },
        ));
  }
}
