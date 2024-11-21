import 'package:cityguid/views/BankScreen.dart';
import 'package:cityguid/views/HospitalScreen.dart';
import 'package:cityguid/views/ProfilePage.dart';
import 'package:cityguid/widgets/CategoryCard.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Indexscreen extends StatefulWidget {
  final String email;
  final String password;

  const Indexscreen({required this.email, required this.password, super.key});

  @override
  State<Indexscreen> createState() => _IndexscreenState();
}

class _IndexscreenState extends State<Indexscreen> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2a2831),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior:
                  Clip.none, // Allow overflow for the search bar and avatar
              children: [
                // Background container with image
                Container(
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/homeBg.png"),
                      fit: BoxFit.cover,
                    ),
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(25),
                      bottomRight: Radius.circular(25),
                    ),
                  ),
                ),

                // Avatar Image with Shadow and Glow
                Positioned(
                  top: 20,
                  right: 20,
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Profilepage(
                            email: widget.email,
                            password: widget
                                .password, // Pass the actual password, not dots
                          ),
                        ),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.5),
                            blurRadius: 15, // Controls shadow blur
                            spreadRadius: 2, // Controls shadow size
                            offset: const Offset(0, 5), // Shadow position
                          ),
                          BoxShadow(
                            color: Colors.white
                                .withOpacity(0.2), // Inner glow color
                            blurRadius: 10,
                            spreadRadius: -3,
                          ),
                        ],
                      ),
                      child: const CircleAvatar(
                        radius: 25,
                        backgroundImage: AssetImage(
                            "assets/images/ManImage.png"), // Replace with your avatar image
                      ),
                    ),
                  ),
                ),

                // Search bar container
                Positioned(
                  bottom: -40, // Adjust this for the desired overlap
                  left: 20,
                  right: 20,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(206, 28, 27, 31),
                      borderRadius: BorderRadius.circular(30),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.3),
                          blurRadius: 10,
                          offset: const Offset(0, 5),
                        ),
                      ],
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  hintText: 'Search here...',
                                  hintStyle:
                                      const TextStyle(color: Colors.white, fontSize: 24),
                                  prefixIcon: const Icon(Icons.search,
                                      color: Colors.white),
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
                          ],
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          'Category • Business entity',
                          style: TextStyle(color: Colors.white, fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 60.0,
                  left: 10.0,
                  right: 10.0,
                  bottom: 20), // Increased top padding
              child: GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 16,
                crossAxisSpacing: 16,
                children: [
                  CategoryCard(
                    title: 'Hospitals',
                    imagePath: 'assets/images/p1.jpg',
                      onTap: () {
                         Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => HospitalScreen()),
                          );
                      },
                  ),
                  CategoryCard(
                    title: 'Parks',
                    imagePath: 'assets/images/p2.jpg',
                     onTap: () {
                         Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => HospitalScreen()),
                          );
                      },
                  ),
                  CategoryCard(
                    title: 'Schools',
                    imagePath: 'assets/images/p3.jpg',
                     onTap: () {
                         Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => HospitalScreen()),
                          );
                      },
                  ),
                  CategoryCard(
                    title: 'Plumbers',
                    imagePath: 'assets/images/p4.jpg',
                     onTap: () {
                         Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => HospitalScreen()),
                          );
                      },
                  ),
                  CategoryCard(
                    title: 'Electricians',
                    imagePath: 'assets/images/p5.jpg',
                     onTap: () {
                         Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => HospitalScreen()),
                          );
                      },
                  ),
                  CategoryCard(
                    title: 'Hair Salon',
                    imagePath: 'assets/images/p6.jpg',
                     onTap: () {
                         Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => HospitalScreen()),
                          );
                      },
                  ),
                  CategoryCard(
                    title: 'Colleges',
                    imagePath: 'assets/images/p7.jpg',
                     onTap: () {
                         Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => HospitalScreen()),
                          );
                      },
                  ),
                  CategoryCard(
                    title: 'Banks',
                    imagePath: 'assets/images/p8.jpg',
                     onTap: () {
                         Navigator.push(
                            context,
                              MaterialPageRoute(builder: (context) => Bankscreen()),
                          );
                      },
                  ),
                ],
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
          padding:
              const EdgeInsets.only(bottom: 25, left: 8, right: 8, top: 10),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            type: BottomNavigationBarType.fixed,
            selectedItemColor: Colors.pinkAccent,
            unselectedItemColor: Colors.grey,
            showUnselectedLabels: true,
            selectedLabelStyle: GoogleFonts.inter(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            currentIndex: _selectedIndex,
            onTap: _onItemTapped,
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
