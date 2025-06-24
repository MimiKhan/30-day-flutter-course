import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stateless Widget Examples')),
        body: Column(
          children: [
            WelcomeText(),
            CustomText('Flutter Rocks!'),
            StyledBox(),
            IconDisplay(),
          ],
        ),
      ),
    );
  }
}

class WelcomeText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Welcome to Flutter!', style: TextStyle(fontSize: 20));
  }
}

class CustomText extends StatelessWidget {
  final String message;
  CustomText(this.message);

  @override
  Widget build(BuildContext context) {
    return Text(message, style: TextStyle(color: Colors.blue));
  }
}

class StyledBox extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.green,
      padding: EdgeInsets.all(10),
      child: Text('Styled Box', style: TextStyle(color: Colors.white)),
    );
  }
}

class IconDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Icon(Icons.star, color: Colors.yellow), Text('Star Icon')],
    );
  }
}