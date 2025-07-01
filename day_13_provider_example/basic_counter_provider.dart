import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CounterModel(),
      child: MaterialApp(
        home: CounterPage(),
      ),
    );
  }
}

class CounterModel extends ChangeNotifier {
  int _counter = 0;

  int get counter => _counter;

  void increment() {
    _counter++;
    notifyListeners();
  }

  void decrement() {
    _counter--;
    notifyListeners();
  }
}

class CounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter with Provider')),
      body: Center(
        child: Consumer<CounterModel>(
          builder: (context, counterModel, child) => Text(
            'Counter: ${counterModel.counter}',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => Provider.of<CounterModel>(context, listen: false).increment(),
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => Provider.of<CounterModel>(context, listen: false).decrement(),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}