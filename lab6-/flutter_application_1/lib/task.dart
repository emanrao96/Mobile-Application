import 'package:flutter/material.dart';

void main() {
  runApp(Task());
}

class Task extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Task> {
  bool isDark = false; // Theme state

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      // 🔁 THEME SWITCH (TERNARY OPERATOR)
      theme: isDark ? darkTheme : lightTheme,

      home: HomeScreen(
        isDark: isDark,
        toggleTheme: () {
          setState(() {
            isDark = !isDark;
          });
        },
      ),
    );
  }
}

class HomeScreen extends StatelessWidget {
  final bool isDark;
  final VoidCallback toggleTheme;

  HomeScreen({required this.isDark, required this.toggleTheme});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flutter Themes"),

        // 🔁 ICON BUTTON TOGGLE
        actions: [
          IconButton(
            icon: Icon(
              isDark ? Icons.light_mode : Icons.dark_mode,
            ),
            onPressed: toggleTheme,
          )
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [

            // 📝 PARAGRAPH TEXT (textTheme used)
            Text(
              "This is a sample paragraph demonstrating theme-based text styling.",
              style: Theme.of(context).textTheme.bodyLarge,
            ),

            SizedBox(height: 10),

            Text(
              "Flutter makes it very easy to apply consistent styling across your app using ThemeData.",
              style: Theme.of(context).textTheme.bodyMedium,
            ),

            SizedBox(height: 20),

            // 🃏 CARD WITH THEME
            Card(
              elevation: 5,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Text(
                  "This is a themed card",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
              ),
            ),

            SizedBox(height: 20),

            // 🔘 BUTTON WITH THEME
            ElevatedButton(
              onPressed: () {},
              child: Text("Themed Button"),
            ),
          ],
        ),
      ),
    );
  }
}


// 🌞 LIGHT THEME
final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.blue,
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 18, color: Colors.black),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.black87),
    titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.blue,
      foregroundColor: Colors.white,
    ),
  ),

  cardTheme: CardThemeData(
    color: Colors.white,
  ),
);


// 🌙 DARK THEME
final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,

  appBarTheme: AppBarTheme(
    backgroundColor: Colors.black,
  ),

  textTheme: TextTheme(
    bodyLarge: TextStyle(fontSize: 18, color: Colors.white),
    bodyMedium: TextStyle(fontSize: 16, color: Colors.white70),
    titleMedium: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
  ),

  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: Colors.grey[800],
      foregroundColor: Colors.white,
    ),
  ),

  cardTheme: CardThemeData(
    color: Colors.grey[900],
  ),
);