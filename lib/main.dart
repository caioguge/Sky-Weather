import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'package:weather_idea/views/login_screen.dart';
import 'package:weather_idea/views/signup_screen.dart';
import 'package:weather_idea/views/weather_screen.dart';
import 'models/user_manager.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserManager(),
          lazy: false,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Controle de Estoque Morena',
        theme: ThemeData(
          appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromARGB(255, 27, 73, 165),
            elevation: 0,
          ),
          primaryColor: const Color.fromARGB(255, 27, 73, 165),
          scaffoldBackgroundColor: const Color.fromARGB(255, 27, 73, 165),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        initialRoute: '/login',
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case '/login':
              return MaterialPageRoute(
                builder: (_) => const LoginScreen(),
              );
            case '/signup':
              return MaterialPageRoute(
                builder: (_) => const SignUpScreen(),
              );
            case '/base':
            default:
              return MaterialPageRoute(
                builder: (_) => const WeatherScreen(),
              );
          }
        },
      ),
    );
  }
}
