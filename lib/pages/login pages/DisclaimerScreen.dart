import 'package:chat_app/pages/style/commen_container.dart';
import 'package:chat_app/pages/homeScreenpages/homeScreen.dart';
import 'package:flutter/material.dart';

class DisclaimerPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final screenHeight = constraints.maxHeight;
            final screenWidth = constraints.maxWidth;

            return Container(
              height: screenHeight,
              color: Colors.white,
              child: Stack(
                children: [
                  Positioned(
                    top: screenHeight * 0.1,
                    left: screenWidth * 0.5 - 50,
                    child: const CircleAvatar(
                      radius: 50,
                      backgroundImage: AssetImage('assets/images/big.png'),
                      backgroundColor: Colors.red,
                    ),
                  ),
                  Center(
                    child: CommonContainer(
                      topMargin: screenHeight * 0.1,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: screenWidth * 0.8),
                        child: Padding(
                          padding: EdgeInsets.all(20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'The information provided on this website is for general informational purposes only. All information on the site is provided in good faith, however, we make no representation or warranty of any kind, express or implied, regarding the accuracy, adequacy, validity, reliability, availability, or completeness of any information on the site',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: screenWidth * 0.038,
                                ),
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: screenHeight * 0.03),
                              ElevatedButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => WelcomePage()),
                                  );
                                },
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.pink,
                                  padding: EdgeInsets.symmetric(
                                    horizontal: screenWidth * 0.1,
                                    vertical: screenHeight * 0.02,
                                  ),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                child: Text(
                                  'I agree',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: screenWidth * 0.04,
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
            );
          },
        ),
      ),
    );
  }
}
