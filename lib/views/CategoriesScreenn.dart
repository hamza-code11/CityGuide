import 'package:cityguid/views/IndexScreen.dart';
import 'package:cityguid/views/ProfilePage.dart';
import 'package:cityguid/views/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const Categoriesscreen());
}

class Categoriesscreen extends StatelessWidget {
  const Categoriesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color(0xFF1E1E2C),
        appBar: AppBar(
          backgroundColor: const Color(0xFF1E1E2C),
          elevation: 0,
          toolbarHeight: 100,
          flexibleSpace: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: const Color(0xFF3A3A44),
                      prefixIcon: const Icon(Icons.search, color: Colors.white),
                      hintText: 'Plumbers',
                      hintStyle: const TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        body: ListView(
          padding:const EdgeInsets.all(16.0),
          children:const [
            ContactCard(
              name: 'Jenny Wilson',
              rating: '4.7',
              color: Colors.yellow,
              imagePath:  'assets/images/contact2.png',
            ),
            ContactCard(name: 'Leslie Alexander', rating: '4.7', color: Colors.orange,imagePath: 'assets/images/contact2.png',),
            ContactCard(name: 'Kristin Watson', rating: '4.7', color: Colors.blueGrey,imagePath: 'assets/images/contact3.png',),
            ContactCard(name: 'Jane Cooper', rating: '4.7', color: Colors.pinkAccent,imagePath: 'assets/images/contact4.png',),
            ContactCard(name: 'Brooklyn Simmons', rating: '4.7', color: Colors.yellow , imagePath: 'assets/images/contact5.png',),
            ContactCard(name: 'Jerome Bell', rating: '4.7', color: Colors.pinkAccent ,imagePath: 'assets/images/contact6.png',),
            ContactCard(name: 'Kathryn Murphy', rating: '4.7', color: Colors.purple , imagePath: 'assets/images/contact7.png',),
          ],
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



      ),
    );
  }
}

class ContactCard extends StatelessWidget {
  final String name;
  final String rating;
  final Color color;
  final String? imagePath; // Add an optional image path parameter

  const ContactCard({
    super.key,
    required this.name,
    required this.rating,
    required this.color,
    this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: const Color(0xFF2A2A3D),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: color,
            radius: 20,
            backgroundImage: imagePath != null ? AssetImage(imagePath!) : null,
            child: imagePath == null ? const Icon(Icons.person, color: Colors.black) : null,
          ),
          const SizedBox(width: 10),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                children: [
                  const Icon(Icons.star, color: Colors.white, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    rating,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ],
          ),
          const Spacer(),
          IconButton(
            icon: const Icon(Icons.call, color: Colors.pinkAccent),
            onPressed: () {
              // Action for call button
            },
          ),
        ],
      ),
    );
  }
}
