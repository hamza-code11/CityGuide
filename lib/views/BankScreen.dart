import 'package:cityguid/colors/Colors.dart';
import 'package:cityguid/image/Images.dart';
import 'package:flutter/material.dart';

import '../widgets/HospitalCard.dart';

void main() {
  runApp(const HospitalApp());
}

class HospitalApp extends StatelessWidget {
  const HospitalApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Banks',
      home: Bankscreen(),
    );
  }
}

class Bankscreen extends StatelessWidget {
  final List<Hospital> hospitals = [
    Hospital(
      name: 'Habib Metro',
      address:
          'V3G5+XMQ, Block 3 P.E.C.H.S., Karachi, Karachi City, Sindh, Pakistan',
      distance: '3.8 km',
      rating: 4.7,
      imagepath: ImagesPath.habibmetro, 
    ),
    Hospital(
      name: 'Meezan Bank',
      address: 'Plot No. 28, Adam Arcade, Bihar Muslim Society BMCHS Sharafabad, Karachi, Karachi City, Sindh, Pakistan',
      distance: '4.1 km',
      rating: 4.1,
      imagepath: ImagesPath.meezanbank, 
    ),
    Hospital(
      name: 'United Bank Limited',
      address: 'Plot No. 28, Adam Arcade, Bihar Muslim Society BMCHS Sharafabad, Karachi, Karachi City, Sindh, Pakistan',
      distance: '4.1 km',
      rating: 4.1,
      imagepath: ImagesPath.ubl, 
    ),
  ];

  Bankscreen({super.key}); // Fixed constructor

  
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
              'Banks',
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
