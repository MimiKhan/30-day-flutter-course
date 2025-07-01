import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MultiCounterModel(),
      child: MaterialApp(
        home: MultiCounterPage(),
      ),
    );
  }
}

class MultiCounterModel extends ChangeNotifier {
  int _counter1 = 0;
  int _counter2 = 0;

  int get counter1 => _counter1;
  int get counter2 => _counter2;

  void incrementCounter1() {
    _counter1++;
    notifyListeners();
  }

  void decrementCounter1() {
    _counter1--;
    notifyListeners();
  }

  void incrementCounter2() {
    _counter2++;
    notifyListeners();
  }

  void resetCounters() {
    _counter1 = 0;
    _counter2 = 0;
    notifyListeners();
  }
}

class MultiCounterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Multi-Counter with Provider')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            Consumer<MultiCounterModel>(
              builder: (context, model, child) => Text(
                'Counter 1: ${model.counter1}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Provider.of<MultiCounterModel>(context, listen: false).incrementCounter1(),
                  child: Text('+'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => Provider.of<MultiCounterModel>(context, listen: false).decrementCounter1(),
                  child: Text('-'),
                ),
              ],
            ),
            Consumer<MultiCounterModel>(
              builder: (context, model, child) => Text(
                'Counter 2: ${model.counter2}',
                style: TextStyle(fontSize: 20),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () => Provider.of<MultiCounterModel>(context, listen: false).incrementCounter2(),
                  child: Text('+'),
                ),
                SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => Provider.of<MultiCounterModel>(context, listen: false).resetCounters(),
                  child: Text('Reset'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}