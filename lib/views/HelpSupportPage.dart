import 'package:cityguid/colors/Colors.dart';
import 'package:flutter/material.dart';

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
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () {
            Navigator.pop(context); // Navigate back
          },
        ),
        title: Text(
          'Help & Support',
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
              Text(
                'Welcome to the Help & Support Section',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'This section is designed to help you find answers to common questions, resolve any issues, and get assistance for a better experience with the City Guide app. Below, you will find a comprehensive guide to our support resources and contact options.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Frequently Asked Questions (FAQs)',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '• **How do I search for places in the City Guide app?**\n'
                '  To search for places, use the search bar on the home page. Simply type the name of the place or location, and you will see a list of suggestions with details and directions.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '• **How can I see directions to a place?**\n'
                '  After selecting a place from the search results, you can view detailed directions on the map. Use the "Get Directions" button to see the best route.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '• **Can I save my favorite places?**\n'
                '  Yes, you can save places by tapping the "Add to Favorites" button on the place details page. These will appear in your profile under "Saved Places."',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Contact Customer Support',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'If you need further assistance or have specific questions, our customer support team is here to help. Please use one of the following methods to reach us:',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '• **Email**: support@cityguide.com\n'
                '  Send us an email describing your issue, and we will respond within 24 hours.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '• **Live Chat**: Available in the app\n'
                '  Use the live chat feature for real-time support during business hours (9 AM - 6 PM).',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 10),
              Text(
                '• **Phone Support**: +1 800 123 4567\n'
                '  Call us for immediate assistance during business hours.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Text(
                'User Guides and Tutorials',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 10),
              Text(
                'To help you get the most out of the City Guide app, we have created detailed guides and video tutorials. You can find these resources under the "Help Center" section in the app or visit our website at www.cityguide.com/help.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Implement contact support functionality
                },
                child: Text('Contact Support'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
