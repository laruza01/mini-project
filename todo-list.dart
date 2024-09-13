import 'dart:io';

class ToDoList {
  List<String> tasks = [];

  void addTask(String task) {
    tasks.add('Cooking');
    tasks.add('Outing');
    tasks.add('Jogging');
  }

  void viewTasks() {
    for (int i = 0; i < tasks.length; i++) {
      print("${i + 1}. ${tasks[i]}");
    }
  }

  void removeTask(int index) {
    if (index > 0 && index <= tasks.length) {
      tasks.removeAt(index - 1);
    } else {
      print("Invalid task index");
    }
  }

  void saveTasks(String filename) {
    File file = File(filename);
    file.writeAsStringSync(tasks.join("\n"));
  }

  void loadTasks(String filename) {
    File file = File(filename);
    if (file.existsSync()) {
      tasks = file.readAsStringSync().split("\n");
    } else {
      print("File not found");
    }
  }
}

void main() {
  ToDoList toDoList = ToDoList();
  toDoList.loadTasks('tasks.txt');

  while (true) {
    print("Select an option:");
    print("1. Add Task");
    print("2. View Tasks");
    print("3. Remove Task");
    print("4. Save and Exit");

    stdout.write("Enter your choice: ");
    String choice = stdin.readLineSync() ?? "";

    switch (choice) {
      case "1":
        stdout.write("Enter task: ");
        String task = stdin.readLineSync() ?? "";
        toDoList.addTask(task);
        break;
      case "2":
        toDoList.viewTasks();
        break;
      case "3":
        stdout.write("Enter task index to remove: ");
        int index = int.parse(stdin.readLineSync() ?? "0");
        toDoList.removeTask(index);
        break;
      case "4":
        toDoList.saveTasks('tasks.txt');
        print("Goodbye!");
        return;
      default:
        print("Invalid choice");
    }
  }
}