
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:phone5/home.dart';
import 'package:phone5/otp.dart';
import 'package:phone5/phone.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    initialRoute: 'phone',
    debugShowCheckedModeBanner: false,
    routes: {
      'phone': (context) => MyPhone(),
      'otp': (context) => MyOtp(),
      'home': (context) => MyHome()
    },
  ));
}







//
// import 'package:flutter/material.dart';
// import 'package:firebase_core/firebase_core.dart';
// import 'package:phone5/phone.dart';
// import 'package:phone5/verify.dart';
// import 'firebase_options.dart';
//
// void main() async {
//   await Firebase.initializeApp(
//     options: DefaultFirebaseOptions.currentPlatform,
//   );
//   runApp(MaterialApp(
//     initialRoute: 'phone',
//     debugShowCheckedModeBanner: false,
//     routes: {
//       'phone': (context) => MyPhone(),
//       'verify': (context) => MyVerify()
//     },
//   ));
// }