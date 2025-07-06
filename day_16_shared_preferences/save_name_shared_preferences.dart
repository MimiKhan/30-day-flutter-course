import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NamePage(),
    );
  }
}

class NamePage extends StatefulWidget {
  @override
  _NamePageState createState() => _NamePageState();
}

class _NamePageState extends State<NamePage> {
  final _nameController = TextEditingController();
  String _savedName = '';

  Future<void> _saveName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', _nameController.text);
    setState(() {
      _savedName = _nameController.text;
    });
  }

  Future<void> _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedName = prefs.getString('username') ?? '';
    });
  }

  Future<void> _clearName() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('username');
    setState(() {
      _savedName = '';
      _nameController.clear();
    });
  }

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Save Name')),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Enter Name'),
            ),
            SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: _saveName,
                  child: Text('Save Name'),
                ),
                SizedBox(width: 16),
                ElevatedButton(
                  onPressed: _clearName,
                  child: Text('Clear Name'),
                ),
              ],
            ),
            SizedBox(height: 16),
            Text('Saved Name: $_savedName'),
          ],
        ),
      ),
    );
  }
}