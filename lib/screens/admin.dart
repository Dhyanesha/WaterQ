import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wat_monitor/screens/Homepage.dart';
import 'package:wat_monitor/screens/admin2.dart';

class Admin extends StatefulWidget {
  const Admin({Key? key}) : super(key: key);

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {

  final userID = TextEditingController();
  final StationCode = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Admin Page"),
        backgroundColor: Color(0xff08517C),
        actions: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(
                context,
                MaterialPageRoute(
                  builder: (context) => Homepage(),
                ),
              );
            },
          ),
        ],
      ),
      backgroundColor: Colors.blue.shade200,
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'ADMIN',
              style: TextStyle(
                  fontSize: 50
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter user ID",
                ),
                controller: userID,
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Enter Station Code",
                ),
                  controller: StationCode,
                style: TextStyle(
                    color: Colors.black
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff00628E),
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.all(5.0),
                    onPressed: () {
                      // Display toast message using ScaffoldMessenger
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("Permission Granted to ${userID.text}"),
                          duration: Duration(seconds: 2), // Adjust duration as needed
                        ),
                      );
                    },
                    child: Text(
                      "Grant Permission",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 25,
                ),
                Container(
                  margin: EdgeInsets.symmetric(
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xff00628E),
                  ),
                  child: MaterialButton(
                    padding: EdgeInsets.all(5.0),
                    onPressed: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text("${userID.text} has been Removed"),
                          duration: Duration(seconds: 2), // Adjust duration as needed
                        ),
                      );// Call the remove function
                    },
                    child: Text(
                      "Remove",
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        fontSize: MediaQuery.of(context).size.width * 0.05,
                      ),
                    ),
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Colors.white70
                  ),

                ),
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child:Icon(Icons.delete),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => AdminPage(),
              ),
            );
          },
        ),
    );
  }
}
