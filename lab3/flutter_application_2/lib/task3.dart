import 'package:flutter/material.dart';



class Task3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileScreen(),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  final String networkImageUrl =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQhOaaBAY_yOcJXbL4jW0I_Y5sePbzagqN2aA&s";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile UI"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: CircleAvatar(
              radius: 18,
              backgroundImage: AssetImage("assets/images/profile.png"),
              onBackgroundImageError: (_, __) {},
              child: Text(
                "ET",
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
      body: Center(
        child: CircleAvatar(
          radius: 60,
          backgroundImage: NetworkImage(networkImageUrl),
          onBackgroundImageError: (_, __) {},
          child: Text(
            "ET",
            style: TextStyle(fontSize: 30, color: Colors.white),
          ),
        ),
      ),
    );
  }
}