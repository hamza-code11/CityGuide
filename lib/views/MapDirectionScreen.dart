import 'package:cityguid/colors/Colors.dart';
import 'package:cityguid/views/IndexScreen.dart';
import 'package:cityguid/views/ProfilePage.dart';
import 'package:cityguid/views/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/CustomButtom.dart';

class MapDirectionScreen extends StatelessWidget {
  const MapDirectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.LoginSignupbackColor,
      appBar: AppBar(
        backgroundColor: CustomColors.LoginSignupbackColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(), // Updated with Get.back()
        ),
        title: const Text(
          "Map Direction",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white70,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Location Map Section
            const SizedBox(height: 20),
            Container(
              height: Get.height * 0.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: const DecorationImage(
                  image: AssetImage('assets/images/Mapplaceholder.png'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            // Location Details
            const Text(
              '3729+5CH, Medak-Yellareddy Rd, Fathe Nagar,\nMedak, Telangana, India',
              style: TextStyle(color: Colors.white, fontSize: 16),
            ),
            const SizedBox(height: 8),
            const Spacer(),
            // Submit Button
            CustomButton(
              text: "Submit",
              onPressed: () {},
              backgroundColor: Colors.pinkAccent,
              textColor: Colors.white,
              borderRadius: 8.0,
              elevation: 4.0,
              padding:
                  const EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            ),

            const SizedBox(height: 20),
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
    padding: const EdgeInsets.only(bottom: 25, left: 8, right: 8, top: 10),
    child: BottomNavigationBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: Colors.grey, // Set selected icon color to grey
      unselectedItemColor: Colors.grey, // Set unselected icon color to grey
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
            MaterialPageRoute(builder: (context) => const Settingscreen()),
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
