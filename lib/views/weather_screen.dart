import 'package:flutter/material.dart';
import 'package:weather_idea/services/weather_service.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({Key? key}) : super(key: key);

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  final apiKey = '4dd75ef3883e7e96b1fd3dcf4a85b904';
  final latitude = 37.7749; // Latitude da localização desejada
  final longitude = -122.4194; // Longitude da localização desejada

  Map<String, dynamic> weatherData = {};

  @override
  void initState() {
    super.initState();
    fetchWeatherData();
  }

  Future<void> fetchWeatherData() async {
    try {
      final weatherService = WeatherService();
      final data =
          await weatherService.getWeatherData(latitude, longitude, apiKey);
      setState(() {
        weatherData = data;
      });
    } catch (e) {
      // ignore: avoid_print
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: weatherData.isNotEmpty
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Temperature: ${weatherData['main']['temp']}°F',
                  style: const TextStyle(fontSize: 24),
                ),
                Text(
                  'Humidity: ${weatherData['main']['humidity']}%',
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            )
          : const CircularProgressIndicator(),
    );
  }
}
