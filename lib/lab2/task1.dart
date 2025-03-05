import 'dart:io';

void main() {
  List<String> tasks = [];
  bool running = true;

  while (running) {
    print('\n--- To-Do List ---');
    print('1. View Tasks');
    print('2. Add Task');
    print('3. Mark Task as Completed');
    print('4. Exit');
    stdout.write('Choose an option: ');

    String? input = stdin.readLineSync();
    int choice = int.tryParse(input ?? '') ?? 0;

    switch (choice) {
      case 1:
        viewTasks(tasks);
        break;
      case 2:
        addTask(tasks);
        break;
      case 3:
        markTaskCompleted(tasks);
        break;
      case 4:
        running = false;
        print('Exiting the program. Goodbye!');
        break;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}

void viewTasks(List<String> tasks) {
  if (tasks.isEmpty) {
    print('No tasks available.');
  } else {
    print('\n--- Tasks ---');
    for (int i = 0; i < tasks.length; i++) {
      print('${i + 1}. ${tasks[i]}');
    }
  }
}

void addTask(List<String> tasks) {
  stdout.write('Enter a new task: ');
  String? task = stdin.readLineSync();
  if (task != null && task.isNotEmpty) {
    tasks.add(task);
    print('Task added: $task');
  } else {
    print('Invalid input. Task not added.');
  }
}

void markTaskCompleted(List<String> tasks) {
  viewTasks(tasks);
  if (tasks.isNotEmpty) {
    stdout.write('Enter the task number to mark as completed: ');
    String? input = stdin.readLineSync();
    int index = int.tryParse(input ?? '') ?? 0;

    if (index > 0 && index <= tasks.length) {
      String removedTask = tasks.removeAt(index - 1);
      print('Task "$removedTask" marked as completed and removed.');
    } else {
      print('Invalid task number. Please try again.');
    }
  }
}