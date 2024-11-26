// import 'package:cityguid/views/IndexScreen.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';

// class LoginController extends GetxController {
//   var isObsecure = true.obs;
//   final emailController = TextEditingController();
//   final passController = TextEditingController();
//   FirebaseAuth auth = FirebaseAuth.instance;

//   void isToggle(){
//     isObsecure.value = !isObsecure.value;
//   }

//     void sigin() {
//     auth
//         .signInWithEmailAndPassword(
//             email: emailController.text.trim(),
//             password: passController.text.trim())
//         .then((value) {
//       Get.snackbar("Authnticate", "Login Successfully");
//       Get.to(() => const Indexscreen());

//     }).onError((error, stractrace) {
//       Get.snackbar("Error", error.toString());
//     });
//   }

// }

import 'package:cityguid/views/IndexScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LoginController extends GetxController {
  var isObsecure = true.obs; // Password visibility toggle
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final FirebaseAuth auth = FirebaseAuth.instance;

  void togglePasswordVisibility() {
    isObsecure.value = !isObsecure.value;
  }

  void signIn() {
    final email = emailController.text.trim();
    final password = passController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Email and password must not be empty");
      return;
    }

    auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((value) {
      Get.snackbar("Success", "Login Successfully");
      update();
      Get.to(() => Indexscreen(email: email, password: password));
    }).catchError((error) {
      Get.snackbar("Error", error.message ?? "Something went wrong");
    });
  }



  Future<void> saveUserData(String email, String password) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('password', password);
  }


  Future<Map<String, String?>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    return {'email': email, 'password': password};
  }



}
