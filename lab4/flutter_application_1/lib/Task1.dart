import 'package:flutter/material.dart';



class Task1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfileDashboard(),
    );
  }
}

//task6

class ProfileDashboard extends StatefulWidget {
  @override
  _ProfileDashboardState createState() => _ProfileDashboardState();
}

class _ProfileDashboardState extends State<ProfileDashboard> {

  bool isFollowed = false;
  int score = 0;

  @override
  Widget build(BuildContext context) {
    //Task1
    return Scaffold(
      appBar: AppBar(
        title: Text("Profile Dashboard"),
      ),

      body: SafeArea(
        //Task3
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [

           //Task2
            /// Header Section
            Container(
              margin: EdgeInsets.all(20.0),
              child: Column(
                children: [

                  /// Circle Avatar
                  CircleAvatar(
                    radius: 50,
                    backgroundImage: NetworkImage(
                        "https://i.pravatar.cc/300"),
                  ),

                  SizedBox(height: 10),

                  /// Name
                  Text(
                    "Eman Tariq",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 5),

                  /// Title
                  Text(
                    "Mobile App Developer",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ),
            ),
            
            //Task4
            /// Row with Expanded (2:1 ratio)
            Row(
              children: [

                Expanded(
                  flex: 2,
                  child: Container(
                    height: 100,
                    color: Colors.blue,
                    child: Center(
                      child: Text(
                        "Section A",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),

                //Task5

                SizedBox(width: 10),

                Expanded(
                  flex: 1,
                  child: Container(
                    height: 100,
                    color: Colors.green,
                    child: Center(
                      child: Text(
                        "Section B",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),

            /// Follow Button
            ElevatedButton(
              onPressed: () {
                //task7
                setState(() {
                  isFollowed = !isFollowed;
                });
              },
              child: Text(
                isFollowed ? "Following" : "Follow",
              ),
            ),

            SizedBox(height: 10),

            /// Like Button
            IconButton(
              icon: Icon(Icons.thumb_up),
              iconSize: 30,
              onPressed: () {
                setState(() {
                  score++;
                });
              },
            ),

            SizedBox(height: 20),

            //Task8
            /// Card with ListTile (Statistics)
            Card(
              elevation: 5,
              margin: EdgeInsets.all(15),
              child: ListTile(
                leading: Icon(Icons.favorite, color: Colors.red),
                title: Text("Likes"),
                subtitle: Text("Total Score"),
                trailing: Text(
                  score.toString(),
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}