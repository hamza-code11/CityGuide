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
      appBar: AppBar(
        title: const Text('Hospitals',
          style: TextStyle(
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
    );
  }
}

