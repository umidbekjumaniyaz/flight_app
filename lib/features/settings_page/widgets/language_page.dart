import 'package:final_assignment_si/core/constants/colors.dart';
import 'package:flutter/material.dart';
class LanguageSettingsPage extends StatefulWidget {
  @override
  _LanguageSettingsPageState createState() => _LanguageSettingsPageState();
}
class _LanguageSettingsPageState extends State<LanguageSettingsPage> {
  String? _selectedLanguage = 'English';

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
              'Language',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'Language',
              style: TextStyle(
                fontSize: 16.0,
                color: Colors.black,
                 fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  title: Text('English'),
                  trailing: Radio(
                    value: 'English',
                    groupValue: _selectedLanguage,
                    activeColor: CustomColor.buttonColor,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('Vietnamese'),
                  trailing: Radio(
                    value: 'Vietnamese',
                    groupValue: _selectedLanguage,
                    activeColor: CustomColor.buttonColor,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value.toString();
                      });
                    },
                  ),
                ),
                ListTile(
                  title: Text('French'),
                  trailing: Radio(
                    value: 'French',
                    groupValue: _selectedLanguage,
                    activeColor: CustomColor.buttonColor,
                    onChanged: (value) {
                      setState(() {
                        _selectedLanguage = value.toString();
                      });
                    },
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

//sanjarbek ismailov