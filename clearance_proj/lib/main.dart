//import 'package:clearance_proj/screens/home.dart';
//import 'package:clearance_proj/screens/login_page.dart';
import 'package:clearance_proj/screens/splash_screen.dart';
import 'package:clearance_proj/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Check',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      routes: {
        '/': (context) => const SplashScreen(),
        '/welcome_screen': (context) => const Welcome(),
        //'/home': (context) => const HomePage(),
      },
    );
  }
}
