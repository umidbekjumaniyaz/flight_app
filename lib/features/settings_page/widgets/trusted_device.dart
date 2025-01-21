import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:flutter/material.dart';
class TrustedDeviceModal {
  static void showTrustedDeviceModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Modal oynani tashqarisini bosib yopib bo'lmaydi
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            'Continue and set device as trusted?',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          content: Text(
            'To set a PIN, this device needs to be set as trusted.',
            style: TextStyle(fontSize: 14, color: Colors.grey[700]),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Modal oynani yopish
              },
              child: Text(
                'No, cancel',
                style: TextStyle(color: Colors.red, fontSize: 14),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Modal oynani yopish
                // Qo'shimcha logikani shu yerda bajarishingiz mumkin
              },
              child: Text('Yes, continue'),
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.buttonColor,
              ),
            ),
          ],
        );
      },
    );
  }
}
