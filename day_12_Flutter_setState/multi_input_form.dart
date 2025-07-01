import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: FormApp(),
    );
  }
}

class FormApp extends StatefulWidget {
  @override
  _FormAppState createState() => _FormAppState();
}

class _FormAppState extends State<FormApp> {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  String _name = '';
  String _email = '';

  void _submitForm() {
    setState(() {
      _name = _nameController.text;
      _email = _emailController.text;
    });
  }

  void _clearForm() {
    setState(() {
      _name = '';
      _email = '';
      _nameController.clear();
      _emailController.clear();
    });
  }

  void _updateName() {
    setState(() {
      _name = _nameController.text;
    });
  }

  void _updateEmail() {
    setState(() {
      _email = _emailController.text;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multi-Input Form')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Name'),
              onChanged: (text) => _updateName(),
            ),
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              onChanged: (text) => _updateEmail(),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: _submitForm,
                  child: Text('Submit'),
                ),
                ElevatedButton(
                  onPressed: _clearForm,
                  child: Text('Clear'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Name: $_name'),
            Text('Email: $_email'),
          ],
        ),
      ),
    );
  }
}