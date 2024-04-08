import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:wat_monitor/screens/Homepage.dart';
import 'package:wat_monitor/screens/admin.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final email = TextEditingController();
  final password = TextEditingController();
  bool _obscureText = true;

  // Function to handle sign in button press
  void _signIn(BuildContext context) {
    String enteredEmail = email.text.trim();
    String enteredPass = password.text.trim();

    // Check email and navigate accordingly
    if (enteredEmail == "User@123" && enteredPass == "123456") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
    } else if (enteredEmail == "Admin@123" && enteredPass == "123456") {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Admin()));
    } else {
      Fluttertoast.showToast(
        msg: "Error",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

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
              child: Image.asset("assets/images/logo.png"),
            ),
            Container(
              padding: EdgeInsets.all(10),
              child: Text(
                "SIGN IN TO CONTINUE",
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
                  hintText: "Your Email-id here",
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
                  hintText: "Password",
                  suffixIcon: IconButton(
                    icon: Icon(_obscureText ? Icons.visibility : Icons.visibility_off),
                    onPressed: () {
                      setState(() {
                        _obscureText = !_obscureText;
                      });
                    },
                  ),
                ),
                controller: password,
                obscureText: _obscureText,
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
                  _signIn(context); // Call the sign in function
                },
                child: Text(
                  "Sign In",
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
