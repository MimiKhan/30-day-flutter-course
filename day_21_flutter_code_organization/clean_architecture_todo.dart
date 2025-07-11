// entities/todo.dart
class Todo {
  final String title;
  bool isCompleted;

  Todo({required this.title, this.isCompleted = false});
}

// usecases/add_todo.dart
import '../entities/todo.dart';

class AddTodoUseCase {
  final List<Todo> todos;

  AddTodoUseCase(this.todos);

  void execute(String title) {
    todos.add(Todo(title: title));
  }
}

// usecases/toggle_todo.dart
import '../entities/todo.dart';

class ToggleTodoUseCase {
  final List<Todo> todos;

  ToggleTodoUseCase(this.todos);

  void execute(int index) {
    todos[index].isCompleted = !todos[index].isCompleted;
  }
}

// presentation/todo_view.dart
import 'package:flutter/material.dart';
import '../usecases/add_todo.dart';
import '../usecases/toggle_todo.dart';
import '../entities/todo.dart';

class TodoView extends StatefulWidget {
  @override
  _TodoViewState createState() => _TodoViewState();
}

class _TodoViewState extends State<TodoView> {
  final List<Todo> todos = [];
  late AddTodoUseCase addUseCase;
  late ToggleTodoUseCase toggleUseCase;

  @override
  void initState() {
    super.initState();
    addUseCase = AddTodoUseCase(todos);
    toggleUseCase = ToggleTodoUseCase(todos);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Clean Architecture To-Do List')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          final todo = todos[index];
          return ListTile(
            title: Text(todo.title),
            trailing: Checkbox(
              value: todo.isCompleted,
              onChanged: (value) => setState(() => toggleUseCase.execute(index)),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => setState(() => addUseCase.execute('New Task')),
        child: Icon(Icons.add),
      ),
    );
  }
}

// main.dart
import 'package:flutter/material.dart';
import 'presentation/todo_view.dart';

void main() => runApp(MaterialApp(home: TodoView()));