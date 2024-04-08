import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wat_monitor/AuthenticationService.dart';
import 'package:provider/provider.dart';
import 'package:wat_monitor/screens/Homepage.dart';

class Add extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<Add> {
  final email = TextEditingController();
  final password = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/bg.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.5,
              // child: Image.asset("assets/images/logo.png"),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "Add Station Detail",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: MediaQuery.of(context).size.width * 0.05,
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
                  hintText: "User ID",
                ),
                controller: email,
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(
                horizontal: 60,
                vertical: 10,
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Station code",
                ),
                controller: password,
                obscureText: true,
              ),
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
                  Navigator.pop(context,
                      MaterialPageRoute(builder: (context) => Homepage()));
                },
                child: Text(
                  "Add",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
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
