import 'package:flutter/material.dart';



// Created using stless shortcut
class Task3 extends StatelessWidget {
  const Task3({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HorizontalAxisScreen(),
    );
  }
}

class HorizontalAxisScreen extends StatelessWidget {
  const HorizontalAxisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,

      body: Container(
        height: 200, // Important for CrossAxisAlignment.stretch
        color: Colors.white,

        child: Row(
          mainAxisAlignment: MainAxisAlignment.center, // ✅ Center horizontally
          crossAxisAlignment: CrossAxisAlignment.stretch, // ✅ Stretch vertically

          children: const [

            Icon(
              Icons.volume_up,
              size: 40,
              color: Colors.red,
            ),

            Icon(
              Icons.bluetooth,
              size: 40,
              color: Colors.blue,
            ),

            Icon(
              Icons.wifi,
              size: 40,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}