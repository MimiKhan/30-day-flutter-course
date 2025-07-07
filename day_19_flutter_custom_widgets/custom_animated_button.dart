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

class CustomAnimatedButton extends StatefulWidget {
  final String text;
  final Color startColor;
  final Color endColor;

  CustomAnimatedButton({
    required this.text,
    required this.startColor,
    required this.endColor,
  });

  @override
  _CustomAnimatedButtonState createState() => _CustomAnimatedButtonState();
}

class _CustomAnimatedButtonState extends State<CustomAnimatedButton> {
  bool _isPressed = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _isPressed = !_isPressed;
        });
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${widget.text} Pressed')),
        );
      },
      child: AnimatedContainer(
        duration: Duration(milliseconds: 300),
        width: _isPressed ? 200 : 150,
        height: 50,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [_isPressed ? widget.endColor : widget.startColor, Colors.white],
          ),
          borderRadius: BorderRadius.circular(25),
        ),
        child: Center(
          child: Text(
            widget.text,
            style: TextStyle(fontSize: 16, color: Colors.black),
          ),
        ),
      ),
    );
  }
}

class AnimatedButtonPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Custom Animated Button')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomAnimatedButton(
              text: 'Gradient Button',
              startColor: Colors.purple,
              endColor: Colors.blue,
            ),
            SizedBox(height: 16),
            CustomAnimatedButton(
              text: 'Another Button',
              startColor: Colors.orange,
              endColor: Colors.red,
            ),
            SizedBox(height: 16),
            CustomAnimatedButton(
              text: 'Third Button',
              startColor: Colors.green,
              endColor: Colors.teal,
            ),
          ],
        ),
      ),
    );
  }
}