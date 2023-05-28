import 'package:flutter/material.dart';
import 'package:weather_idea/views/weather_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Sky Weather',
          style: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 20,
          ),
        ),
      ),
      body: const WeatherScreen(),
    );
  }
}
