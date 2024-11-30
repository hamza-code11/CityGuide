import 'package:cityguid/views/IndexScreen.dart';
import 'package:cityguid/views/LoginScreen.dart';
import 'package:cityguid/views/settingScreen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Firebase Auth import
import 'package:google_fonts/google_fonts.dart';
import '../widgets/CustomButtom.dart';

class Profilepage extends StatelessWidget {
  const Profilepage({super.key});

  @override
  Widget build(BuildContext context) {
    // Get current user
    final User? user = FirebaseAuth.instance.currentUser;

    // If user is null, show "Guest" as default
    final String email = user?.email ?? "Guest";

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                // Cover Image
                Container(
                  height: MediaQuery.of(context).size.height * 0.25,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                      bottomRight: Radius.circular(100),
                    ),
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage("assets/images/Coveriamge.png"),
                    ),
                  ),
                ),
                // Back Button
                Positioned(
                  top: 40,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
                // Back Button
                Positioned(
                  top: 40,
                  left: 10,
                  child: Container(
                    width: 40, // Circle width
                    height: 40, // Circle height
                    decoration: BoxDecoration(
                      color: Colors.black
                          .withOpacity(0.5), // Black with reduced opacity
                      shape: BoxShape.circle, // Circle shape
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.5), // Shadow color
                          blurRadius: 4, // Shadow blur radius
                          offset: Offset(0, 2), // Shadow position
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.arrow_back, color: Colors.white),
                      onPressed: () => Navigator.pop(context),
                      iconSize: 20, // Adjust icon size
                    ),
                  ),
                ),

                // Profile Image
                Positioned(
                  top: MediaQuery.of(context).size.height * 0.18,
                  left: MediaQuery.of(context).size.width * 0.5 - 70,
                  child: const CircleAvatar(
                    radius: 70,
                    backgroundImage: AssetImage("assets/images/ManImage.png"),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 100),
            // User Info
            Text(
              email, // Display user email
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const Text(
              "********", // Placeholder for password
              style: TextStyle(fontSize: 16, color: Colors.white70),
            ),
            const SizedBox(height: 50),
            // Home Button
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25),
              child: CustomButton(
                text: "Home Screen",
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Indexscreen(),
                    ),
                  );
                },
                backgroundColor: Colors.blue,
                textColor: Colors.white,
                borderRadius: 8.0,
                elevation: 4.0,
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 105),
              ),
            ),
            const SizedBox(height: 15),
            // Support Text
            TextButton(
              onPressed: () {},
              child: const Text(
                "You need support? Contact Us",
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
            const SizedBox(height: 50),
            // Logout Button
            TextButton(
              onPressed: () => _showLogoutDialog(context),
              child: const Text(
                "Logout",
                style: TextStyle(
                  color: Colors.redAccent,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: const Color(0xFF1A1A1A),
    );
  }

  // Logout Confirmation Dialog
  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?'),
          actions: <Widget>[
            TextButton(
              child: const Text('Cancel'),
              onPressed: () => Navigator.of(context).pop(),
            ),
            TextButton(
              child: const Text('OK'),
              onPressed: () {
                FirebaseAuth.instance.signOut(); // Sign out from Firebase
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const Loginscreen()),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
