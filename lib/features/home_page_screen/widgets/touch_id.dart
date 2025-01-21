import 'package:final_assignment_si/features/payment_details_screen/passcode.dart';
import 'package:flutter/material.dart';

class FingerprintModal extends StatelessWidget {
  const FingerprintModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(height: 16.0),
          const Text(
            'Continue with Touch ID to Proceed the payment',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16.0),
          Image.asset(
            'assets/Illustration.png',
            width: 124,
            height: 124,
          ),
          const SizedBox(height: 26.0),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => PasscodePage(),
            ),
          );
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 227, 227, 227),
              padding: const EdgeInsets.symmetric(
                vertical: 18.0,
                horizontal: 100.0,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: const Text(
              'Use Passcode Instead',
              style: TextStyle(
                fontSize: 16.0,
               
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
