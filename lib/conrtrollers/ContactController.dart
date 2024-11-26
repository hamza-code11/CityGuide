import 'dart:developer';

import 'package:cityguid/views/IndexScreen.dart';
import 'package:cityguid/views/settingScreen.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Contactcontroller extends GetxController {
  final username = TextEditingController();
  final useremail = TextEditingController();
  final usermsg = TextEditingController();
  var isloading = false.obs;
  final FirebaseAuth auth = FirebaseAuth.instance;
  final user = FirebaseAuth.instance.currentUser;

  final String uid = Timestamp.now().nanoseconds.toString();

  void addPost() async {
    final docId = uid;
    try {
      isloading.value = true;
      await FirebaseFirestore.instance.collection("Contact").doc(docId).set({
        'id': docId,
        'name': username.text.trim(),
        'email': useremail.text.trim(),
        'msg': usermsg.text.trim(),
      }).then((value) {
        isloading.value = false;
        Get.snackbar("Success", "Message has been Submited");
        update();
        Get.to(() => Indexscreen());
      });
    } catch (e) {
      log(e.toString());
      update();
    }
  }
}
