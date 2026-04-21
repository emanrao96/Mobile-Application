import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'dart:math';

void main() {
  runApp(Task2());
}

class Task2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Lab7Screen(),
    );
  }
}

class Lab7Screen extends StatefulWidget {
  @override
  _Lab7ScreenState createState() => _Lab7ScreenState();
}

class _Lab7ScreenState extends State<Lab7Screen> {

  // 🔹 Phase 1 Variables
  Color boxColor = Colors.blue;
  double borderRadius = 0;

  // 🔹 Phase 2 Variable
  double value = 50;

  // 🔹 Phase 3 Variables (RGB + Size)
  double red = 100;
  double green = 100;
  double blue = 100;
  double boxSize = 150;

  // 🎲 Random Color Generator
  Color getRandomColor() {
    final random = Random();
    return Color.fromRGBO(
      random.nextInt(256),
      random.nextInt(256),
      random.nextInt(256),
      1,
    );
  }

  // 🎨 Convert RGB to HEX
  String getHex() {
    return '#'
        '${red.toInt().toRadixString(16).padLeft(2, '0')}'
        '${green.toInt().toRadixString(16).padLeft(2, '0')}'
        '${blue.toInt().toRadixString(16).padLeft(2, '0')}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lab 7: Gestures & Sliders")),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [

            // =========================
            // ✅ PHASE 1: GestureDetector
            // =========================
            Text("Phase 1: GestureDetector", style: TextStyle(fontSize: 18)),

            GestureDetector(
              onTap: () {
                setState(() {
                  boxColor = getRandomColor();
                });
              },

              onDoubleTap: () {
                setState(() {
                  borderRadius = borderRadius == 0 ? 100 : 0;
                });
              },

              onLongPress: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Resetting...")),
                );

                setState(() {
                  boxColor = Colors.blue;
                  borderRadius = 0;
                });
              },

              child: Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  color: boxColor,
                  borderRadius: BorderRadius.circular(borderRadius),
                ),
              ),
            ),

            SizedBox(height: 30),

            // =========================
            // ✅ PHASE 2: Sliders
            // =========================
            Text("Phase 2: Sliders", style: TextStyle(fontSize: 18)),

            Text("Value: ${value.toInt()}"),

            Slider(
              min: 0,
              max: 100,
              divisions: 10,
              value: value,
              label: value.toString(),

              onChanged: (val) {
                setState(() {
                  value = val;
                });
              },
            ),

            // 🍎 Cupertino Slider
            CupertinoSlider(
              min: 0,
              max: 100,
              value: value,
              onChanged: (val) {
                setState(() {
                  value = val;
                });
              },
            ),

            SizedBox(height: 30),

            // =========================
            // ✅ PHASE 3: RGB MIXER
            // =========================
            Text("Phase 3: Mood & Color Mixer", style: TextStyle(fontSize: 18)),

            SizedBox(height: 10),

            // 🎨 Preview Box with Gesture
            GestureDetector(
              onLongPress: () {
                print("HEX: ${getHex()}");
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Copied HEX: ${getHex()}")),
                );
              },

              onHorizontalDragUpdate: (details) {
                setState(() {
                  boxSize += details.delta.dx;
                  boxSize = boxSize.clamp(50, 300);
                });
              },

              child: Container(
                width: boxSize,
                height: boxSize,
                color: Color.fromRGBO(
                  red.toInt(),
                  green.toInt(),
                  blue.toInt(),
                  1,
                ),
              ),
            ),

            SizedBox(height: 20),

            Text("HEX: ${getHex()}"),

            // 🔴 RED
            Text("Red: ${red.toInt()}"),
            Slider(
              min: 0,
              max: 255,
              value: red,
              onChanged: (val) {
                setState(() {
                  red = val;
                });
              },
            ),

            // 🟢 GREEN
            Text("Green: ${green.toInt()}"),
            Slider(
              min: 0,
              max: 255,
              value: green,
              onChanged: (val) {
                setState(() {
                  green = val;
                });
              },
            ),

            // 🔵 BLUE
            Text("Blue: ${blue.toInt()}"),
            Slider(
              min: 0,
              max: 255,
              value: blue,
              onChanged: (val) {
                setState(() {
                  blue = val;
                });
              },
            ),
          ],
        ),
      ),
    );
  }
}