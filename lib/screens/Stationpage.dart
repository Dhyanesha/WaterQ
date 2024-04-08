import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wat_monitor/NotificationPlugin.dart';
import 'package:wat_monitor/screens/Homepage.dart';

class StationPage extends StatefulWidget {
  @override
  _StationPageState createState() => _StationPageState();
}

class _StationPageState extends State<StationPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bar name"),
          backgroundColor: Color(0xff08517C),
        ),
        body: Container(
          child: info(),
        ),
      ),
    );
  }
}

class info extends StatefulWidget {
  @override
  _infoState createState() => _infoState();
}

class _infoState extends State<info> {
  List<Map<dynamic, dynamic>> lists = [];
  String tdsValue = "0.00";
  String hLevel = "0.00";
  String quality = " - ";
  double a = 0.0;

  getTDSValue() async {
    setState(() {
      tdsValue = "loading...";
      hLevel = "loading...";
      quality = "loading...";
    });
    final ref = FirebaseDatabase.instance.ref();
    final snapshot = await ref.child('tds/tds1').get();
    if (snapshot.exists) {
      setState(() {
        tdsValue = snapshot.value.toString();
        a = (double.parse(tdsValue) / 2);
        hLevel = a.toString();
      });
    } else {
      print('No data available.');
    }
    if ((a * 2) >= 150 && (a * 2) <= 250) {
      setState(() {
        quality = " Good";
      });
    } else {
      setState(() {
        quality = "Bad ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Card(
        child: Container(
          width: double.infinity,
          padding: EdgeInsets.all(20),
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/bg.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                width: MediaQuery.of(context).size.width * 0.7,
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(
                      color: Color(0xff08517C),
                      width: 1.0,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        offset: const Offset(
                          5.0,
                          5.0,
                        ),
                        blurRadius: 10.0,
                        spreadRadius: 1.0,
                      )
                    ]),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Text(
                        "TDS Value",
                        style: TextStyle(
                          color: Color(0xff08517C),
                          fontWeight: FontWeight.w900,
                          fontSize: MediaQuery.of(context).size.width * 0.05,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.all(8),
                      child: Text(
                        tdsValue,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontSize: MediaQuery.of(context).size.width * 0.09,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xff08517C),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          )
                        ]),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Text(
                            "Quality",
                            style: TextStyle(
                              color: Color(0xff08517C),
                              fontWeight: FontWeight.w900,
                              fontSize:
                              MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Text(
                            // getQuality(double.parse(tdsValue)),
                            quality,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize:
                              MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(20),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Color(0xff08517C),
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(20),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black12,
                            offset: const Offset(
                              5.0,
                              5.0,
                            ),
                            blurRadius: 10.0,
                            spreadRadius: 1.0,
                          )
                        ]),
                    child: Column(
                      children: [
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Text(
                            "Hardness",
                            style: TextStyle(
                              color: Color(0xff08517C),
                              fontWeight: FontWeight.w900,
                              fontSize:
                              MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.all(8),
                          child: Text(
                            hLevel,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontSize:
                              MediaQuery.of(context).size.width * 0.05,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Waterdata("6500 ", "4 "),
              GestureDetector(
                onTap: getTDSValue,
                child: Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      color: Color(0xff08517C),
                      borderRadius: BorderRadius.circular(10)),
                  child: Text(
                    "Fetch value",
                    style: GoogleFonts.aBeeZee(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 24),
                  ),
                ),
              ),
            ],
          ),
        ),
        // Text("Flowrate: " + lists[index]["Flowrate"].toString()),
        // Text("Quality: "+ lists[index]["Quality"].toString()),
        // Text("WaterRecieved: " +lists[index]["WaterRecieved"].toString()),
      ),
    );
  }

  String getQuality(double quality) {
    if (quality > 150 && quality < 250) {
      return "Good";
    } else {
      return "Bad";
    }
  }
}

class Waterdata extends StatelessWidget {
  final recieved;
  final rate;

  Waterdata(this.recieved, this.rate);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xff08517C),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                )
              ]),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "Water Recieved",
                  style: TextStyle(
                    color: Color(0xff08517C),
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  recieved.toString() + " Litres",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: MediaQuery.of(context).size.width * 0.7,
          margin: EdgeInsets.all(10),
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: Color(0xff08517C),
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  offset: const Offset(
                    5.0,
                    5.0,
                  ),
                  blurRadius: 10.0,
                  spreadRadius: 1.0,
                )
              ]),
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  "Turbidity Level",
                  style: TextStyle(
                    color: Color(0xff08517C),
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.all(8),
                child: Text(
                  rate.toString() + " NTU",
                  style: TextStyle(
                    fontWeight: FontWeight.w900,
                    fontSize: MediaQuery.of(context).size.width * 0.05,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}