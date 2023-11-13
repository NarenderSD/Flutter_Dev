import 'dart:async';
import 'package:flutter/material.dart';
import 'login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Simulate a delay with Future.delayed
    Timer(
      Duration(seconds: 3), // Adjust the duration as needed
          () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => MyPhone()),
        );
      },
    );

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('assets/logo.png', height: 100, width: 100),

          ],
        ),
      ),
    );
  }
}
