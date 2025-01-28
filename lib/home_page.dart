import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[200],
        title: const Text('Home'),
      ),
      body: const Center(
        child: Text(
          "This is our home page",
          style: TextStyle(fontSize: 35, color: Colors.black),
        ),
      ),
    );
  }
}
