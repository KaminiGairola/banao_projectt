import 'package:flutter/material.dart';

class Chat extends StatelessWidget {
  const Chat({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello, This is my chat page", style: TextStyle(fontSize: 20, color: Colors.black),),
      ),
    );
  }
}

