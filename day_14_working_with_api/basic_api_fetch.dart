import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherPage(),
    );
  }
}

class WeatherPage extends StatefulWidget {
  @override
  _WeatherPageState createState() => _WeatherPageState();
}

class _WeatherPageState extends State<WeatherPage> {
  String _weather = 'Loading...';

  Future<void> _fetchWeather() async {
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=London&appid=YOUR_API_KEY'));
    if (response.statusCode == 200) {
      setState(() {
        _weather = 'London: Sunny, 25°C';
      });
    } else {
      setState(() {
        _weather = 'Failed to load weather';
      });
    }
  }

  Future<void> _fetchWeatherWithButton() async {
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=Paris&appid=YOUR_API_KEY'));
    if (response.statusCode == 200) {
      setState(() {
        _weather = 'Paris: Cloudy, 20°C';
      });
    } else {
      setState(() {
        _weather = 'Failed to load Paris weather';
      });
    }
  }

  Future<void> _fetchWeatherWithError() async {
    final response = await http.get(Uri.parse('https://api.openweathermap.org/data/2.5/weather?q=InvalidCity&appid=YOUR_API_KEY'));
    if (response.statusCode == 200) {
      setState(() {
        _weather = 'InvalidCity: Sunny, 25°C';
      });
    } else {
      setState(() {
        _weather = 'City not found';
      });
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather API')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _weather,
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchWeatherWithButton,
              child: Text('Fetch Paris Weather'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: _fetchWeatherWithError,
              child: Text('Test Error'),
            ),
          ],
        ),
      ),
    );
  }
}