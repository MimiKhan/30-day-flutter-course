// model.dart
class Todo {
  final String title;
  bool isCompleted;

  Todo({required this.title, this.isCompleted = false});
}

// viewmodel.dart
import 'package:flutter/material.dart';
import 'model.dart';

class TodoViewModel with ChangeNotifier {
  List<Todo> _todos = [];

  List<Todo> get todos => _todos;

  void addTodo(String title) {
    _todos.add(Todo(title: title));
    notifyListeners();
  }

  void toggleTodo(int index) {
    _todos[index].isCompleted = !_todos[index].isCompleted;
    notifyListeners();
  }
}

// view.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'viewmodel.dart';

class TodoView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TodoViewModel>(context);
    return Scaffold(
      appBar: AppBar(title: Text('MVVM To-Do List')),
      body: ListView.builder(
        itemCount: viewModel.todos.length,
        itemBuilder: (context, index) {
          final todo = viewModel.todos[index];
          return ListTile(
            title: Text(todo.title),
            trailing: Checkbox(
              value: todo.isCompleted,
              onChanged: (value) => viewModel.toggleTodo(index),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => viewModel.addTodo('New Task'),
        child: Icon(Icons.add),
      ),
    );
  }
}

// main.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'view.dart';
import 'viewmodel.dart';

void main() => runApp(
      ChangeNotifierProvider(
        create: (_) => TodoViewModel(),
        child: MaterialApp(home: TodoView()),
      ),
    );