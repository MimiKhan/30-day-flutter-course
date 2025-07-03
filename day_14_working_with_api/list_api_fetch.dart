import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostsPage(),
    );
  }
}

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<String> _posts = [];

  Future<void> _fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      setState(() {
        _posts = ['Post 1', 'Post 2', 'Post 3', 'Post 4', 'Post 5'];
      });
    } else {
      setState(() {
        _posts = ['Failed to load posts'];
      });
    }
  }

  Future<void> _fetchUsers() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));
    if (response.statusCode == 200) {
      setState(() {
        _posts = ['User 1', 'User 2', 'User 3', 'User 4', 'User 5'];
      });
    } else {
      setState(() {
        _posts = ['Failed to load users'];
      });
    }
  }

  Future<void> _clearPosts() async {
    setState(() {
      _posts = [];
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Posts API')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _fetchPosts,
                child: Text('Fetch Posts'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _fetchUsers,
                child: Text('Fetch Users'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _clearPosts,
                child: Text('Clear'),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: _posts.length,
              itemBuilder: (context, index) => ListTile(
                title: Text(_posts[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}