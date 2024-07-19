import 'package:chat_app/pages/style/commen_container.dart';
import 'package:flutter/material.dart';
import 'LoginScreen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignupScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenHeight = size.height;
    final screenWidth = size.width;

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
                  child: CircleAvatar(
                    radius: 50,
                    backgroundImage: AssetImage('assets/images/big.png'),
                    backgroundColor: Colors.red,
                  ),
                ),
                Center(
                  child: CommonContainer(
                    topMargin: screenHeight * 0.05,
                    child: ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 400),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.05),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              'SignUp',
                              style: TextStyle(color: Colors.white, fontSize: screenWidth * 0.08, fontWeight: FontWeight.bold),
                            ),
                            SizedBox(height: screenHeight * 0.02),
                            _buildTextField('Email or phone', Icons.email),
                            SizedBox(height: screenHeight * 0.01),
                            _buildTextField('Password', Icons.lock, isPassword: true),
                            SizedBox(height: screenHeight * 0.02),
                            _buildSignupButton(context),
                            SizedBox(height: screenHeight * 0.02),
                            _buildLoginText(context),
                            SizedBox(height: screenHeight * 0.02),
                            _buildSocialLoginOptions(),
                            SizedBox(height: screenHeight * 0.02),
                            Text('Or Sign in with', style: TextStyle(color: Colors.white)),
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
        suffixText: isPassword ? 'Forgot' : null,
        suffixStyle: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildSignupButton(BuildContext context) {
    return ElevatedButton(
      child: Text('Signup', style: TextStyle(color: Colors.white)),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        backgroundColor: Colors.pink,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
    );
  }

  Widget _buildLoginText(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => LoginScreen()),
        );
      },
      child: Text(
        "Already have Account Login",
        style: TextStyle(color: Colors.white, decoration: TextDecoration.underline),
      ),
    );
  }

  Widget _buildSocialLoginOptions() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildSocialLoginOption(FontAwesomeIcons.google, 'Google'),
        _buildSocialLoginOption(FontAwesomeIcons.facebook, 'Facebook'),
      ],
    );
  }

  Widget _buildSocialLoginOption(IconData icon, String label) {
    return Column(
      children: [
        FaIcon(icon, color: Colors.white),
        Text(label, style: TextStyle(color: Colors.white)),
      ],
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