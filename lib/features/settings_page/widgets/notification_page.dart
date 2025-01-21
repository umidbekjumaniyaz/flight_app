import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:flutter/material.dart';

class NotificationSettingsPage extends StatefulWidget {
  @override
  _NotificationSettingsPageState createState() => _NotificationSettingsPageState();
}

class _NotificationSettingsPageState extends State<NotificationSettingsPage> {
  bool _activityEmail = false;
  bool _activityPush = true;
  bool _specialEmail = false;
  bool _specialPush = true;
  bool _remindersEmail = false;
  bool _remindersPush = true;
  bool _membershipEmail = false;
  bool _membershipPush = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
              'Notification Settings',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Push Notification Disabled',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.grey,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'To enable notifications, go to Settings',
              style: TextStyle(
                fontSize: 14.0,
                color: Colors.blue,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _buildNotificationSection(
                  title: 'Activity',
                  description: 'Secure your account by keeping your log in, register, and OTP activity on track.',
                  emailValue: _activityEmail,
                  pushValue: _activityPush,
                  onEmailChanged: (value) {
                    setState(() {
                      _activityEmail = value;
                    });
                  },
                  onPushChanged: (value) {
                    setState(() {
                      _activityPush = value;
                    });
                  },
                ),
                _buildNotificationSection(
                  title: 'Special For You',
                  description: 'You can never have too much of limited-time discount, exclusive offers, tips and info new feature.',
                  emailValue: _specialEmail,
                  pushValue: _specialPush,
                  onEmailChanged: (value) {
                    setState(() {
                      _specialEmail = value;
                    });
                  },
                  onPushChanged: (value) {
                    setState(() {
                      _specialPush = value;
                    });
                  },
                ),
                _buildNotificationSection(
                  title: 'Reminders',
                  description: 'Get important travel news and info, payment reminders, check-in reminder and more.',
                  emailValue: _remindersEmail,
                  pushValue: _remindersPush,
                  onEmailChanged: (value) {
                    setState(() {
                      _remindersEmail = value;
                    });
                  },
                  onPushChanged: (value) {
                    setState(() {
                      _remindersPush = value;
                    });
                  },
                ),
                _buildNotificationSection(
                  title: 'Membership',
                  description: 'You’ll get emails about tiket Elite Rewards and surveys.',
                  emailValue: _membershipEmail,
                  pushValue: _membershipPush,
                  onEmailChanged: (value) {
                    setState(() {
                      _membershipEmail = value;
                    });
                  },
                  onPushChanged: (value) {
                    setState(() {
                      _membershipPush = value;
                    });
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNotificationSection({
    required String title,
    required String description,
    required bool emailValue,
    required bool pushValue,
    required ValueChanged<bool> onEmailChanged,
    required ValueChanged<bool> onPushChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 4.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 14.0,
              color: Colors.grey,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Email'),
              Switch(
                value: emailValue,
                onChanged: onEmailChanged,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Push Notification'),
              Switch(
                value: pushValue,
                onChanged: onPushChanged,
                activeColor: CustomColor.buttonColor,
              ),
            ],
          ),
          Divider(),
        ],
      ),
    );
  }
}