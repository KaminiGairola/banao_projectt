import 'package:flutter/material.dart';
class Profile extends StatelessWidget {
  const Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello, This is my portfolio page", style: TextStyle(fontSize: 20, color: Colors.black),),
      ),
    );
  }
}
