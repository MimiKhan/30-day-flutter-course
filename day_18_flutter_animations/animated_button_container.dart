import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: AnimatedButtonPage(),
    );
  }
}

class AnimatedButtonPage extends StatefulWidget {
  @override
  _AnimatedButtonPageState createState() => _AnimatedButtonPageState();
}

class _AnimatedButtonPageState extends State<AnimatedButtonPage> {
  bool _isPressed = false;
  double _size = 100;
  Color _color = Colors.blue;

  void _toggleAnimation() {
    setState(() {
      _isPressed = !_isPressed;
      _size = _isPressed ? 150 : 100;
      _color = _isPressed ? Colors.red : Colors.blue;
    });
  }

  void _resetAnimation() {
    setState(() {
      _isPressed = false;
      _size = 100;
      _color = Colors.blue;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Animated Button')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: _toggleAnimation,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                width: _size,
                height: _size,
                color: _color,
                child: Center(child: Text('Tap Me', style: TextStyle(color: Colors.white))),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _resetAnimation,
              child: Text('Reset'),
            ),
          ],
        ),
      ),
    );
  }
}