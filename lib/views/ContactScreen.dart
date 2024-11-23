import 'package:cityguid/conrtrollers/ContactController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../colors/Colors.dart';

class Contactscreen extends StatelessWidget {
  Contactscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Contactcontroller());
    return Scaffold(
      backgroundColor: CustomColors.LoginSignupbackColor,
      appBar: AppBar(
        backgroundColor: CustomColors.LoginSignupbackColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Get.back(),
        ),
        title: Text(
          'Contact Us',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Card(
              color: Colors.grey[850],
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              elevation: 6,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Let’s Connect and Make Something Great Together!",
                      style: TextStyle(
                        color: Colors.tealAccent,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Feel free to reach out to us by filling out the form below. We\'ll get back to you shortly!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 16,
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Name Field
                    TextField(
                      controller: controller.username,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Full Name',
                        labelStyle: const TextStyle(
                          color: Colors.tealAccent,
                          fontSize: 16, // Larger label font size
                        ),
                        hintText: 'Enter your full name',
                        hintStyle: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14, // Smaller hint font size
                        ),
                        filled: true,
                        fillColor: Colors.grey[800],
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, // Reduce field height
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Email Field
                    TextField(
                      controller: controller.useremail,
                      style: const TextStyle(color: Colors.white),
                      decoration: InputDecoration(
                        labelText: 'Email Address',
                        labelStyle: const TextStyle(
                          color: Colors.tealAccent,
                          fontSize: 16, // Larger label font size
                        ),
                        hintText: 'Enter your email address',
                        hintStyle: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14, // Smaller hint font size
                        ),
                        filled: true,
                        fillColor: Colors.grey[800],
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, // Reduce field height
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    // Message Field
                    TextField(
                      controller: controller.usermsg,
                      style: const TextStyle(color: Colors.white),
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: 'Message',
                        labelStyle: const TextStyle(
                          color: Colors.tealAccent,
                          fontSize: 16, // Larger label font size
                        ),
                        hintText: 'Write your message here',
                        hintStyle: const TextStyle(
                          color: Colors.white60,
                          fontSize: 14, // Smaller hint font size
                        ),
                        filled: true,
                        fillColor: Colors.grey[800],
                        contentPadding: const EdgeInsets.symmetric(
                          vertical: 12, // Reduce field height
                          horizontal: 16,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                    const SizedBox(height: 30),
                    // Submit Button
                    Center(
                      child: ElevatedButton(
                        onPressed: () {
                          controller.addPost();
                        },
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 50, vertical: 15),
                          backgroundColor: Colors.tealAccent,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          elevation: 5,
                        ),
                        child: const Text(
                          'Submit',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
