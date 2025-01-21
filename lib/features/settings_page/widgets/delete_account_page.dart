import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:flutter/material.dart';

class DeleteAccountPage extends StatefulWidget {
  @override
  _DeleteAccountPageState createState() => _DeleteAccountPageState();
}
//sanjarbek ismailov
class _DeleteAccountPageState extends State<DeleteAccountPage> {
  bool isChecked = false;
 //sanjarbek ismailov
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            'assets/chevron.left.png',
            height: 24,
            width: 24,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16.0),
            Text(
              'Delete Account', // AppBar o'rniga body ichida title
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 24.0),
            Center(
              child: Image.asset(
                'assets/delete_account.png',
                height: 220,
              ),
            ),
            SizedBox(height: 24.0),
            Text(
              'You sure want \nto delete your account?',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 16.0),
            Text(
              'If you delete your account:',
              style: TextStyle(
                fontSize: 16.0,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 8.0),
            Text(
              '• Your remaining tiket Points cannot be used anymore.\n'
              '• Your tiket Elite Rewards benefits will not be available anymore.\n'
              '• All your pending rewards will be deleted.\n'
              '• All rewards from using credit card can no longer be obtained.',
              style: TextStyle(
                fontSize: 14.0,
                height: 1.5,
                color: Colors.black,
              ),
            ),
            SizedBox(height: 16.0),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Checkbox(
                  activeColor: CustomColor.buttonColor,
                  value: isChecked,
                  onChanged: (value) {
                    setState(() {
                      isChecked = value!;
                    });
                  },
                ),
                Expanded(
                  child: Text(
                    'I understand and accept all the above risks regarding my account deletion.',
                    style: TextStyle(fontSize: 14.0, height: 1.5),
                  ),
                ),
              ],
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: isChecked
                    ? () {
                        // Tugma bosilganda amalga oshiriladigan kod
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: isChecked
                      ? CustomColor.buttonColor
                      : Colors.blue[100], // Fonga ozgina ko'k-kulrang
                  padding: EdgeInsets.symmetric(vertical: 14.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  elevation: isChecked ? 2 : 0,
                ),
                child: Text(
                  'Yes, Continue',
                  style: TextStyle(
                    color: isChecked ? Colors.white : Colors.white, // Oq matn
                    fontSize: 16.0,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.0),
          ],
        ),
      ),
      backgroundColor: Colors.white,
    );
  }
}
