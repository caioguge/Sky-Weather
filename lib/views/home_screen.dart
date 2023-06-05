import 'package:flutter/material.dart';
import 'login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black54,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'Sky Weather',
          style: TextStyle(
            fontFamily: 'Montserrat',
            letterSpacing: -1,
            fontWeight: FontWeight.w600,
            fontSize: 20,
          ),
        ),
      ),
      body: const LoginScreen(),
    );
  }
}
