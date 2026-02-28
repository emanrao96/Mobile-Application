import 'package:flutter/material.dart';



class Task4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ContactScreen(),
    );
  }
}

class ContactScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contact Cards"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [

            // 🔹 First Version
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: Colors.blue,
                  child: Icon(Icons.person, color: Colors.white),
                ),
                title: Text("Eman Tariq"),
                subtitle: Text("Registration No: 12345"),
              ),
            ),

            SizedBox(height: 20),

            // 🔹 Second Version (Different Color + Trailing Icon)
            Card(
              color: Colors.teal.shade50,
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              child: ListTile(
                leading: Icon(Icons.school, color: Colors.teal, size: 35),
                title: Text(
                  "Ali Khan",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Text("Registration No: 67890"),
                trailing: Icon(Icons.arrow_forward_ios, color: Colors.teal),
              ),
            ),
          ],
        ),
      ),
    );
  }
}