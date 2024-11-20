import 'package:cityguid/image/Images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
      appBar: AppBar(
        backgroundColor: CustomColors.LoginSignupbackColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),  // Updated with Get.back()
        ),
        title: Text(
          "Catigories",
          style: TextStyle(
            fontSize: 22,
            color: Colors.white70,
          ),
        ),
        centerTitle: true,
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
                      color: Color.fromARGB(221, 43, 43, 43),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3), // Outer shadow
                          spreadRadius: 2,
                          blurRadius: 6,
                          offset: Offset(2, 4), // Shadow position
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

class Hospital {
  final String name;
  final String address;
  final String distance;
  final double rating;
  final String imagepath;

  Hospital({
    required this.name,
    required this.address,
    required this.distance,
    required this.rating,
    required this.imagepath,
  });
}

class HospitalCard extends StatelessWidget {
  final Hospital hospital;

  const HospitalCard({super.key, required this.hospital});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 6.0, // Add shadow effect
      color: const Color.fromARGB(221, 43, 43, 43),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(
              top: Radius.circular(16.0),
              bottom: Radius.circular(16.0),
            ),
            child: Image.asset(
              hospital.imagepath,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hospital.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0,
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  hospital.address,
                  style: const TextStyle(
                    color: Colors.white, // Set text color to white
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      hospital.distance,
                      style: const TextStyle(
                        color: Colors.white, // Set text color to white
                      ),
                    ),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.yellow, size: 20),
                        const SizedBox(width: 4),
                        Text(
                          hospital.rating.toString(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white, // Set text color to white
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
