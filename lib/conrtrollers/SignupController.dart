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
  final user = FirebaseAuth.instance.currentUser;

  final String uid = Timestamp.now().nanoseconds.toString();

  void isToggle() {
    isObsecure.value = !isObsecure.value;
  }

  void signup() {
    auth
        .createUserWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passController.text.trim())
        .then((value) async {
      await FirebaseFirestore.instance
          .collection("User")
          .doc(emailController.text.trim())
          .set({
        "email": emailController.text.trim(),
        "password": passController.text.trim(),
      });
      Get.snackbar("Success", "User Registration.");
      update();
      Get.to(() => const Loginscreen());
    }).onError((error, stacktrace) {
      log("Error: $error");
      log("Stacktrace: $stacktrace");
      Get.snackbar("Error", error.toString()); // Show the actual error message
    });
  }
}
