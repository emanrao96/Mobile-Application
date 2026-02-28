import 'package:flutter/material.dart';


class Task2 extends StatelessWidget {
  const Task2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Margin & Padding Demo"),
          centerTitle: true,
        ),
        body: Container(
          margin: const EdgeInsets.symmetric(
            vertical: 50.0,
            horizontal: 10.0,
          ), // 🔹 External Space (Margin)

          padding: const EdgeInsets.all(20.0), 
          // 🔹 Internal Space (Padding)

          decoration: BoxDecoration(
            color: Colors.blueAccent,
            borderRadius: BorderRadius.circular(12),
          ),

          child: Container(
            margin: const EdgeInsets.only(left: 10), 
            // 🔹 Space only on LEFT side

            color: Colors.white,
            padding: const EdgeInsets.all(10),
            child: const Text(
              "This Container shows:\n\n"
              "• Padding: Space inside (20)\n"
              "• Margin Symmetric: Vertical 50, Horizontal 10\n"
              "• Margin Only Left: 10",
              style: TextStyle(fontSize: 16),
            ),
          ),
        ),
      ),
    );
  }
}