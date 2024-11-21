import 'package:cityguid/image/Images.dart';
import 'package:flutter/material.dart';

import '../widgets/HospitalCard.dart';


import '../colors/Colors.dart';


void main() {
  runApp(const HospitalApp());
}

class HospitalApp extends StatelessWidget {
  const HospitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospitals',
      home: HospitalScreen(),
    );
  }
}

class HospitalScreen extends StatelessWidget {
  final List<Hospital> hospitals = [
    Hospital(
      name: 'SV Medical Hall',
      address:
          '3729+5CH, Medak-Yellareddy Rd, Fathe Nagar, Medak, Telangana, India',
      distance: '3.8 km',
      rating: 4.7,
      imagepath: ImagesPath.hospital1, // Replace with actual image URL
    ),
    Hospital(
      name: 'Aditya Hospital',
      address: '27MV+M8R, Auto Nagar, Medak, Telangana 503111, India',
      distance: '4.1 km',
      rating: 4.1,
      imagepath: ImagesPath.hospital2, // Replace with actual image URL
    ),
  ];

  HospitalScreen({super.key}); // Fixed constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
   appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60), // Set the height of the AppBar
        child: ClipRRect(
          borderRadius: const BorderRadius.vertical(
            bottom: Radius.circular(20), // Set the bottom border radius
          ),
          child: AppBar(
            title: const Text(
              'Hospitals',
              style: TextStyle(
                fontSize: 30,
              ),
            ),
            backgroundColor: Colors.orange,
            elevation: 0, // Remove the default shadow for better appearance
          ),
        ),
      ),
      backgroundColor: CustomColors.LoginSignupbackColor,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(221, 43, 43, 43),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // Outer shadow
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: const Offset(2, 4), // Shadow position
                        ),
                      ],
                    ),
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'Search here...',
                        hintStyle:
                            const TextStyle(color: Colors.white54, fontSize: 18),
                        prefixIcon:
                            const Icon(Icons.search, color: Colors.white),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide.none,
                        ),
                        contentPadding: const EdgeInsets.symmetric(
                          horizontal: 20,
                          vertical: 0,
                        ),
                      ),
                      style: const TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: hospitals.length,
                itemBuilder: (context, index) {
                  final hospital = hospitals[index];
                  return HospitalCard(hospital: hospital);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
