import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Text & Image Widget Examples')),
        body: Column(
          children: [
            BasicText(),
            StyledText(),
            NetworkImageWidget(),
            TextImageCombo(),
          ],
        ),
      ),
    );
  }
}

class BasicText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Hello, Flutter!');
  }
}

class StyledText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text(
      'Styled Text',
      style: TextStyle(fontSize: 24, color: Colors.purple, fontWeight: FontWeight.bold),
    );
  }
}

class NetworkImageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Image.network(
      'https://picsum.photos/200',
      width: 100,
      height: 100,
    );
  }
}

class TextImageCombo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text('Beach Vibes', style: TextStyle(fontSize: 20)),
        Image.network('https://picsum.photos/200/150'),
      ],
    );
  }
}