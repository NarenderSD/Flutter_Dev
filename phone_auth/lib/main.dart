import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'phone_entry_screen.dart'; // Import your PhoneEntryScreen file

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Your App Title',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PhoneEntryScreen(), // Set the home to PhoneEntryScreen
    );
  }
}
