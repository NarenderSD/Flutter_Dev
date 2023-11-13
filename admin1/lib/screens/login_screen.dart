import 'package:admin1/screens/product_management_screen.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'category_screen.dart';
import 'dashboard_screen.dart';

void main() {
  runApp(
    MaterialApp(
      home: LoginScreen(),
      debugShowCheckedModeBanner: false,
    ),
  );
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController _usernameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  String _loggedInUsername = '';
  String _loggedInEmail = '';

  @override
  void initState() {
    super.initState();
    _loadLoggedInUser();
  }

  void _loadLoggedInUser() async {
    final prefs = await SharedPreferences.getInstance();
    final username = prefs.getString('username');
    final email = prefs.getString('email');
    if (username != null) {
      setState(() {
        _loggedInUsername = username;
        _loggedInEmail = email ?? '';
      });
    }
  }

  void _login() async {
    final username = _usernameController.text;
    final email = _emailController.text;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', username);
    await prefs.setString('email', email);
    setState(() {
      _loggedInUsername = username;
      _loggedInEmail = email;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: [
          // Background Image
          Image.asset(
            'assets/background12.jpg',
            fit: BoxFit.cover,
            width: double.infinity,
            height: double.infinity,
          ),

          // Login Form
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Logo Image
                Image.asset(
                  'assets/logo.png',
                  width: 150,
                  height: 150,
                ),

                // Welcome Message
                Text(
                  'Namaste, $_loggedInUsername',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.green, // Green text color
                  ),
                ),

                // Username Input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: TextField(
                    controller: _usernameController,
                    style: TextStyle(color: Colors.green), // Green text color
                    decoration: InputDecoration(
                      labelText: 'Username',
                      labelStyle: TextStyle(
                        color: Colors.green, // Green text color
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // White background
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // White background
                      ),
                    ),
                  ),
                ),

                // Email Input
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
                  child: TextField(
                    controller: _emailController,
                    style: TextStyle(color: Colors.green), // Green text color
                    decoration: InputDecoration(
                      labelText: 'Email',
                      labelStyle: TextStyle(
                        color: Colors.green, // Green text color
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // White background
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.white), // White background
                      ),
                    ),
                  ),
                ),

                // Login Button
                ElevatedButton(
                  onPressed: () {
                    _login();
                    Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => CategoryScreen(
                        // username: _loggedInUsername,
                        // email: _loggedInEmail,
                      ),
                    ));
                  },
                  child: Text('Login'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
