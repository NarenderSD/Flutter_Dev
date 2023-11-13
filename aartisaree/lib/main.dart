
import 'package:aartisaree/splash.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'category_page.dart';
import 'home_page.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {

  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
        useMaterial3: true,
      ),

      home:Splash()

    );
  }
}
class MyLoginPage extends StatefulWidget {
  @override
  _MyLoginPageState createState() => _MyLoginPageState();
}

class _MyLoginPageState extends State<MyLoginPage> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final mobileNumberController = TextEditingController();
  final password_controller = TextEditingController();



  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    mobileNumberController.dispose();
    password_controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
                    obscureText: true,
                    controller: password_controller,
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
                  final SharedPreferences prefs = await SharedPreferences.getInstance();

                  String username = mobileNumberController.text;
                  String password = password_controller.text;

                  if (username != '' && password != '') {
                    print('Successfull');
                    prefs.setBool('login', false);

                   prefs.setString('username', username);

                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
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
              height: 150,
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


