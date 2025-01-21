import 'package:final_assignment_si/features/settings_page/widgets/Security.dart';
import 'package:final_assignment_si/features/settings_page/widgets/delete_account_page.dart';
import 'package:final_assignment_si/features/settings_page/widgets/emailandmobile.dart';
import 'package:final_assignment_si/features/settings_page/widgets/language_page.dart';
import 'package:final_assignment_si/features/settings_page/widgets/notification_page.dart';
import 'package:flutter/material.dart';
class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);

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
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 8),
            const Text(
              'Settings',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
              
            ),
            const SizedBox(height: 16),
            const SectionHeader(title: "General"),
            _buildTile(
              title: "Language",
              onTap: (){
                 Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => LanguageSettingsPage(
                        ),
                    ),
                  );
              }
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFE5E5EA)),
            _buildTile(
              title: "Notification Settings",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NotificationSettingsPage(
                        ),
                    ),
                  );
              },
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFE5E5EA)),
            _buildSwitchTile(
              title: "Location",
              value: true,
              onChanged: (value) => print("Location toggled: $value"),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFE5E5EA)),
            const SizedBox(height: 16),
            const SectionHeader(title: "Account & Security"),
            _buildTile(
              title: "Email and Mobile Number",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EmailAndMobilePage(
                        ),
                    ),
                  );
              },
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFE5E5EA)),
            _buildTile(
              title: "Security Settings",
               onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SecuritySettingsPage(
                        ),
                    ),
                  );
              },
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFE5E5EA)),
            _buildTile(
              title: "Delete Account",
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DeleteAccountPage(
                        ),
                    ),
                  );
              },
            ),
            const SizedBox(height: 16),
            const SectionHeader(title: "Other"),
            _buildTile(
              title: "About Travel App",
              onTap: () => print("About tapped"),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFE5E5EA)),
            _buildTile(
              title: "Privacy Policy",
              onTap: () => print("Privacy Policy tapped"),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFE5E5EA)),
            _buildTile(
              title: "Terms and Conditions",
              onTap: () => print("Terms and Conditions tapped"),
            ),
            const Divider(height: 1, thickness: 1, color: Color(0xFFE5E5EA)),
            _buildTile(
              title: "Rate App",
              trailing: const Text(
                "v4.87.2",
                style: TextStyle(
                  color: Color(0xFF8E8E93),
                  fontSize: 16,
                ),
              ),
              onTap: () => print("Rate App tapped"),
            ),
          ],
        ),
      ),
    );
  }
  Widget _buildTile({
    required String title,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF1C1C1E),
        ),
      ),
      trailing: trailing ??
          const Icon(
            Icons.arrow_forward_ios,
            color: Color(0xFFC7C7CC),
            size: 16,
          ),
      onTap: onTap,
    );
  }

  Widget _buildSwitchTile({
    required String title,
    required bool value,
    required ValueChanged<bool> onChanged,
  }) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 16,
          color: Color(0xFF1C1C1E),
        ),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: const Color(0xFF007AFF),
      ),
    );
  }
}

class SectionHeader extends StatelessWidget {
  final String title;

  const SectionHeader({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: Text(
        title,
        style: const TextStyle(
          fontSize: 18, // Slightly larger font size
          fontWeight: FontWeight.bold, // Bold weight
          color: Color(0xFF1C1C1E), // Black color
        ),
      ),
    );
  }
}