import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'homescreen.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final mobileNumberController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // Check if the user is already logged in
    checkLoggedIn() async {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      String? mobileNumber = prefs.getString('mobileNumber');
      String? password = prefs.getString('password');

      if (mobileNumber != null && password != null) {
        // If credentials exist, navigate to HomeScreen
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    }

    // Call the function during the initialization of the widget
    checkLoggedIn();

    return Scaffold(
      body: Container(
        height: double.maxFinite,
        width: double.maxFinite,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.cover,
            image: AssetImage('assets/background.jpg'),
          ),
        ),
        child: ListView(
          children: [
            SizedBox(
              height: 40,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: Image.asset('assets/logo.png'),
              ),
            ),
            Spacer(),


            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: mobileNumberController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Mobile Number',
                      icon: Icon(Icons.phone_android),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.9),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10),
                  child: TextField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Enter Password',
                      icon: Icon(Icons.lock),
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: TextButton(
                onPressed: () async {

                  String mobileNumber = mobileNumberController.text;
                  String password = passwordController.text;

                  if (mobileNumber.isNotEmpty && password.isNotEmpty) {
                    // Save the credentials to SharedPreferences
                    SharedPreferences prefs = await SharedPreferences.getInstance();
                    await prefs.setString('mobileNumber', mobileNumber);
                    await prefs.setString('password', password);
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  } else {
                    Fluttertoast.showToast(
                      msg: "Please fill all details",
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.CENTER,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.red,
                      textColor: Colors.white,
                      fontSize: 16.0,
                    );
                  }
                },
                style: TextButton.styleFrom(
                  backgroundColor: Colors.red,
                  padding: EdgeInsets.all(15),
                  minimumSize: Size(200, 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Text(
                  'LOGIN',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(
              height: 10,
            ),
            const Center(
              child: Text(
                'OR',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 30),
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: Image.asset('assets/google.png'),
                      ),
                    ),
                    const Center(
                      child: Text(
                        'Continue with Google',
                        style: TextStyle(
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            SizedBox(
              height: 210,
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: Colors.red.withOpacity(0.9),
              ),
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Register',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}