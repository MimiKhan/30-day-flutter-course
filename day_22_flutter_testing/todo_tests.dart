// todo.dart
class Todo {
  final String title;
  bool isCompleted;

  Todo({required this.title, this.isCompleted = false});

  void toggle() => isCompleted = !isCompleted;
}

// todo_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:your_app_name/todo.dart';

void main() {
  test('Todo toggles completion correctly', () {
    final todo = Todo(title: 'Test Task');
    expect(todo.isCompleted, false);
    todo.toggle();
    expect(todo.isCompleted, true);
  });

  test('Todo retains title after toggle', () {
    final todo = Todo(title: 'Test Task');
    todo.toggle();
    expect(todo.title, 'Test Task');
  });

  test('Todo toggles back to incomplete', () {
    final todo = Todo(title: 'Test Task');
    todo.toggle();
    todo.toggle();
    expect(todo.isCompleted, false);
  });
}

// todo_widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_app_name/todo_page.dart';

void main() {
  testWidgets('Todo page displays tasks', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TodoPage()));
    expect(find.text('Test Task'), findsOneWidget);
  });

  testWidgets('Todo page toggles task completion', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: TodoPage()));
    expect(find.byIcon(Icons.check_box_outline_blank), findsOneWidget);
    await tester.tap(find.byType(Checkbox));
    await tester.pump();
    expect(find.byIcon(Icons.check_box), findsOneWidget);
  });
}

// todo_page.dart
import 'package:flutter/material.dart';
import 'todo.dart';

class TodoPage extends StatefulWidget {
  @override
  _TodoPageState createState() => _TodoPageState();
}

class _TodoPageState extends State<TodoPage> {
  final List<Todo> todos = [Todo(title: 'Test Task')];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('To-Do List')),
      body: ListView.builder(
        itemCount: todos.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(todos[index].title),
            trailing: Checkbox(
              value: todos[index].isCompleted,
              onChanged: (value) => setState(() => todos[index].toggle()),
            ),
          );
        },
      ),
    );
  }
}