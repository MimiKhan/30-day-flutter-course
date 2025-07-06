import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: EnhancedTaskPage(),
    );
  }
}

class Task {
  final int? id;
  final String title;
  final bool completed;

  Task({this.id, required this.title, this.completed = false});

  Map<String, dynamic> toMap() {
    return {'id': id, 'title': title, 'completed': completed ? 1 : 0};
  }
}

class EnhancedTaskPage extends StatefulWidget {
  @override
  _EnhancedTaskPageState createState() => _EnhancedTaskPageState();
}

class _EnhancedTaskPageState extends State<EnhancedTaskPage> {
  final _titleController = TextEditingController();
  List<Task> _tasks = [];
  Database? _database;

  Future<void> _initDatabase() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'enhanced_tasks.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE tasks(id INTEGER PRIMARY KEY, title TEXT, completed INTEGER)',
        );
      },
      version: 1,
    );
    _fetchTasks();
  }

  Future<void> _fetchTasks() async {
    final List<Map<String, dynamic>> maps = await _database!.query('tasks');
    setState(() {
      _tasks = maps.map((map) => Task(
            id: map['id'],
            title: map['title'],
            completed: map['completed'] == 1,
          )).toList();
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

  Future<void> _toggleTask(int id, bool completed) async {
    await _database!.update(
      'tasks',
      {'completed': completed ? 0 : 1},
      where: 'id = ?',
      whereArgs: [id],
    );
    _fetchTasks();
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
      appBar: AppBar(title: Text('Enhanced Task Manager')),
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
                      title: Text(
                        _tasks[index].title,
                        style: TextStyle(
                          decoration: _tasks[index].completed
                              ? TextDecoration.lineThrough
                              : null,
                        ),
                      ),
                      leading: Checkbox(
                        value: _tasks[index].completed,
                        onChanged: (value) =>
                            _toggleTask(_tasks[index].id!, _tasks[index].completed),
                      ),
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