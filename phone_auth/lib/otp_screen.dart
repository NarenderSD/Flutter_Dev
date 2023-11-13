import 'package:flutter/material.dart';
import 'package:phone_auth/phone_auth.dart';
import 'home_screen.dart';

class OTPScreen extends StatelessWidget {
  final String phoneNumber;

  OTPScreen(this.phoneNumber);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('OTP Verification')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            bool verified = (await PhoneAuth.signInWithPhoneNumber(context)) as bool;
            if (verified) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomeScreen()),
              );
            } else {
              // Show error popup
              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  title: Text('Error'),
                  content: Text('Incorrect OTP. Please try again.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('OK'),
                    ),
                  ],
                ),
              );
            }
          },
          child: Text('Verify OTP for $phoneNumber'),
        ),
      ),
    );
  }
}
