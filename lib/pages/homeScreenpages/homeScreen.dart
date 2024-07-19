import 'package:chat_app/pages/homeScreenpages/weightScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  double _age = 50;
  double _height = 5.5;
  double _weight = 50;
  String _ethnicity = '';

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
          icon: Icon(Icons.navigate_before,color: Colors.white,),
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
                value: 0.2,
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
                      padding: EdgeInsets.all(width * 0.05),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'STEP 1/5',
                              style: TextStyle(color: Colors.white, fontSize: width * 0.045),
                            ),
                          ),
                          Text('What is your age?',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Expanded(
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: Colors.white,
                                    inactiveTrackColor: Colors.white.withOpacity(0.5),
                                    trackHeight: height * 0.01,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: width * 0.03),
                                    overlayShape: RoundSliderOverlayShape(
                                        overlayRadius: width * 0.06),
                                    thumbColor: Colors.pink,
                                    overlayColor: Colors.pink.withOpacity(0.2),
                                    valueIndicatorTextStyle:
                                    TextStyle(color: Colors.white),
                                  ),
                                  child: Slider(
                                    value: _age,
                                    min: 1,
                                    max: 150,
                                    divisions: 99,
                                    label: _age.round().toString(),
                                    onChanged: (value) {
                                      setState(() {
                                        _age = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.1,
                                alignment: Alignment.center,
                                child: Text(
                                  _age.round().toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Text('What is your height(cm)?',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Expanded(
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: Colors.white,
                                    inactiveTrackColor: Colors.white.withOpacity(0.5),
                                    trackHeight: height * 0.01,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: width * 0.03),
                                    overlayShape: RoundSliderOverlayShape(
                                        overlayRadius: width * 0.06),
                                    thumbColor: Colors.pink,
                                    overlayColor: Colors.pink.withOpacity(0.2),
                                    valueIndicatorTextStyle:
                                    TextStyle(color: Colors.white),
                                  ),
                                  child: Slider(
                                    value: _height,
                                    min: 1,
                                    max: 300,
                                    divisions: 199,
                                    label: _height.toStringAsFixed(1),
                                    onChanged: (value) {
                                      setState(() {
                                        _height = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.1,
                                alignment: Alignment.center,
                                child: Text(
                                  _height.toStringAsFixed(1),
                                  style: TextStyle(color: Colors.white,fontSize: 13),
                                ),
                              ),
                            ],
                          ),
                          Text('What is your weight?',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          Row(
                            children: [
                              Expanded(
                                child: SliderTheme(
                                  data: SliderTheme.of(context).copyWith(
                                    activeTrackColor: Colors.white,
                                    inactiveTrackColor: Colors.white.withOpacity(0.5),
                                    trackHeight: height * 0.01,
                                    thumbShape: RoundSliderThumbShape(
                                        enabledThumbRadius: width * 0.03),
                                    overlayShape: RoundSliderOverlayShape(
                                        overlayRadius: width * 0.06),
                                    thumbColor: Colors.pink,
                                    overlayColor: Colors.pink.withOpacity(0.2),
                                    valueIndicatorTextStyle:
                                    TextStyle(color: Colors.white),
                                  ),
                                  child: Slider(
                                    value: _weight,
                                    min: 1,
                                    max: 200,
                                    divisions: 99,
                                    label: _weight.round().toString(),
                                    onChanged: (value) {
                                      setState(() {
                                        _weight = value;
                                      });
                                    },
                                  ),
                                ),
                              ),
                              Container(
                                width: width * 0.1,
                                alignment: Alignment.center,
                                child: Text(
                                  _weight.round().toString(),
                                  style: TextStyle(color: Colors.white,fontSize: 14),
                                ),
                              ),
                            ],
                          ),
                          Text('What is your Ethnicity?',
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                          SizedBox(height: height * 0.01),
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            padding: EdgeInsets.symmetric(horizontal: width * 0.025),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                dropdownColor: Colors.white,
                                hint: Text(
                                  'Choose from the below',
                                  style: TextStyle(color: Colors.grey),
                                ),
                                isExpanded: true,
                                value: _ethnicity.isEmpty ? null : _ethnicity,
                                items: <String>[
                                  'Asian',
                                  'African',
                                  'Caucasian',
                                  'Hispanic'
                                ].map((String value) {
                                  return DropdownMenuItem<String>(
                                    value: value,
                                    child: Text(value, style: TextStyle(color: Colors.black)),
                                  );
                                }).toList(),
                                onChanged: (newValue) {
                                  setState(() {
                                    _ethnicity = newValue!;
                                  });
                                },
                                style: TextStyle(color: Colors.black),
                              ),
                            ),
                          ),
                          SizedBox(height: height * 0.02),
                          Center(
                            child: ElevatedButton(
                              child: Text('Continue',style: TextStyle(fontSize: 16),),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => WelcomeWeight()),
                                );
                              },
                              style: ElevatedButton.styleFrom(
                                minimumSize: Size(150, 40), // Set the desired width and height
                              ),
                            ),
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


