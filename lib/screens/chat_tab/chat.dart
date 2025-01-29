// import 'package:chatapp/widgets/chat_messages.dart';
// import 'package:chatapp/widgets/new_messages.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hyper_car_showcase/widgets/chat_messages.dart';
import 'package:hyper_car_showcase/widgets/new_messages.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  void _logout() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          colors: [Colors.white, Colors.black],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        )),
        child: Column(
          children: [
            Expanded(
              child: ChatMessages(),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 20),
              child: NewMessages(),
            ),
          ],
        ),
      ),
    );
  }
}
