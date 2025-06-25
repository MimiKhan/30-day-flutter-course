import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Column Examples')),
        body: Column(
          children: [
            BasicColumn(),
            SpacedColumn(),
            AlignedColumn(),
            MixedColumn(),
          ],
        ),
      ),
    );
  }
}

class BasicColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Line 1'),
        Text('Line 2'),
        Text('Line 3'),
      ],
    );
  }
}

class SpacedColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(width: 50, height: 50, color: Colors.green),
        Container(width: 50, height: 50, color: Colors.purple),
      ],
    );
  }
}

class AlignedColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('Centered'),
        Icon(Icons.star),
      ],
    );
  }
}

class MixedColumn extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Profile', style: TextStyle(fontSize: 20)),
        Image.network('https://picsum.photos/100'),
        Text('Bio: Flutter Dev'),
      ],
    );
  }
}