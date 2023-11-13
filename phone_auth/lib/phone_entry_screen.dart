import 'package:flutter/material.dart';
import 'otp_screen.dart';
import 'phone_auth.dart'; // Import the PhoneAuth class

class PhoneEntryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Phone Entry')),
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            String? phoneNumber = await PhoneAuth.signInWithPhoneNumber(context);
            if (phoneNumber != null) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OTPScreen(phoneNumber)),
              );
            }
          },
          child: Text('Send OTP'),
        ),
      ),
    );
  }
}
