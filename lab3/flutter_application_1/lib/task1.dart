import 'package:flutter/material.dart';


class Task1 extends StatelessWidget {
  const Task1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Custom Cards & Icons"),
          centerTitle: true,
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

              // 🔹 Card 1 (Row Layout)
              Card(
                color: Colors.lightBlue[100],
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.home, size: 30, color: Colors.blue),
                      Icon(Icons.favorite, size: 40, color: Colors.red),
                      Icon(Icons.star, size: 50, color: Colors.amber),
                    ],
                  ),
                ),
              ),

              // 🔹 Card 2 (Column Layout)
              Card(
                color: Colors.green[100],
                elevation: 8,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(Icons.person, size: 35, color: Colors.green),
                      SizedBox(height: 10),
                      Icon(Icons.settings, size: 45, color: Colors.black),
                      SizedBox(height: 10),
                      Icon(Icons.email, size: 30, color: Colors.orange),
                    ],
                  ),
                ),
              ),

              // 🔹 Card 3 (Row Layout with Higher Elevation)
              Card(
                color: Colors.purple[100],
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: const [
                      Icon(Icons.phone, size: 40, color: Colors.purple),
                      Icon(Icons.camera_alt, size: 50, color: Colors.deepPurple),
                      Icon(Icons.map, size: 35, color: Colors.indigo),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}