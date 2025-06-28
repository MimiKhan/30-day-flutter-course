import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('GridView Examples')),
        body: Column(
          children: [
            SizedBox(height: 100, child: BasicGridView()),
            SizedBox(height: 100, child: ImageGridView()),
            SizedBox(height: 100, child: CardGridView()),
            SizedBox(height: 100, child: DynamicGridView()),
          ],
        ),
      ),
    );
  }
}

class BasicGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Container(color: Colors.blue, child: Center(child: Text('1'))),
        Container(color: Colors.red, child: Center(child: Text('2'))),
        Container(color: Colors.green, child: Center(child: Text('3'))),
        Container(color: Colors.yellow, child: Center(child: Text('4'))),
        Container(color: Colors.purple, child: Center(child: Text('5'))),
      ],
    );
  }
}

class ImageGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      children: [
        Image.network('https://picsum.photos/50'),
        Image.network('https://picsum.photos/50'),
        Image.network('https://picsum.photos/50'),
        Image.network('https://picsum.photos/50'),
        Image.network('https://picsum.photos/50'),
      ],
    );
  }
}

class CardGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      children: [
        Card(child: Center(child: Text('Card 1'))),
        Card(child: Center(child: Text('Card 2'))),
        Card(child: Center(child: Text('Card 3'))),
        Card(child: Center(child: Text('Card 4'))),
        Card(child: Center(child: Text('Card 5'))),
      ],
    );
  }
}

class DynamicGridView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemCount: 6,
      itemBuilder: (context, index) => Card(
        child: Center(child: Text('Item ${index + 1}')),
      ),
    );
  }
}