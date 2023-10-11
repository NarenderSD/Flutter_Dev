

import 'package:flutter/material.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({Key? key}) : super(key: key);

  @override
  _ChatPageState createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/wchat.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
    appBar: AppBar(
    // elevation: 0.0,
    title: Text("Narender"),
    backgroundColor: Color(0xFF128C7E),
    actions: [
    IconButton(
    onPressed: () {},
    icon: Icon(Icons.video_call),
    ),
    IconButton(
    onPressed: () {},
    icon: Icon(Icons.phone),
    ),
    IconButton(
    onPressed: () {},
    icon: Icon(Icons.more_vert),
    ),
    ],
    ),
    );
  }
}