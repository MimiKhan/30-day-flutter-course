import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Row Examples')),
        body: Column(
          children: [
            BasicRow(),
            SpacedRow(),
            AlignedRow(),
            IconRow(),
          ],
        ),
      ),
    );
  }
}

class BasicRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text('Item 1'),
        Text('Item 2'),
        Text('Item 3'),
      ],
    );
  }
}

class SpacedRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(width: 50, height: 50, color: Colors.red),
        Container(width: 50, height: 50, color: Colors.blue),
      ],
    );
  }
}

class AlignedRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Centered'),
        Icon(Icons.star),
      ],
    );
  }
}

class IconRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(Icons.favorite, color: Colors.red),
        Icon(Icons.star, color: Colors.yellow),
        Icon(Icons.thumb_up, color: Colors.blue),
      ],
    );
  }
}