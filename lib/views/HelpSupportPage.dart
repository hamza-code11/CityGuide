import 'package:cityguid/colors/Colors.dart';
import 'package:cityguid/views/ContactScreen.dart';
import 'package:cityguid/views/IndexScreen.dart';
import 'package:cityguid/views/ProfilePage.dart';
import 'package:cityguid/views/navigation_menu.dart';
import 'package:cityguid/views/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HelpSupportPage extends StatelessWidget {
  const HelpSupportPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: CustomColors.LoginSignupbackColor,
        appBar: AppBar(
          backgroundColor: CustomColors.LoginSignupbackColor,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () {
              Navigator.pop(context); // Navigate back
            },
          ),
          title: const Text(
            'Help & Support',
            style: const TextStyle(
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
                  'Welcome to the Help & Support Section',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'This section is designed to help you find answers to common questions, resolve any issues, and get assistance for a better experience with the City Guide app. Below, you will find a comprehensive guide to our support resources and contact options.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Frequently Asked Questions (FAQs)',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '• **How do I search for places in the City Guide app?**\n'
                  '  To search for places, use the search bar on the home page. Simply type the name of the place or location, and you will see a list of suggestions with details and directions.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '• **How can I see directions to a place?**\n'
                  '  After selecting a place from the search results, you can view detailed directions on the map. Use the "Get Directions" button to see the best route.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '• **Can I save my favorite places?**\n'
                  '  Yes, you can save places by tapping the "Add to Favorites" button on the place details page. These will appear in your profile under "Saved Places."',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Contact Customer Support',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  'If you need further assistance or have specific questions, our customer support team is here to help. Please use one of the following methods to reach us:',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '• **Email**: support@cityguide.com\n'
                  '  Send us an email describing your issue, and we will respond within 24 hours.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '• **Live Chat**: Available in the app\n'
                  '  Use the live chat feature for real-time support during business hours (9 AM - 6 PM).',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '• **Phone Support**: +1 800 123 4567\n'
                  '  Call us for immediate assistance during business hours.',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'User Guides and Tutorials',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Contactscreen()));
                  },
                  style: ButtonStyle(
                    padding: MaterialStateProperty.all(
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                    ),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.pinkAccent),
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
        ));
  }
}
