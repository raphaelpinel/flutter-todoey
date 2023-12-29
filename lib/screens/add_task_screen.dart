import 'package:flutter/material.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen(
      {super.key, required this.addTask, required this.taskController});
  final void Function(String) addTask;
  final TextEditingController taskController;

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  @override
  Widget build(BuildContext context) {
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
        padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 30.0),
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
                controller: widget.taskController,
                style: const TextStyle(fontSize: 18.0),
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  contentPadding: EdgeInsets.zero,
                ),
              ),
            ),
            const SizedBox(height: 35.0),
            ElevatedButton(
              onPressed: () {
                // Add task logic here (if needed separately)
                // This is for the button to close the modal without adding the task
                widget.addTask(widget.taskController.text);
                Navigator.pop(context);
                widget.taskController.clear();
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
  }
}
