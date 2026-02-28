import 'package:flutter/material.dart';


// Created using stless shortcut
class Task4 extends StatelessWidget {
  const Task4({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: StatusPanelScreen(),
    );
  }
}

class StatusPanelScreen extends StatelessWidget {
  const StatusPanelScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start, // ✅ Parent Column starts from top
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

            // ✅ Child 1: Blue Header
            Container(
              height: 100,
              width: double.infinity,
              color: Colors.blue,
              child: const Center(
                child: Text(
                  "Status Panel Header",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            // ✅ Exact 20px vertical spacing
            const SizedBox(height: 20),

            // ✅ Child 2: Row with two action boxes
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween, // Push to far ends
              children: [

                // 🔴 Red Box (Left)
                Container(
                  height: 60,
                  width: 100,
                  color: Colors.red,
                  child: const Center(
                    child: Text(
                      "Action 1",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),

                // 🟢 Green Box (Right)
                Container(
                  height: 60,
                  width: 100,
                  color: Colors.green,
                  child: const Center(
                    child: Text(
                      "Action 2",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}