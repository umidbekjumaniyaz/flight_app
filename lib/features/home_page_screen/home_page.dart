import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:final_assignment_si/features/account_page/account_page.dart';
import 'package:final_assignment_si/features/home_page_screen/search_results.dart';
import 'package:final_assignment_si/features/home_page_screen/transaction_page.dart';
import 'package:final_assignment_si/features/home_page_screen/widgets/calendar_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedTripType = 0; // One-way = 0, Round-trip = 1
  int _currentIndex = 0; // Current selected index for bottom navigation

  final List<Widget> _pages = [
    HomePageContent(), // Home page content
    TransactionPage(), // Transaction page
    ProfilePage(), // Account page
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColor.mainColor,
      appBar: _currentIndex == 0 ? _buildHomeAppBar() : null,
      body: _pages[_currentIndex], // Display the selected page
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }
  AppBar _buildHomeAppBar() {
    return AppBar(
      backgroundColor: CustomColor.mainColor,
      foregroundColor: Colors.white,
      elevation: 0,
      title: const Text(
        "Search Flights",
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: IconButton(
        icon: Image.asset('assets/arrowleft.png', height: 24, width: 24),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  BottomNavigationBar _buildBottomNavigationBar() {
    return BottomNavigationBar(
      selectedItemColor: CustomColor.mainColor,
      unselectedItemColor: Colors.grey,
      currentIndex: _currentIndex, // Current selected index
      onTap: (index) {
        setState(() {
          _currentIndex = index; // Update the selected index
        });
      },
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.confirmation_number),
          label: 'Transaction',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.person),
          label: 'Account',
        ),
      ],
    );
  }
}

class HomePageContent extends StatefulWidget {
  @override
  _HomePageContentState createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  int selectedTripType = 0; // One-way = 0, Round-trip = 1

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildHeaderText(),
        Expanded(
          child: _buildWhiteContainer(context),
        ),
      ],
    );
  }

  Padding _buildHeaderText() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: const [
          Text(
            'Discover',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          Text(
            'a new world',
            style: TextStyle(
              fontSize: 32,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildWhiteContainer(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildTripTypeSelector(),
          const SizedBox(height: 10),
          InputField(
            label: 'From',
            icon: 'assets/flight_take_off.png',
            value: 'New York, USA',
          ),
          const SizedBox(height: 5),
          Align(
            alignment: Alignment.centerRight,
            child: Image.asset(
              'assets/change.png',
              height: 50,
              width: 50,
            ),
          ),
          InputField(
            label: 'To',
            icon: 'assets/flight_landing.png',
            value: 'Da Nang, Vietnam',
          ),
          const SizedBox(height: 15),
          InputField(
            label: 'Departure Date',
            icon: 'assets/calendar.png',
            value: 'August 28, 2021',
            onTap: () {
              showModalBottomSheet(
                context: context,
                isScrollControlled: true,
                builder: (BuildContext context) {
                  return CalendarWidget();
                },
              );
            },
          ),
          const SizedBox(height: 15),
          InputField(
            label: 'Travelers',
            icon: 'assets/passenger.png',
            value: '1 Adult, 1 Child, 0 Infant',
          ),
          const SizedBox(height: 20),
          _buildSearchButton(context),
        ],
      ),
    );
  }

  Row _buildTripTypeSelector() {
    return Row(
      children: [
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Radio<int>(
              value: 0,
              groupValue: selectedTripType,
              onChanged: (value) {
                setState(() {
                  selectedTripType = value!;
                });
              },
              activeColor: CustomColor.mainColor,
            ),
            title: const Text('One-way'),
          ),
        ),
        Expanded(
          child: ListTile(
            contentPadding: EdgeInsets.zero,
            leading: Radio<int>(
              value: 1,
              groupValue: selectedTripType,
              onChanged: (value) {
                setState(() {
                  selectedTripType = value!;
                });
              },
              activeColor: CustomColor.mainColor,
            ),
            title: const Text('Round-trip'),
          ),
        ),
      ],
    );
  }

  SizedBox _buildSearchButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => FlightSearchPage(),
            ),
          );
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: CustomColor.mainColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: const Text(
          'Search flights',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class InputField extends StatelessWidget {
  final String label;
  final String icon;
  final String value;
  final VoidCallback? onTap;

  const InputField({
    required this.label,
    required this.icon,
    required this.value,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label.toUpperCase(),
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.bold,
              color: Colors.grey[700],
            ),
          ),
          const SizedBox(height: 5),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey[300]!),
            ),
            child: Row(
              children: [
                Image.asset(icon, height: 24, width: 24),
                const SizedBox(width: 10),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
