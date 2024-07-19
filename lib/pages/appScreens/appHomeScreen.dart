import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/services.dart';
import '../login pages/LoginScreen.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('Home')),
        leading: IconButton(
          icon: Icon(Icons.navigate_before),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                _showRedirectDialog(context);
              },
              child: CircleAvatar(
                backgroundImage: AssetImage('assets/images/baymaxx.png'),
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Today',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              Text('Hi, Cruzemortal'),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                      child: _buildRiskCardw('Steps', '9032', Colors.pink)),
                  SizedBox(width: 16),
                  Expanded(child: _buildRiskCardb(
                      'Distance', '2.7 km', Colors.white)),
                ],
              ),
              SizedBox(height: 16),
              _buildHeartRateCard(),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildInfoCardw(
                      'Calories', '2653 kcal', Colors.pink,
                      Icons.local_fire_department)),
                  SizedBox(width: 16),
                  Expanded(child: _buildInfoCardw(
                      'Sleep', '7:43h', Colors.blue, Icons.bedtime)),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(child: _buildInfoCardb(
                      'Yoga', '5:30 h', Colors.white, Icons.self_improvement)),
                  SizedBox(width: 16),
                  Expanded(child: _buildInfoCardb(
                      'Fitness', '4:43 h', Colors.white, Icons.fitness_center)),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

  //white
  Widget _buildRiskCardw(String title, String value, Color color) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.pink, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(Icons.directions_walk, color: Colors.white),
            Text(title, style: TextStyle(color: Colors.white)),
            Text(value, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  //black
  Widget _buildRiskCardb(String title, String value, Color color) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.pink, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Icon(Icons.directions_walk, color: Colors.black),
            Text(title, style: TextStyle(color: Colors.black)),
            Text(value, style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildHeartRateCard() {
    return Card(
      color: Color.fromARGB(255, 255, 216, 238), // Light grey background color
      child: Padding(
        padding: const EdgeInsets.all(14.0),
        child: Center( // Center the content within the card
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center, // Center the content of the column
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Center the row content
                children: const [
                  Icon(Icons.favorite, color: Colors.pink),
                  SizedBox(width: 5),
                  Text('Heart Rate', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                ],
              ),
              const SizedBox(height: 5), // Add spacing between the elements
              const Text('82 bpm', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCardw(String title, String value, Color color, IconData icon) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.pink, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(icon, color: Colors.white),
            Text(title, style: TextStyle(color: Colors.white)),
            Text(value, style: TextStyle(color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoCardb(String title, String value, Color color, IconData icon) {
    return Card(
      color: color,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.pink, width: 2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Icon(icon, color: Colors.pink),
            Text(title, style: TextStyle(color: Colors.black)),
            Text(value, style: TextStyle(color: Colors.black, fontSize: 24, fontWeight: FontWeight.bold)),
          ],
        ),
      ),
    );
  }

  void _showExitDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Quit App'),
          content: Text('Do you want to quit the app?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                // Force quit the app
                Navigator.of(context).pop();
                Future.delayed(Duration.zero, () => SystemNavigator.pop());
              },
              child: Text('Quit'),
            ),
          ],
        );
      },
    );
  }

  void _showRedirectDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Do you want to Logout?'),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LoginScreen()),
                );
              },
              child: Text('Proceed'),
            ),
          ],
        );
      },
    );
  }

