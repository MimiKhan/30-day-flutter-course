import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: PostsPage(),
    );
  }
}

class Post {
  final int id;
  final String title;

  Post({required this.id, required this.title});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      title: json['title'],
    );
  }
}

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  List<Post> _posts = [];

  Future<void> _fetchPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      setState(() {
        _posts = jsonData.map((json) => Post.fromJson(json)).toList();
      });
    } else {
      setState(() {
        _posts = [];
      });
    }
  }

  Future<void> _fetchLimitedPosts() async {
    final response = await http.get(Uri.parse('https://jsonplaceholder.typicode.com/posts?_limit=3'));
    if (response.statusCode == 200) {
      List<dynamic> jsonData = jsonDecode(response.body);
      setState(() {
        _posts = jsonData.map((json) => Post.fromJson(json)).toList();
      });
    } else {
      setState(() {
        _posts = [];
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
      appBar: AppBar(title: Text('JSON Posts')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: _fetchPosts,
                child: Text('Fetch All Posts'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _fetchLimitedPosts,
                child: Text('Fetch 3 Posts'),
              ),
              SizedBox(width: 16),
              ElevatedButton(
                onPressed: _clearPosts,
                child: Text('Clear'),
              ),
            ],
          ),
          Expanded(
            child: _posts.isEmpty
                ? Center(child: CircularProgressIndicator())
                : ListView.builder(
                    itemCount: _posts.length,
                    itemBuilder: (context, index) => ListTile(
                      title: Text(_posts[index].title),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}