import 'dart:developer';
import 'package:cityguid/views/LoginScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  var isObsecure = true.obs;
  var isloading = false.obs;

  final emailController = TextEditingController();
  final passController = TextEditingController();

  final FirebaseAuth auth = FirebaseAuth.instance;

  void isToggle() {
    isObsecure.value = !isObsecure.value;
  }

  void signup() async {
    try {
      // Create a user with Firebase Authentication
      UserCredential userCredential = await auth.createUserWithEmailAndPassword(
        email: emailController.text.trim(),
        password: passController.text.trim(),
      );

      // Get the unique user ID (uid) from Firebase Authentication
      String uid = userCredential.user?.uid ?? "";

      // Save user data to Firestore
      await FirebaseFirestore.instance.collection("User").doc(uid).set({
        "id": uid, // Save the unique ID
        "email": emailController.text.trim(),
        "password": passController.text.trim(), // Avoid plaintext passwords in production
        "createdAt": FieldValue.serverTimestamp(), // Timestamp for record creation
      });

      Get.snackbar("Success", "User registered successfully.");
      Get.to(() => const Loginscreen());
    } catch (error) {
      log("Error: $error");
      Get.snackbar("Error", error.toString());
    }
  }
}
