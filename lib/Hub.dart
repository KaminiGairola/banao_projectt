import 'package:flutter/material.dart';

class Hub extends StatelessWidget {
  const Hub({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello, This is my hub page", style: TextStyle(fontSize: 20, color: Colors.black),)
      ),
    );
  }
}

