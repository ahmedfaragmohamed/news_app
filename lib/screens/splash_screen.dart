

import 'package:flutter/material.dart';
import 'package:news/screens/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override

  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 3),(){
      Navigator.pushAndRemoveUntil(context,
          MaterialPageRoute(builder: (context){
            return HomeScreen();

          }),
              (route) => false);
    });
  }
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        backgroundColor: Color(0xffE9EEFA),
        body: Center(
          child: Text("News",
          style: TextStyle(
            color: Color(0xff2D5BD0),
            fontSize: 64,
            fontWeight: FontWeight.bold
          ),
          ),
        ),
      ),
    );
  }
}
