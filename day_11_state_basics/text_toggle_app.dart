import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TextToggleApp(),
    );
  }
}

class TextToggleApp extends StatefulWidget {
  @override
  _TextToggleAppState createState() => _TextToggleAppState();
}

class _TextToggleAppState extends State<TextToggleApp> {
  String _message = 'Hello';

  void _toggleMessage() {
    setState(() {
      _message = _message == 'Hello' ? 'Hi!' : 'Hello';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Text Toggle App')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _message,
              style: TextStyle(fontSize: 24),
            ),
            ElevatedButton(
              onPressed: _toggleMessage,
              child: Text('Toggle Message'),
            ),
          ],
        ),
      ),
    );
  }
}