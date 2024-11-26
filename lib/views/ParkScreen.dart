import 'package:cityguid/image/Images.dart';
import 'package:cityguid/views/IndexScreen.dart';
import 'package:cityguid/views/ProfilePage.dart';
import 'package:cityguid/views/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/HospitalCard.dart';

void main() {
  runApp(const HospitalApp());
}

class HospitalApp extends StatelessWidget {
  const HospitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hospitals',
      home: Parkscreen(),
    );
  }
}

class Parkscreen extends StatelessWidget {
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

  Parkscreen({super.key}); // Fixed constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hospitals',     style: TextStyle(
                fontSize: 30,
              ),),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: 'Search Hospitals',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16.0),
                ),
              ),
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
