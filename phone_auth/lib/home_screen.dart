import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('E-Commerce Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Welcome to Our E-Commerce App!',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Add logic for navigating to product listing or details page
                // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => ProductListingScreen()));
              },
              child: Text('Explore Products'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add logic for navigating to user profile or account page
                // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => UserProfileScreen()));
              },
              child: Text('My Account'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: () {
                // Add logic for signing out and navigating to the authentication screen
                // Example: FirebaseAuth.instance.signOut(); Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => AuthenticationScreen()));
              },
              child: Text('Sign Out'),
            ),
          ],
        ),
      ),
    );
  }
}
