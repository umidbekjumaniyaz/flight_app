import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:final_assignment_si/features/settings_page/settings_page.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.fromLTRB(16, 80, 16, 16),
            decoration: const BoxDecoration(
              color: CustomColor.mainColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text(
                      'My profile',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 30,
                      backgroundImage: AssetImage('assets/avatar.png'),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Jos Creative',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              
                            ),
                          ),
                          SizedBox(height: 4),
                          Text(
                            'josphamdes@gmail.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                          SizedBox(height: 2),
                          Text(
                            '+1 654 785 4462',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Image.asset(
                      'assets/Edit.png', 
                      height: 24,
                      width: 24,
                    ),
                  ],
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.all(16),
              children: [
                ProfileMenuItem(
                  imagePath: 'assets/myorder.png',
                  title: 'My Order',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  imagePath: 'assets/voucher.png',
                  title: 'My Voucher',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  imagePath: 'assets/card.png',
                  title: 'Payment Methods',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  imagePath: 'assets/addfriend.png',
                  title: 'Invite Friends',
                  onTap: () {},
                ),
                SwitchMenuItem(
                  imagePath: 'assets/scan.png',
                  title: 'Quick Login',
                  value: true,
                  onChanged: (value) {},
                ),
                const Divider(thickness: 1, height: 32),
                ProfileMenuItem(
                  imagePath: 'assets/qm.png',
                  title: 'Help',
                  onTap: () {},
                ),
                ProfileMenuItem(
                  imagePath: 'assets/setting.png',
                  title: 'Settings',
                  onTap: () {
                    Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => SettingsPage(),
            ),
          );
                  },
                ),
                const Divider(thickness: 1, height: 32),
                ProfileMenuItem(
                  imagePath: 'assets/logout.png',
                  title: 'Log Out',
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ProfileMenuItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final VoidCallback onTap;

  const ProfileMenuItem({
    required this.imagePath,
    required this.title,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imagePath, height: 24, width: 24, color: CustomColor.mainColor),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: const Icon(Icons.arrow_forward_ios, size: 16),
      onTap: onTap,
    );
  }
}

class SwitchMenuItem extends StatelessWidget {
  final String imagePath;
  final String title;
  final bool value;
  final ValueChanged<bool> onChanged;

  const SwitchMenuItem({
    required this.imagePath,
    required this.title,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Image.asset(imagePath, height: 24, width: 24, color: CustomColor.mainColor),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16),
      ),
      trailing: Switch(
        value: value,
        onChanged: onChanged,
        activeColor: CustomColor.mainColor,
      ),
    );
  }
}
