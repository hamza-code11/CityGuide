import 'package:cityguid/image/Images.dart';
import 'package:flutter/material.dart';

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
            backgroundImage: imagePath != null ? AssetImage(ImagesPath.logo) : null,
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
