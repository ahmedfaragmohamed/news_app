  import 'package:flutter/material.dart';
import 'package:news/screens/home_screen.dart';
import 'package:news/screens/splash_screen.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData  (useMaterial3: true),

      debugShowCheckedModeBanner: false,
      home: SplashScreen(),

    );
  }
}


