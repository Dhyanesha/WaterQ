import 'package:flutter/material.dart';

class RegistrationDetails {
  final String name;
  final String phoneNumber;
  final int numPeople;
  final String address;

  RegistrationDetails({
    required this.name,
    required this.phoneNumber,
    required this.numPeople,
    required this.address,
  });
}

void main() {
  runApp(AdminApp());
}

class AdminApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Page',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: AdminPage(),
    );
  }
}

class AdminPage extends StatefulWidget {
  @override
  _AdminPageState createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  List<RegistrationDetails> registrationList = [
    RegistrationDetails(name: 'John Doe', phoneNumber: '1234567890', numPeople: 3, address: '123 Main St'),
    RegistrationDetails(name: 'Jane Doe', phoneNumber: '0987654321', numPeople: 2, address: '456 Elm St'),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Page'),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue.withOpacity(0.2), Colors.white.withOpacity(0.6)],
          ),
        ),
        child: ListView.builder(
          itemCount: registrationList.length,
          itemBuilder: (context, index) {
            return Card(
              margin: EdgeInsets.all(8.0),
              elevation: 4.0,
              color: Colors.white70.withOpacity(0.8), // Adding opacity for a watercolor effect
              child: ListTile(
                title: Text(
                  registrationList[index].name,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Phone Number: ${registrationList[index].phoneNumber}'),
                    Text('Number of People: ${registrationList[index].numPeople}'),
                    Text('Address: ${registrationList[index].address}'),
                  ],
                ),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.check, color: Colors.green),
                      onPressed: () {
                        acceptUser(index);
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.close, color: Colors.red),
                      onPressed: () {
                        rejectUser(index);
                      },
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void acceptUser(int index) {
    print('Accepted user: ${registrationList[index].name}');
    setState(() {
      registrationList.removeAt(index);
    });
  }

  void rejectUser(int index) {
    print('Rejected user: ${registrationList[index].name}');
    setState(() {
      registrationList.removeAt(index);
    });
  }
}