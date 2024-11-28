import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class ReviewController extends GetxController {
  final TextEditingController reviewController = TextEditingController();
  final String formattedDate = DateFormat('yyyy-MM-dd').format(DateTime.now());
  var isloading = false.obs;

  // Add a review dynamically
  void addReview(String reviewerName, String reviewText, int rating) async {
    try {
      isloading.value = true;

      // Generate a unique ID for the review document
      String reviewId =
          FirebaseFirestore.instance.collection("Reviews").doc().id;

      // Save the review to the Firestore collection
      await FirebaseFirestore.instance.collection("Reviews").doc(reviewId).set({
        "reviewerName": reviewerName,
        "reviewText": reviewText,
        "rating": rating,
        "timestamp": formattedDate,
        "likes": 0, // Initialize with 0 likes
        "likedBy": [], // Empty array to track user IDs who likedF
      });

      Get.snackbar("Success", "Review added successfully.");
      reviewController.clear(); // Clear the input field after submission
    } catch (error) {
      log("Error adding review: $error");
      Get.snackbar("Error", "Failed to add review.");
    } finally {
      isloading.value = false;
    }
  }

  void toggleLike(String reviewId, String userId, bool isLiked) async {
    try {
      final reviewRef =
          FirebaseFirestore.instance.collection("Reviews").doc(reviewId);

      if (isLiked) {
        // User is liking the review
        await reviewRef.update({
          "likes": FieldValue.increment(1),
          "likedBy": FieldValue.arrayUnion([userId]), // Add user ID
        });
      } else {
        // User is unliking the review
        await reviewRef.update({
          "likes": FieldValue.increment(-1),
          "likedBy": FieldValue.arrayRemove([userId]), // Remove user ID
        });
      }
    } catch (error) {
      log("Error toggling like: $error");
    }
  }

  @override
  void onClose() {
    reviewController
        .dispose(); // Dispose the TextEditingController to free resources
    super.onClose();
  }
}
