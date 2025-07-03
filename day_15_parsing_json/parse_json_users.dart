import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: UsersPage(),
    );
  }
}

class User {
  final int id;
  final String name;

  User({required this.id, required this.name});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
    );
  }
}

class UsersPage extends StatefulWidget {
  @override
  _UsersPageState createState() => _UsersPageState();
}

class _UsersPageState extends State<UsersPage> {
  List<User> _users = [];

  Future<void> _fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      setState(() {
        _users = jsonData.map((json) => User.fromJson(json)).toList();
      });
    } else {
      setState(() {
        _users = [];
      });
    }
  }

  Future<void> _fetchSingleUser() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users/1'));
    if (response.statusCode == 200) {
      Map<String, dynamic> jsonData = jsonDecode(response.body);
      setState(() {
        _users = [User.fromJson(jsonData)];
      });
    } else {
      setState(() {
        _users = [];
      });
    }
  }

  Future<void> _clearUsers() async {
    setState(() {
      _users = [];
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('JSON Users')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _fetchUsers,
                child: Text('Fetch All Users'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _fetchSingleUser,
                child: Text('Fetch One User'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _clearUsers,
                child: Text('Clear'),
              ),
            ],
          ),
          Expanded(
            child: _users.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _users.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(_users[index].name),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}