import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Stack Examples')),
        body: Column(
          children: [
            BasicStack(),
            AlignedStack(),
            ImageOverlayStack(),
            BadgeStack(),
          ],
        ),
      ),
    );
  }
}

class BasicStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(width: 100, height: 100, color: Colors.blue),
        Container(width: 50, height: 50, color: Colors.red),
      ],
    );
  }
}

class AlignedStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(width: 100, height: 100, color: Colors.green),
        Text('Center', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}

class ImageOverlayStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.network('https://picsum.photos/100', width: 100, height: 100),
        Positioned(
          top: 5,
          right: 5,
          child: Icon(Icons.favorite, color: Colors.red),
        ),
      ],
    );
  }
}

class BadgeStack extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 100,
          color: Colors.yellow,
          child: Center(child: Text('Item')),
        ),
        Positioned(
          top: 0,
          left: 0,
          child: Container(
            color: Colors.black,
            padding: EdgeInsets.all(2),
            child: Text('New', style: TextStyle(color: Colors.white, fontSize: 12)),
          ),
        ),
      ],
    );
  }
}