import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:final_assignment_si/features/login_page_screen/sign_in/sign_in.dart';
import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<OnboardingData> onboardingData = [
    OnboardingData(
      imagePath: 'assets/onboarding1.png',
      title: 'Explore \nThe Beautiful \nWorld!',
      description: '',
    ),
    OnboardingData(
      imagePath: 'assets/onboarding2.png',
      title: 'Find \nYour Perfect \nTickets To Fly',
      description: '',
    ),
    OnboardingData(
      imagePath: 'assets/onboarding3.png',
      title: 'Book \nAppointments \nin the Easiest Way!',
      description: '',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              onPageChanged: (int index) {
                setState(() {
                  _currentPage = index;
                });
              },
              itemCount: onboardingData.length,
              itemBuilder: (context, index) {
                return OnboardingPage(
                  data: onboardingData[index],
                  currentPage: _currentPage,
                  totalPages: onboardingData.length,
                );
              },
            ),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Skip tugmasi Login sahifasiga o'tadi
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      },
                      style: TextButton.styleFrom(
                        minimumSize: Size(100, 50),
                      ),
                      child: Text(
                        'Skip',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                        ),
                      ),
                    ),
                    if (_currentPage != onboardingData.length - 1)
                      ElevatedButton(
                        onPressed: () {
                          _pageController.nextPage(
                            duration: Duration(milliseconds: 300),
                            curve: Curves.easeIn,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColor.buttonColor, foregroundColor: Colors.white,
                          minimumSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Next ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(Icons.arrow_circle_right),
                          ],
                        ),
                      )
                    else
                      ElevatedButton(
                        onPressed: () {
                          // Get Started tugmasi Login sahifasiga o'tadi
                          Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) => LoginPage()),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: CustomColor.buttonColor, foregroundColor: Colors.white,
                          minimumSize: Size(150, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Row(
                          children: [
                            Text(
                              'Get Started ',
                              style: TextStyle(fontSize: 16),
                            ),
                            Icon(Icons.arrow_circle_right),
                          ],
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  final OnboardingData data;
  final int currentPage;
  final int totalPages;

  const OnboardingPage({
    required this.data,
    required this.currentPage,
    required this.totalPages,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 100),
          Image.asset(data.imagePath, height: 400),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(
              totalPages,
              (index) => buildDot(index, currentPage),
            ),
          ),
          SizedBox(height: 30),
          Text(
            data.title,
            textAlign: TextAlign.start,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ],
      ),
    );
  }

  Widget buildDot(int index, int currentPage) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 300),
      height: 6,
      width: currentPage == index ? 70 : 20,
      margin: EdgeInsets.symmetric(horizontal: 5),
      decoration: BoxDecoration(
        color: currentPage == index ? CustomColor.buttonColor : Colors.grey,
        borderRadius: BorderRadius.circular(5),
      ),
    );
  }
}

class OnboardingData {
  final String imagePath;
  final String title;
  final String description;

  OnboardingData({
    required this.imagePath,
    required this.title,
    required this.description,
  });
}


