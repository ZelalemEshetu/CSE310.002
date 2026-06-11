import 'package:flutter/material.dart';
import '../models/task.dart';

/// Main page of the Todo application
/// Handles adding, displaying, marking, and deleting tasks
class TodoPage extends StatefulWidget {
  const TodoPage({super.key});

  @override
  State<TodoPage> createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  // List that stores all tasks
  final List<Task> tasks = [];

  // Controller for the input text field
  final TextEditingController controller = TextEditingController();

  /// Adds a new task to the list if input is not empty
  void addTask() {
    if (controller.text.isNotEmpty) {
      setState(() {
        tasks.add(Task(title: controller.text));
        controller.clear();
      });
    }
  }

  /// Deletes a task from the list by index
  void deleteTask(int index) {
    setState(() {
      tasks.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My ToDo App'),
      ),
      body: Column(
        children: [
          // Input area for new tasks
          Padding(
            padding: const EdgeInsets.all(10),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: controller,
                    decoration: const InputDecoration(
                      hintText: 'Enter a task',
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                // Button to add task
                IconButton(
                  icon: const Icon(Icons.add),
                  onPressed: addTask,
                ),
              ],
            ),
          ),

          // Task list display
          Expanded(
            child: ListView.builder(
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Checkbox(
                    value: tasks[index].isDone,
                    onChanged: (value) {
                      setState(() {
                        tasks[index].isDone = value!;
                      });
                    },
                  ),

                  // Task title with strike-through if completed
                  title: Text(
                    tasks[index].title,
                    style: TextStyle(
                      decoration: tasks[index].isDone
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),

                  // Delete button for each task
                  trailing: IconButton(
                    icon: const Icon(Icons.delete),
                    onPressed: () => deleteTask(index),
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}