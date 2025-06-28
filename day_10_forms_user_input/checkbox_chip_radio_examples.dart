import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('Checkbox, Chip & Radio Examples')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BasicCheckbox(),
              CheckboxWithLabel(),
              BasicChip(),
              RadioExample(),
            ],
          ),
        ),
      ),
    );
  }
}

class BasicCheckbox extends StatefulWidget {
  @override
  _BasicCheckboxState createState() => _BasicCheckboxState();
}

class _BasicCheckboxState extends State<BasicCheckbox> {
  bool _isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Checkbox(
        value: _isChecked,
        onChanged: (value) => setState(() => _isChecked = value ?? false),
      ),
    );
  }
}

class CheckboxWithLabel extends StatefulWidget {
  @override
  _CheckboxWithLabelState createState() => _CheckboxWithLabelState();
}

class _CheckboxWithLabelState extends State<CheckboxWithLabel> {
  bool _agree = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Checkbox(
            value: _agree,
            onChanged: (value) => setState(() => _agree = value ?? false),
          ),
          Text('Agree to Terms'),
        ],
      ),
    );
  }
}

class BasicChip extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Chip(
        label: Text('Travel'),
        onDeleted: () => ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Chip Deleted')),
        ),
      ),
    );
  }
}

class RadioExample extends StatefulWidget {
  @override
  _RadioExampleState createState() => _RadioExampleState();
}

class _RadioExampleState extends State<RadioExample> {
  String? _selectedOption = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          RadioListTile(
            title: Text('Option 1'),
            value: 'Option 1',
            groupValue: _selectedOption,
            onChanged: (value) => setState(() => _selectedOption = value as String?),
          ),
          RadioListTile(
            title: Text('Option 2'),
            value: 'Option 2',
            groupValue: _selectedOption,
            onChanged: (value) => setState(() => _selectedOption = value as String?),
          ),
        ],
      ),
    );
  }
}