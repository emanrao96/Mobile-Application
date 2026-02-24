import 'package:flutter/material.dart';

void main() {
  runApp(const MyFirstApp());
}


class MyFirstApp extends StatelessWidget {
  const MyFirstApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        appBar: AppBar(
          title: const Text('Flutter Lab-1'),
          backgroundColor: Colors.brown,
        ),
        body: Column(
          children : [
            Row(children: [
              SizedBox(width: 100),
              Text("Hi, Myself Eman Tariq")
            ],)
          ]
        ),
      ),
      
      
     
    );
  }
}
