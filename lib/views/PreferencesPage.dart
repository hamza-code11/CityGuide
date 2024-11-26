import 'package:cityguid/colors/Colors.dart';
import 'package:cityguid/views/IndexScreen.dart';
import 'package:cityguid/views/ProfilePage.dart';
import 'package:cityguid/views/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PreferencesPage extends StatelessWidget {
  const PreferencesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.LoginSignupbackColor,
      appBar: AppBar(
        backgroundColor: CustomColors.LoginSignupbackColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Preferences',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Customize your experience:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 10),
            ListTile(
              leading: Icon(Icons.language, color: Colors.white),
              title: Text('Language', style: TextStyle(color: Colors.white)),
              subtitle: Text(
                'Choose your preferred language',
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                // Implement language preferences
              },
            ),
            Divider(color: Colors.grey[800]),
            ListTile(
              leading: Icon(Icons.notifications, color: Colors.white),
              title:
                  Text('Notifications', style: TextStyle(color: Colors.white)),
              subtitle: Text(
                'Enable or disable app notifications',
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                // Implement notification preferences
              },
            ),
            Divider(color: Colors.grey[800]),
            ListTile(
              leading: Icon(Icons.map, color: Colors.white),
              title: Text('Map View', style: TextStyle(color: Colors.white)),
              subtitle: Text(
                'Set your default map view (e.g., Satellite or Normal)',
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                // Implement map view preferences
              },
            ),
          ],
        ),
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
