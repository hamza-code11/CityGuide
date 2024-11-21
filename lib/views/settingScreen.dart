import 'package:cityguid/colors/Colors.dart';
import 'package:flutter/material.dart';
import 'PreferencesPage.dart';
import 'PrivacyPage.dart';
import 'HelpSupportPage.dart';

class Settingscreen extends StatelessWidget {
  const Settingscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.LoginSignupbackColor,
      appBar: AppBar(
        backgroundColor: CustomColors.LoginSignupbackColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text(
          'Settings',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: ListView(
        children: [
          ListTile(
            leading: Icon(Icons.info, color: Colors.white),
            title: Text(
              'Personal Info',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              // Navigate to Personal Info
            },
          ),
          Divider(color: Colors.grey[800]),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white),
            title: Text(
              'Preferences',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PreferencesPage()),
              );
            },
          ),
          Divider(color: Colors.grey[800]),
          ListTile(
            leading: Icon(Icons.lock, color: Colors.white),
            title: Text(
              'Privacy',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PrivacyPage()),
              );
            },
          ),
          Divider(color: Colors.grey[800]),
          ListTile(
            leading: Icon(Icons.help, color: Colors.white),
            title: Text(
              'Help & Support',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const HelpSupportPage()),
              );
            },
          ),
        ],
      ),
    );
  }
}
