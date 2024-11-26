import 'package:cityguid/colors/Colors.dart';
import 'package:cityguid/views/IndexScreen.dart';
import 'package:cityguid/views/ProfilePage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Profilepage()),
              );
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
                MaterialPageRoute(
                    builder: (context) => const PreferencesPage()),
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
                MaterialPageRoute(
                    builder: (context) => const HelpSupportPage()),
              );
            },
          ),
        ],
      ),
      bottomNavigationBar: Container(
        decoration: const BoxDecoration(
          color: Color(0xff322e3a),
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black38,
              blurRadius: 10,
              offset: Offset(0, -1),
            ),
          ],
        ),
        child: Padding(
          padding:
              const EdgeInsets.only(bottom: 25, left: 8, right: 8, top: 10),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.grey, // Set selected icon color to grey
            unselectedItemColor:
                Colors.grey, // Set unselected icon color to grey
            showUnselectedLabels: true,
            selectedLabelStyle: GoogleFonts.inter(
              color: Colors.grey, // Set selected label color to grey
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            onTap: (index) {
              if (index == 0) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Indexscreen()),
                );
              } else if (index == 1) {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Profilepage()),
                );
              } else if (index == 2) {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const Settingscreen()),
                );
              }
            },
            items: const [
              BottomNavigationBarItem(
                icon: Icon(Icons.home),
                label: 'Home',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.location_pin),
                label: 'Missing place',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
