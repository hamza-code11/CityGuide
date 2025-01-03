import 'package:cityguid/colors/Colors.dart';
import 'package:cityguid/views/ContactScreen.dart';
import 'package:cityguid/views/IndexScreen.dart';
import 'package:cityguid/views/ProfilePage.dart';
import 'package:cityguid/views/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

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
          'Privacy',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Manage Your Privacy Settings',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Your privacy is our top priority. This section allows you to control what information you share, who can access it, and how we use your data to enhance your experience. Below are the available options to customize your privacy preferences:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Data Sharing Options',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '• **Profile Visibility:**\n'
                '  Choose whether your profile and activities are visible to everyone, only your friends, or only you. This includes your favorite places and reviews.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '• **Location Sharing:**\n'
                '  Manage who can see your live location and when it is shared. You can turn off location sharing entirely for maximum privacy.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Personalized Recommendations',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '• Opt in or out of using your browsing and activity data to provide personalized suggestions for places, restaurants, and events.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const Text(
                '• You can review the data collected and decide whether to allow us to use it for improving your app experience.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Activity and Data Management',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '• **Review Activity History:**\n'
                '  Access your activity history, including places searched, routes taken, and reviews submitted. You can delete specific entries or clear your entire history.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                '• **Data Deletion Requests:**\n'
                '  If you decide to stop using the app, you can request the permanent deletion of your data from our servers.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Your Control',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'We believe in giving you complete control over your privacy. All your preferences can be updated instantly, and changes will reflect across the app.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              const SizedBox(height: 30),
              TextButton(
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Contactscreen()));
                },
                style: ButtonStyle(
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.pinkAccent),
                  foregroundColor: MaterialStateProperty.all(Colors.black),
                  overlayColor: MaterialStateProperty.all(
                    Colors.teal.withOpacity(0.2),
                  ),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                child: Text(
                  "Contact",
                  style: GoogleFonts.inter(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
