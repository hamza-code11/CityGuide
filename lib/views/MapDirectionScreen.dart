import 'package:cityguid/colors/Colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    );
  }
}
