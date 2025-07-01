import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ListApp(),
    );
  }
}

class ListApp extends StatefulWidget {
  @override
  _ListAppState createState() => _ListAppState();
}

class _ListAppState extends State<ListApp> {
  final _taskController = TextEditingController();
  List<String> _tasks = [];

  void _addTask() {
    if (_taskController.text.isNotEmpty) {
      setState(() {
        _tasks.add(_taskController.text);
        _taskController.clear();
      });
    }
  }

  void _removeTask(int index) {
    setState(() {
      _tasks.removeAt(index);
    });
  }

  void _clearTasks() {
    setState(() {
      _tasks.clear();
    });
  }

  void _addDefaultTask() {
    setState(() {
      _tasks.add('Default Task');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Dynamic Task List')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _taskController,
              decoration: InputDecoration(labelText: 'Enter Task'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _addTask,
                  child: Text('Add Task'),
                ),
                ElevatedButton(
                  onPressed: _clearTasks,
                  child: Text('Clear All'),
                ),
                ElevatedButton(
                  onPressed: _addDefaultTask,
                  child: Text('Add Default'),
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _tasks.length,
                itemBuilder: (context, index) => ListTile(
                  title: Text(_tasks[index]),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () => _removeTask(index),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}