// model.dart
class Todo {
  final String title;
  bool isCompleted;

  Todo({required this.title, this.isCompleted = false});
}

// view.dart
import 'package:flutter/material.dart';
import 'controller.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final controller = TodoController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('MVC To-Do List')),
      body: ListView.builder(
        itemCount: controller.todos.length,
        itemBuilder: (context, index) {
          final todo = controller.todos[index];
          return ListTile(
            title: Text(todo.title),
            trailing: Checkbox(
              value: todo.isCompleted,
              onChanged: (value) => setState(() => controller.toggleTodo(index)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => controller.addTodo('New Task')),
        child: Icon(Icons.add),
      ),
    );
  }
}

// controller.dart
import 'model.dart';

class TodoController {
  List<Todo> todos = [];

  void addTodo(String title) {
    todos.add(Todo(title: title));
  }

  void toggleTodo(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
  }
}

// main.dart
import 'package:flutter/material.dart';
import 'view.dart';

void main() => runApp(MaterialApp(home: TodoView()));