import 'package:flutter/material.dart';


// Created using stless shortcut
class Task1 extends StatelessWidget {
  const Task1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeContainerScreen(),
    );
  }
}

class SafeContainerScreen extends StatelessWidget {
  const SafeContainerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      // ✅ Scaffold Background Color
      backgroundColor: Colors.blueGrey,

      // ✅ SafeArea wraps the body
      body: SafeArea(
        child: Center(
          child: Container(
            
            // ✅ Width & Height
            width: 250,
            height: 250,

            // ✅ Margin (outside space)
            margin: EdgeInsets.all(25.0),

            // ✅ Padding (inside space - top & bottom only)
            padding: EdgeInsets.symmetric(vertical: 15.0),

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
            ),

            child: Center(
              child: Text(
                "Safe Container",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}