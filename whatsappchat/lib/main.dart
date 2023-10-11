import 'package:flutter/material.dart';
import 'package:whatsappchat/chatpage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: ChatPage(),
    routes: {
      'chat': (context) => ChatPage(),

    },
  ));
}