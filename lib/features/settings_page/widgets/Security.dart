import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:final_assignment_si/features/settings_page/widgets/setpin.dart';
import 'package:flutter/material.dart';

class SecuritySettingsPage extends StatefulWidget {
  @override
  _SecuritySettingsPageState createState() => _SecuritySettingsPageState();
}

class _SecuritySettingsPageState extends State<SecuritySettingsPage> {
  bool isTrustedDevice = false; // Set Device as Trusted holati
  bool isBiometricEnabled = false; // Biometric switch holati

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset('assets/chevron.left.png', height: 24, width: 24),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              'Security Settings',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ),
          Divider(thickness: 1, height: 1, color: Colors.grey[300]),
          _buildSectionTitle('Credit Card'),
          _buildRadioOption('Double Verification',
              'Enter CVV & OTP code for more secure payment verification.', true),
          _buildRadioOption('Single Verification',
              'Enter CVV & OTP code for a swift & hassle-free payment verification.', false),
          Divider(thickness: 1, height: 1, color: Colors.grey[300]),
          _buildSectionTitle('Biometric'),
          _buildSwitchOption(
            'Activate Biometric Feature',
            'To enjoy a seamless log in with fingerprint or face recognition.',
            isBiometricEnabled,
            (value) {
              setState(() {
                isBiometricEnabled = value;
              });
            },
          ),
          Divider(thickness: 1, height: 1, color: Colors.grey[300]),
          _buildSectionTitle('Device'),
          _buildSwitchOption(
            'Set Device as Trusted',
            'Activate to set a Pin and Manage device connectivity.',
            isTrustedDevice,
            (value) {
              setState(() {
                isTrustedDevice = value;
                if (value) {
                  _showTrustedDeviceModal(context);
                }
              });
            },
          ),
          Divider(thickness: 1, height: 1, color: Colors.grey[300]),
          _buildSectionTitle('Pin'),
          _buildNavigationOption('Set PIN',
              'Set a 6 digit verification PIN to secure your accounts activities.'),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 16.0,
          fontWeight: FontWeight.w600,
          color: Colors.grey[800],
        ),
      ),
    );
  }

  Widget _buildRadioOption(String title, String subtitle, bool isSelected) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
      ),
      trailing: Radio(
        value: isSelected,
        groupValue: true,
        onChanged: (value) {},
        activeColor: CustomColor.buttonColor,
      ),
    );
  }

  Widget _buildSwitchOption(String title, String subtitle, bool isSwitchedOn,
      Function(bool) onChanged) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
      ),
      trailing: Switch(
        value: isSwitchedOn,
        onChanged: onChanged,
        activeColor: CustomColor.buttonColor,
      ),
    );
  }

  Widget _buildNavigationOption(String title, String subtitle) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(fontSize: 14.0, fontWeight: FontWeight.w500),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(fontSize: 12.0, color: Colors.grey[600]),
      ),
      trailing: Icon(Icons.chevron_right, color: Colors.grey[400]),
      onTap: () {
        // PIN sozlash sahifasiga navigatsiya qilish
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => SetPinPage()),
        );
      },
    );
  }

  void _showTrustedDeviceModal(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: false, // Modalni tashqaridan yopib bo'lmaydi
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.0), // Yumaloq burchaklar
          ),
          titlePadding:
              EdgeInsets.fromLTRB(24.0, 24.0, 24.0, 8.0), // Bo'shliqlarni boshqarish
          contentPadding: EdgeInsets.fromLTRB(24.0, 8.0, 24.0, 0.0),
          actionsPadding:
              EdgeInsets.fromLTRB(16.0, 0.0, 16.0, 16.0), // Tugmalarni joylash
          title: Text(
            'Continue and set device as trusted?',
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            textAlign: TextAlign.start, // Matnni chapdan boshlash
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Kattalikni minimal o'lchamda ushlab turish
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'To set a PIN, this device needs to be set as trusted.',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[700],
                ),
                textAlign: TextAlign.start, // Matnni chapdan boshlash
              ),
              SizedBox(height: 26.0), // Bo'sh joy qo'shish
            ],
          ),
          actionsAlignment:
              MainAxisAlignment.spaceBetween, // Tugmalar orasidagi masofani kengroq qilish
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Modalni yopish
              },
              child: Text(
                'No, cancel',
                style: TextStyle(
                  color: CustomColor.buttonColor,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Modalni yopish
                // Qo'shimcha logikani shu yerga yozing
              },
              child: Text(
                'Yes, continue',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: CustomColor.buttonColor,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
              ),
            ),
          ],
        );
      },
    );
  }
}

