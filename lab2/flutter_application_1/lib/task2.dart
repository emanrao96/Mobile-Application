import 'package:flutter/material.dart';



// Created using stless shortcut
class Task2 extends StatelessWidget {
  const Task2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: VerticalAxisScreen(),
    );
  }
}

class VerticalAxisScreen extends StatelessWidget {
  const VerticalAxisScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      body: Container(
        width: double.infinity, // ✅ Full width
        
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly, // ✅ Even vertical spacing
          crossAxisAlignment: CrossAxisAlignment.end, // ✅ Push icons to right

          children: const [

            Icon(
              Icons.favorite,
              size: 40,
              color: Colors.red,
            ),

            // ✅ Custom manual spacing (Challenge)
            SizedBox(height: 60.0),

            Icon(
              Icons.thumb_up,
              size: 40,
              color: Colors.blue,
            ),

            Icon(
              Icons.share,
              size: 40,
              color: Colors.green,
            ),
          ],
        ),
      ),
    );
  }
}