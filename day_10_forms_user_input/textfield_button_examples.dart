import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('TextField & Button Examples')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BasicTextField(),
              StyledTextField(),
              FormWithButton(),
              TextButtonExample(),
            ],
          ),
        ),
      ),
    );
  }
}

class BasicTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(labelText: 'Enter Name'),
      ),
    );
  }
}

class StyledTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextField(
        decoration: InputDecoration(
          labelText: 'Email',
          border: OutlineInputBorder(),
          prefixIcon: Icon(Icons.email),
        ),
      ),
    );
  }
}

class FormWithButton extends StatefulWidget {
  @override
  _FormWithButtonState createState() => _FormWithButtonState();
}

class _FormWithButtonState extends State<FormWithButton> {
  final _controller = TextEditingController();
  String _displayText = '';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            controller: _controller,
            decoration: InputDecoration(labelText: 'Your Name'),
          ),
          ElevatedButton(
            onPressed: () => setState(() => _displayText = _controller.text),
            child: Text('Submit'),
          ),
          Text('You entered: $_displayText'),
        ],
      ),
    );
  }
}

class TextButtonExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: TextButton(
        onPressed: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Clicked!')),
        ),
        child: Text('Click Me', style: TextStyle(color: Colors.blue)),
      ),
    );
  }
}