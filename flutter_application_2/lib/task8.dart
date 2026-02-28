import 'package:flutter/material.dart';



class Task8 extends StatelessWidget {
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
        title: Text("Assets & Network Image Example"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            // ✅ Asset Image
            Image.asset(
              'assets/images/myimage.jpg',
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),

            SizedBox(height: 20),

            Text("This is Asset Image"),
          ],
        ),
      ),
    );
  }
}