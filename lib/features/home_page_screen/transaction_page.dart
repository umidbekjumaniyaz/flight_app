import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:final_assignment_si/features/home_page_screen/select_seat.dart';
import 'package:flutter/material.dart';

class TransactionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          '',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start, // Body qismini chapga yo'naltirish
          children: [
            // Matn qismi
            const Text(
              "Transaction",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.start, // Chapga yo'naltirish
            ),
            const SizedBox(height: 20),
            // Rasm
            Center(
              child: Image.asset(
                'assets/transaction_image.png', // Rasm nomini almashtiring, kerak bo'lsa
                height: 200,
              ),
            ),
            const SizedBox(height: 24,),
            
            const Text(
              
              "                 Let's go somewhere",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            const Text(
              "      After booking a trip you can manage orders\nand see E-ticket here.",
              style: TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            // Tugma
            Center(
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => SeatSelectionPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: CustomColor.mainColor,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 150, vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text('Book a trip'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
