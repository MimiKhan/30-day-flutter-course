import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stateful Widget Examples')),
        body: Column(
          children: [
            Counter(),
            ToggleButton(),
            ColorChanger(),
            TextUpdater(),
          ],
        ),
      ),
    );
  }
}

class Counter extends StatefulWidget {
  @override
  _CounterState createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Count: $count'),
        ElevatedButton(
          onPressed: () => setState(() => count++),
          child: Text('+'),
        ),
      ],
    );
  }
}

class ToggleButton extends StatefulWidget {
  @override
  _ToggleButtonState createState() => _ToggleButtonState();
}

class _ToggleButtonState extends State<ToggleButton> {
  bool isOn = false;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => setState(() => isOn = !isOn),
      child: Text(isOn ? 'ON' : 'OFF'),
    );
  }
}

class ColorChanger extends StatefulWidget {
  @override
  _ColorChangerState createState() => _ColorChangerState();
}

class _ColorChangerState extends State<ColorChanger> {
  Color boxColor = Colors.blue;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => setState(() => boxColor = boxColor == Colors.blue ? Colors.red : Colors.blue),
      child: Container(color: boxColor, width: 50, height: 50),
    );
  }
}

class TextUpdater extends StatefulWidget {
  @override
  _TextUpdaterState createState() => _TextUpdaterState();
}

class _TextUpdaterState extends State<TextUpdater> {
  String message = 'Hello';

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(message),
        ElevatedButton(
          onPressed: () => setState(() => message = message == 'Hello' ? 'Hi!' : 'Hello'),
          child: Text('Change'),
        ),
      ],
    );
  }
}