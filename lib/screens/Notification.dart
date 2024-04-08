import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:wat_monitor/NotificationPlugin.dart';
import 'package:wat_monitor/screens/Homepage.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  void initState() {
    super.initState();
  }

  List<Map<dynamic, dynamic>> lists = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Summary"),
        backgroundColor: Color(0xff08517C),
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        padding: EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Stationcheck("Main Station 1"),
            Stationcheck("Sub Station 1"),
            Stationcheck("Sub Station 2"),
          ],
        ),
      ),
    );
  }

  // onNotificationInLowerVersions(ReceivedNotification receivedNotification) {
  //   print('Notification Received ${receivedNotification.id}');
  // }
  //
  // onNotificationClick(String payload) {
  //   print('Payload $payload');
  // }
}

class Stationcheck extends StatelessWidget {
  @override
  String station;
  List<Map<dynamic, dynamic>> lists = [];
  Stationcheck(this.station);

  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            Text(
              station,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: MediaQuery.of(context).size.width * 0.04,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text("Tds Level: " + " - ".toString()),
            Text("Turbidity level: " + " - ".toString()),
            Text("WaterRecieved: " + " - ".toString()),
            Text(
              " Good / Bad ",
              style: TextStyle(
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
