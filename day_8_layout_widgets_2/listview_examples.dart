import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('ListView Examples')),
        body: Column(
          children: [
            SizedBox(height: 100, child: BasicListView()),
            SizedBox(height: 100, child: CardListView()),
            SizedBox(height: 100, child: SeparatedListView()),
            SizedBox(height: 100, child: DynamicListView()),
          ],
        ),
      ),
    );
  }
}

class BasicListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Text('Item 1'),
        Text('Item 2'),
        Text('Item 3'),
        Text('Item 4'),
        Text('Item 5'),
      ],
    );
  }
}

class CardListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Card(child: ListTile(title: Text('Card 1'))),
        Card(child: ListTile(title: Text('Card 2'))),
        Card(child: ListTile(title: Text('Card 3'))),
        Card(child: ListTile(title: Text('Card 4'))),
        Card(child: ListTile(title: Text('Card 5'))),
      ],
    );
  }
}

class SeparatedListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      separatorBuilder: (context, index) => Divider(),
      itemBuilder: (context, index) => ListTile(title: Text('Item ${index + 1}')),
    );
  }
}

class DynamicListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 6,
      itemBuilder: (context, index) => ListTile(
        title: Text('Dynamic Item ${index + 1}'),
        leading: Icon(Icons.star),
      ),
    );
  }
}