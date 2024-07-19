import 'package:chat_app/pages/style/commen_container.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/pages/login%20pages/DisclaimerScreen.dart';
import 'package:chat_app/pages/login%20pages/SignupScreen.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    final screenHeight = screenSize.height;
    final screenWidth = screenSize.width;

    return Scaffold(
      body: SafeArea(
          child: Container(
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
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'Login',
                              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.08, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            _buildTextField('Email or phone', Icons.email),
                            SizedBox(height: screenHeight * 0.01),
                            _buildTextField('Password', Icons.lock, isPassword: true),
                            SizedBox(height: screenHeight * 0.02),
                            _buildBiometricOptions(),
                            SizedBox(height: screenHeight * 0.02),
                            _buildLoginButton(context),
                            SizedBox(height: screenHeight * 0.01),
                            _buildSignUpText(context),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Positioned(
                  bottom: screenHeight * 0.05,
                  left: screenWidth * 0.1,
                  right: screenWidth * 0.1,
                  child: _buildHospitalCodeField(),
                ),
              ],
            ),
          ),
        ),
    );
  }

  Widget _buildTextField(String hint, IconData icon, {bool isPassword = false}) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white70),
        prefixIcon: Icon(icon, color: Colors.white70),
        enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white70)),
        suffix: isPassword ? Text('Forgot', style: TextStyle(color: Colors.white)) : null,
      ),
    );
  }

  Widget _buildBiometricOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildBiometricOption(Icons.fingerprint, 'Touch ID'),
        _buildBiometricOption(Icons.face, 'Face ID'),
      ],
    );
  }

  Widget _buildBiometricOption(IconData icon, String label) {
    return Column(
      children: [
        Icon(icon, color: Colors.white),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    return ElevatedButton(
      child: Text('Login', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.pink,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => DisclaimerPage()),
        );
      },
    );
  }

  Widget _buildSignUpText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SignupScreen()),
        );
      },
      child: Text(
        "Already have an account? Sign in",
        style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
      ),
    );
  }

  Widget _buildHospitalCodeField() {
    return Container(
      height: 50,
      child: TextField(
        decoration: InputDecoration(
          hintText: 'Do you have a code from hospital ?',
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    );
  }
}