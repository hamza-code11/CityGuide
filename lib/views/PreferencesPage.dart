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
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: const Text(
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
            const Text(
              'Customize your experience:',
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            ListTile(
              leading: const Icon(Icons.language, color: Colors.white),
              title:
                  const Text('Language', style: TextStyle(color: Colors.white)),
              subtitle: const Text(
                'Choose your preferred language',
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                // Implement language preferences
              },
            ),
            Divider(color: Colors.grey[800]),
            ListTile(
              leading: const Icon(Icons.notifications, color: Colors.white),
              title: const Text('Notifications',
                  style: TextStyle(color: Colors.white)),
              subtitle: const Text(
                'Enable or disable app notifications',
                style: TextStyle(color: Colors.grey),
              ),
              onTap: () {
                // Implement notification preferences
              },
            ),
            Divider(color: Colors.grey[800]),
            ListTile(
              leading: const Icon(Icons.map, color: Colors.white),
              title:
                  const Text('Map View', style: TextStyle(color: Colors.white)),
              subtitle: const Text(
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
    );
  }
}
