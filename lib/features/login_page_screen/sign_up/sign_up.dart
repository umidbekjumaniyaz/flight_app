import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:final_assignment_si/features/home_page_screen/home_page.dart';
import 'package:final_assignment_si/features/login_page_screen/sign_in/sign_in.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginUpPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     backgroundColor: CustomColor.backgroundColor,
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0,),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                ),
                SizedBox(height: 20),
                Text(
                  'Sign Up',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  'Start Your Journey with affordable price',
                  style: TextStyle(fontSize: 16, color: Colors.grey[600]),
                ),
                SizedBox(height: 40),
                Text(
                  'EMAIL',
                  style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                ),
                SizedBox(height: 8),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Enter Your Email',
                    border: UnderlineInputBorder(),
                  ),
                ),
                SizedBox(height: 72),
                SizedBox(
                  width: double.infinity,
                 child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => HomePage()),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: CustomColor.buttonColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sign up',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 8),
                        Icon(Icons.arrow_circle_right, color: Colors.white),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Center(
                  child: Text(
                    'Or Sign In With',
                    style: TextStyle(fontSize: 14, color: Colors.grey[700]),
                  ),
                ),
                SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/links/facebook.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    SizedBox(width: 90),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/links/google.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                    SizedBox(width: 90),
                    GestureDetector(
                      onTap: () {},
                      child: Image.asset(
                        'assets/links/apple.png',
                        width: 30,
                        height: 30,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Already have an account? ",
                      style: TextStyle(color: Colors.grey[700], fontSize: 14),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: CustomColor.buttonColor,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer() //TapGestureRecognizer  RichText bilan ishlashda zarur
                            ..onTap = () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(builder: (context) => LoginPage()),
                              );
                            },
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
