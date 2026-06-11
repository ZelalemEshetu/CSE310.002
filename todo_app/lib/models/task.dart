// Represents a single task in the Todo application
class Task {
  // Title or description of the task
  String title;

  // Status of the task: true if completed, false if not
  bool isDone;

  // Constructor to create a Task object
  // By default, a new task is not completed (isDone = false)
  Task({
    required this.title,
    this.isDone = false,
  });
}