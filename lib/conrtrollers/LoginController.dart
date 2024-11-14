import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isObsecure = true.obs;
  final emailController = TextEditingController();
  final passController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;

  void isToggle(){
    isObsecure.value = !isObsecure.value;
  }

    void sigin() {
    auth
        .signInWithEmailAndPassword(
            email: emailController.text.trim(),
            password: passController.text.trim())
        .then((value) {
      Get.snackbar("Success", "Authnticate");
    }).onError((error, stractrace) {
      Get.snackbar("Error", error.toString());
    });
  }
  
}




