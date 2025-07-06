import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TaskPage(),
    );
  }
}

class Task {
  final int? id;
  final String title;

  Task({this.id, required this.title});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title};
  }
}

class TaskPage extends StatefulWidget {
  @override
  _TaskPageState createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  final _titleController = TextEditingController();
  List<Task> _tasks = [];
  Database? _database;

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'tasks.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT)',
        );
      },
      version: 1,
    );
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final List<Map<String, dynamic>> maps = await _database!.query('tasks');
    setState(() {
      _tasks = maps.map((map) => Task(id: map['id'], title: map['title'])).toList();
    });
  }

  Future<void> _addTask() async {
    if (_titleController.text.isNotEmpty) {
      await _database!.insert(
        'tasks',
        Task(title: _titleController.text).toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
      _titleController.clear();
      _fetchTasks();
    }
  }

  Future<void> _deleteTask(int id) async {
    await _database!.delete('tasks', where: 'id = ?', whereArgs: [id]);
    _fetchTasks();
  }

  Future<void> _clearTasks() async {
    await _database!.delete('tasks');
    _fetchTasks();
  }

  @override
  void initState() {
    super.initState();
    _initDatabase();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Manager')),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: 'Enter Task'),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _addTask,
                child: Text('Add Task'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _clearTasks,
                child: Text('Clear All'),
              ),
            ],
          ),
          Expanded(
            child: _tasks.isEmpty
                ? Center(child: Text('No tasks yet'))
                : ListView.builder(
                    itemCount: _tasks.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(_tasks[index].title),
                      trailing: IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () => _deleteTask(_tasks[index].id!),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}