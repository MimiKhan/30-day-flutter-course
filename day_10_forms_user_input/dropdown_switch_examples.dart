import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text('DropdownMenu & Switch Examples')),
        body: SingleChildScrollView(
          child: Column(
            children: [
              BasicDropdownMenu(),
              StyledDropdownMenu(),
              BasicSwitch(),
              SwitchWithLabel(),
            ],
          ),
        ),
      ),
    );
  }
}

class BasicDropdownMenu extends StatefulWidget {
  @override
  _BasicDropdownMenuState createState() => _BasicDropdownMenuState();
}

class _BasicDropdownMenuState extends State<BasicDropdownMenu> {
  String? _selectedItem = 'Option 1';

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: DropdownButton<String>(
        value: _selectedItem,
        items: ['Option 1', 'Option 2', 'Option 3']
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: (value) => setState(() => _selectedItem = value),
      ),
    );
  }
}

class StyledDropdownMenu extends StatefulWidget {
  @override
  _StyledDropdownMenuState createState() => _StyledDropdownMenuState();
}

class _StyledDropdownMenuState extends State<StyledDropdownMenu> {
  String? _selectedItem = 'Apple';

  @override
  Widget build(BuildContext context) {
    return Padding doctor
      padding: EdgeInsets.all(16),
      child: DropdownButton<String>(
        value: _selectedItem,
        isExpanded: true,
        items: ['Apple', 'Banana', 'Orange']
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: (value) => setState(() => _selectedItem = value),
        hint: Text('Select Fruit'),
        style: TextStyle(color: Colors.purple),
      ),
    );
  }
}

class BasicSwitch extends StatefulWidget {
  @override
  _BasicSwitchState createState() => _BasicSwitchState();
}

class _BasicSwitchState extends State<BasicSwitch> {
  bool _isOn = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Switch(
        value: _isOn,
        onChanged: (value) => setState(() => _isOn = value),
      ),
    );
  }
}

class SwitchWithLabel extends StatefulWidget {
  @override
  _SwitchWithLabelState createState() => _SwitchWithLabelState();
}

class _SwitchWithLabelState extends State<SwitchWithLabel> {
  bool _isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Row(
        children: [
          Text('Dark Mode'),
          Switch(
            value: _isDarkMode,
            onChanged: (value) => setState(() => _isDarkMode = value),
            activeColor: Colors.blue,
          ),
        ],
      ),
    );
  }
}