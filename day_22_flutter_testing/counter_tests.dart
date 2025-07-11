// counter.dart
class Counter {
  int value = 0;

  void increment() => value++;
  void decrement() => value--;
}

// counter_test.dart
import 'package:flutter_test/flutter_test.dart';
import 'package:your_app_name/counter.dart';

void main() {
  test('Counter increments correctly', () {
    final counter = Counter();
    expect(counter.value, 0);
    counter.increment();
    expect(counter.value, 1);
  });

  test('Counter decrements correctly', () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 1);
    counter.decrement();
    expect(counter.value, 0);
  });

  test('Counter handles multiple increments', () {
    final counter = Counter();
    counter.increment();
    counter.increment();
    expect(counter.value, 2);
  });
}

// counter_widget_test.dart
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:your_app_name/counter_page.dart';

void main() {
  testWidgets('Counter page displays and updates value', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CounterPage()));
    expect(find.text('Counter: 0'), findsOneWidget);
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    expect(find.text('Counter: 1'), findsOneWidget);
  });

  testWidgets('Counter page decrements correctly', (WidgetTester tester) async {
    await tester.pumpWidget(MaterialApp(home: CounterPage()));
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();
    await tester.tap(find.byIcon(Icons.remove));
    await tester.pump();
    expect(find.text('Counter: 0'), findsOneWidget);
  });
}

// counter_page.dart
import 'package:flutter/material.dart';
import 'counter.dart';

class CounterPage extends StatefulWidget {
  @override
  _CounterPageState createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  final counter = Counter();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Counter App')),
      body: Center(
        child: Text('Counter: ${counter.value}', style: TextStyle(fontSize: 24)),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            onPressed: () => setState(() => counter.increment()),
            child: Icon(Icons.add),
          ),
          SizedBox(height: 10),
          FloatingActionButton(
            onPressed: () => setState(() => counter.decrement()),
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}