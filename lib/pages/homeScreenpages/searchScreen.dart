import 'package:chat_app/pages/homeScreenpages/resultScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Searchscreen extends StatefulWidget {
  @override
  _WelcomeclickState createState() => _WelcomeclickState();
}

class _WelcomeclickState extends State<Searchscreen> {

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final width = size.width;
    final height = size.height;

    return Scaffold(
      backgroundColor: Color(0xFFE91E63),
      appBar: AppBar(
        backgroundColor: Color(0xFFE91E63),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.navigate_before,color:Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.close, color: Colors.white),
            onPressed: () {
              _showExitDialog(context);
            },
          ),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(width * 0.05),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Welcome',
                          style: TextStyle(fontSize: width * 0.06, color: Colors.white),
                        ),
                        Text(
                          'Cruzemortal',
                          style: TextStyle(
                              fontSize: width * 0.08,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'I am Baymax,',
                          style: TextStyle(fontSize: width * 0.045, color: Colors.white),
                        ),
                        Text(
                          'Your health care companion',
                          style: TextStyle(fontSize: width * 0.045, color: Colors.white),
                        ),
                        SizedBox(height: height * 0.02),
                        Text(
                          'In order for me to assist you\nplease let me know your details below...',
                          style: TextStyle(fontSize: width * 0.04, color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Image.asset(
                    'assets/images/baymax.png',
                    width: width * 0.3,
                    height: width * 0.3,
                  ),
                ],
              ),
              SizedBox(height: height * 0.02),
              LinearProgressIndicator(
                value: 0.8,
                backgroundColor: Colors.white.withOpacity(0.3),
                valueColor: const AlwaysStoppedAnimation<Color>(Colors.white),
              ),
              Expanded(
                child: Center(
                  child: Container(

                    width: width * 0.8,
                    height: height * 0.5,
                    padding: EdgeInsets.all(width * 0.02),
                    decoration: BoxDecoration(
                      color: Color(0xFF3F51B5),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(width * 0.04),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'STEP 4/5',
                              style: TextStyle(color: Colors.white, fontSize: width * 0.045),
                            ),
                          ),
                          SizedBox(height: 10),
                          const Text(
                            'Does you have any existing medications?',
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                          SizedBox(height: 30),

                          Container(
                            height: 40,
                            width: 300,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: const TextField(
                              decoration: InputDecoration(
                                hintText: 'Quick Search',
                                border: InputBorder.none,
                                prefixIcon: Icon(Icons.search),
                                contentPadding: EdgeInsets.all(10),
                              ),
                            ),
                          ),
                          Spacer(),
                          Row(
                            children: [
                              ElevatedButton(
                                child: Text(
                                  'Examin Later',
                                  style: TextStyle(color: Colors.white,fontSize: 11),
                                ),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                ),
                                onPressed: () {},
                              ),
                              SizedBox(width: 10),
                              Expanded(
                                child: ElevatedButton(
                                  child: Text('Continue'),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(color: Colors.white),
                                    ),
                                  ),
                                  onPressed: () {

                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(builder: (context) =>  Resultscreen()),
                                    );

                                  },
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
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
