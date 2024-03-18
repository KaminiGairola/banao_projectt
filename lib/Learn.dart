import 'package:flutter/material.dart';

class Learn extends StatelessWidget {
  const Learn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hello, This is my learn page", style: TextStyle(fontSize: 20, color: Colors.black),),
      ),
    );
  }
}

