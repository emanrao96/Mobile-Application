import 'package:flutter/material.dart';



class Task10 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ImageExample(),
    );
  }
}

class ImageExample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Assets & Network Image"),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            SizedBox(height: 20),

            // ✅ Asset Image
            Text("Asset Image"),
            Image.asset(
              'assets/images/myimage.jpg',
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 30),

            // ✅ Network Image
            Text("Network Image"),
            Image.network(
              'https://picsum.photos/300/200',
              width: 250,
              height: 200,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}