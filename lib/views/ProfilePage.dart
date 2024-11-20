import 'package:cityguid/views/IndexScreen.dart';
import 'package:cityguid/views/LoginScreen.dart';
import 'package:flutter/material.dart';
import '../widgets/CustomButtom.dart';

class Profilepage extends StatelessWidget {
  final String email;
  final String password;

  const Profilepage({required this.email, required this.password, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            children: [
              Stack(
                clipBehavior: Clip.none, // Allows the CircleAvatar to overflow
                children: [
                  // Cover Image Container
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
                  // Back Arrow Button
                  Positioned(
                    top: 20, // Adjust for vertical alignment
                    left: 10, // Adjust for horizontal alignment
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.black
                            .withOpacity(0.7), // Black background with opacity
                        shape: BoxShape.circle, // Circular button
                        boxShadow: [
                          BoxShadow(
                            color:
                                Colors.black.withOpacity(0.5), // Shadow color
                            blurRadius: 8.0, // Glow effect
                            spreadRadius: 2.0, // Spread effect
                            offset:
                                const Offset(0, 3), // Slight vertical shadow
                          ),
                        ],
                      ),
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        iconSize: 28, // Icon size
                        onPressed: () {
                          Navigator.pop(context); // Navigate back
                        },
                      ),
                    ),
                  ),
                  // Profile Image
                  Positioned(
                    top: MediaQuery.of(context).size.height *
                        0.2, // Keeps vertical alignment
                    left: (MediaQuery.of(context).size.width / 2) -
                        70, // Centers horizontally
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
                email, // Dynamically display email
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              Text(
                password, // Dynamically display password
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),

              const SizedBox(height: 50),
              // Buttons
              // buildProfileButton(context, "Jobs", Icons.work),
              // buildProfileButton(context, "Bus timings", Icons.directions_bus),
              // buildProfileButton(context, "Realestate", Icons.home),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomButton(
                      text: "Home Screen",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Indexscreen(
                              email: email, // Pass email
                              password: password, // Pass password
                            ),
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
                  ],
                ),
              ),

              const SizedBox(height: 15),

              // Padding(
              //   padding: const EdgeInsets.symmetric(horizontal: 25),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       Container(
              //         decoration: BoxDecoration(
              //           border: Border.all(
              //               color: Colors.blue,
              //               width: 2.0), // Border color and width
              //           borderRadius:
              //               BorderRadius.circular(8.0), // Same radius as button
              //         ),
              //         child: CustomButton(
              //           text: "Edite Profile",
              //           onPressed: () {
              //             // Navigate to Edit Profile page
              //             // Navigator.push(
              //             //   context,
              //             //   MaterialPageRoute(
              //             //     builder: (context) => EditProfilePage(
              //             //         email: email, password: password),
              //             //   ),
              //             // );
              //           },
              //           backgroundColor: CustomColors.LoginSignupbackColor,
              //           textColor: Colors.white,
              //           borderRadius: 8.0,
              //           elevation: 4.0,
              //           padding:
              //               EdgeInsets.symmetric(vertical: 10, horizontal: 100),
              //         ),
              //       ),
              //     ],
              //   ),
              // ),

              // Support Text
              TextButton(
                onPressed: () {},
                child: const Text(
                  "You need support? Contact Us",
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ),
              // Logout Button
              const SizedBox(height: 50),

              TextButton(
                onPressed: () {
                  // Show the logout confirmation dialog
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Are you sure you want to logout?'),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('Cancel'),
                            onPressed: () {
                              Navigator.of(context)
                                  .pop(); // Close the dialog without logging out
                            },
                          ),
                          TextButton(
                            child: const Text('OK'),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const Loginscreen()));
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                child: const Text(
                  "Logout",
                  style: TextStyle(
                    color: Colors.redAccent,
                    fontSize: 16,
                  ),
                ),
              ),

              // TextButton(
              //   onPressed: () {},
              //   child: const Text(
              //     "Logout",
              //     style: TextStyle(
              //       color: Colors.redAccent,
              //       fontSize: 16,
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      backgroundColor: const Color(0xFF1A1A1A),
    );
  }

  Widget buildProfileButton(BuildContext context, String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: ElevatedButton.icon(
        style: ElevatedButton.styleFrom(
          iconColor: Colors.pinkAccent,
          minimumSize: const Size(double.infinity, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        onPressed: () {},
        icon: Icon(icon, color: Colors.white),
        label: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
