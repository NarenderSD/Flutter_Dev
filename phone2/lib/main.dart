

import 'package:flutter/material.dart';
import 'package:phone2/home.dart';
import 'package:phone2/phone.dart';
import 'package:phone2/verify.dart';


void main() {
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'verify': (context) => MyVerify(),
      'home' : (context) => HomeScreen()
    },
  ));
}
