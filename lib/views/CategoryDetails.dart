import 'package:cityguid/conrtrollers/ReviewController.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class CategoryDetails extends StatefulWidget {
  final String imagePath;
  final String address;
  final String name;
  final double rating;
  final String distance;

  const CategoryDetails({
    super.key,
    required this.imagePath,
    required this.address,
    required this.name,
    required this.rating,
    required this.distance,
  });

  @override
  _CategoryDetailsState createState() => _CategoryDetailsState();
}

class _CategoryDetailsState extends State<CategoryDetails> {
  double userRating = 0.0; // To hold the user's rating value
  final TextEditingController _reviewController = TextEditingController();
  final ReviewController _reviewControllerInstance =
      Get.put(ReviewController());
  final CollectionReference reviewsCollection =
      FirebaseFirestore.instance.collection('Reviews');

  // Submit a new review to Firestore
  void _submitReview() async {
    final reviewText = _reviewController.text.trim();
    if (reviewText.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Review cannot be empty!',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
      return;
    }

    try {
      // Fetch the current user's name
      final user = FirebaseAuth.instance.currentUser;

      // Attempt to use displayName from Firebase Authentication
      String reviewerName = user?.displayName ?? "Anonymous";

      // If displayName is not set, fetch the username from Firestore
      if (reviewerName == "Anonymous" && user != null) {
        final doc = await FirebaseFirestore.instance
            .collection("User")
            .doc(user.uid)
            .get();
        if (doc.exists) {
          reviewerName = doc.data()?["username"] ?? "Anonymous";
        }
      }

      // Add review to Firestore
      _reviewControllerInstance.addReview(
        reviewerName, // Use the retrieved username
        reviewText,
        userRating.toInt(),
      );

      // Clear the input field and show success feedback
      _reviewController.clear();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Review submitted successfully!',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Failed to submit review. Try again.',
            style: GoogleFonts.poppins(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  void dispose() {
    _reviewController.dispose(); // Dispose the controller to free resources
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1c1b22),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Image with overlay
              Stack(
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(widget.imagePath),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  Container(
                    height: 300,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Colors.transparent, Color(0xFF1c1b22)],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 40,
                    left: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.black54,
                      child: IconButton(
                        icon: const Icon(Icons.arrow_back, color: Colors.white),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      ),
                    ),
                  ),
                ],
              ),

              // Details Section
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.name,
                      style: GoogleFonts.poppins(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 18),
                        const SizedBox(width: 4),
                        Text(
                          widget.rating.toString(),
                          style: GoogleFonts.poppins(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      widget.address,
                      style: GoogleFonts.poppins(
                        fontSize: 14,
                        color: Colors.white70,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Rating Section
                    Text(
                      "Rate this hospital",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    RatingBar.builder(
                      initialRating: userRating,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: true,
                      itemCount: 5,
                      itemPadding: const EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      itemSize: 28,
                      unratedColor:
                          Colors.white, // Default color for unrated stars
                      itemBuilder: (context, _) => const Icon(
                        Icons.star,
                        color: Colors.amber, // Color for rated stars
                      ),
                      onRatingUpdate: (rating) {
                        setState(() {
                          userRating = rating;
                        });
                      },
                    ),

                    const SizedBox(height: 20),

                    // Reviews Section
                    Text(
                      "Reviews",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),

                    // Dynamically fetch and display reviews
                    StreamBuilder<QuerySnapshot>(
                      stream: reviewsCollection.snapshots(),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return const Center(
                            child:
                                CircularProgressIndicator(color: Colors.teal),
                          );
                        }

                        if (snapshot.hasError) {
                          return Text(
                            'Failed to load reviews.',
                            style: GoogleFonts.poppins(color: Colors.redAccent),
                          );
                        }

                        if (!snapshot.hasData || snapshot.data!.docs.isEmpty) {
                          return Text(
                            'No reviews yet.',
                            style: GoogleFonts.poppins(color: Colors.white70),
                          );
                        }

                        return Column(
                          children: snapshot.data!.docs.map((doc) {
                            final review = doc.data() as Map<String,
                                dynamic>; // Access Firestore data
                            return ReviewCard(
                              reviewId:
                                  doc.id, // Use doc.id to get the document ID
                              name: review['reviewerName'] ?? 'Anonymous',
                              date: review['timestamp'] ?? '',
                              comment: review['reviewText'] ?? '',
                              likes: review['likes'] ?? 0,
                              likedBy:
                                  List<String>.from(review['likedBy'] ?? []),
                            );
                          }).toList(),
                        );
                      },
                    ),
                    const SizedBox(height: 20),

                    // Write a Review Section
                    Text(
                      "Write a review",
                      style: GoogleFonts.poppins(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        // Review TextField
                        Expanded(
                          child: TextField(
                            controller: _reviewController,
                            maxLines: 1,
                            style: GoogleFonts.poppins(
                              color: Colors.white,
                              fontSize: 14, // Adjust font size for input text
                            ),
                            decoration: InputDecoration(
                              suffixIcon: GestureDetector(
                                onTap: _submitReview, // Submit review on click
                                child:
                                    const Icon(Icons.send, color: Colors.teal),
                              ),
                              hintText: "Write your review...",
                              hintStyle: GoogleFonts.poppins(
                                color: Colors.white70,
                                fontSize:
                                    14, // Adjust font size for the hint text
                              ),
                              filled: true,
                              fillColor: const Color(0xFF3E3A47),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                                borderSide: BorderSide.none,
                              ),
                              contentPadding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 12,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar:
            BottomNavigationBarWidget(address: widget.address));
  }
}

// Bottom Navigation Bar with Call, WhatsApp, and Direction
class BottomNavigationBarWidget extends StatelessWidget {
  final String address;

  const BottomNavigationBarWidget({super.key, required this.address});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF29252c), Color(0xFF1c1b22)],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Call Button
          ActionButton(
            icon: Icons.call,
            label: "Call",
            onTap: () async {
              const phone = "tel:+1234567890"; // Update with dynamic data
              if (await canLaunchUrl(Uri.parse(phone))) {
                await launchUrl(Uri.parse(phone));
              }
            },
          ),

          // WhatsApp Button
          ActionButton(
            icon: Icons.chat,
            label: "WhatsApp",
            onTap: () async {
              const whatsapp =
                  "https://wa.me/1234567890?text=Hello"; // Update with dynamic data
              if (await canLaunchUrl(Uri.parse(whatsapp))) {
                await launchUrl(Uri.parse(whatsapp));
              }
            },
          ),

          // Direction Button
          ElevatedButton.icon(
            onPressed: () {
              redirectToGoogleMaps(address);
            },
            icon: const Icon(Icons.send, color: Colors.teal, size: 18),
            label: Text(
              "Direction",
              style: GoogleFonts.poppins(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.teal,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Generic Action Button
class ActionButton extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback onTap;

  const ActionButton({
    super.key,
    required this.icon,
    required this.label,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: onTap,
      icon: Icon(icon, color: Colors.teal, size: 18),
      label: Text(
        label,
        style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.teal,
        ),
      ),
      style: ElevatedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}

// Chip Widget for Services
class ServiceChip extends StatelessWidget {
  final String label;

  const ServiceChip({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(
        label,
        style: GoogleFonts.poppins(fontSize: 12, color: Colors.white),
      ),
      backgroundColor: Colors.tealAccent,
    );
  }
}

class ReviewCard extends StatefulWidget {
  final String reviewId;
  final String name;
  final String date;
  final String comment;
  final int likes;
  final List likedBy;

  const ReviewCard({
    super.key,
    required this.reviewId,
    required this.name,
    required this.date,
    required this.comment,
    required this.likes,
    required this.likedBy,
  });

  @override
  _ReviewCardState createState() => _ReviewCardState();
}

class _ReviewCardState extends State<ReviewCard> {
  late int _likes;
  late bool _isLiked;
  final String userId = FirebaseAuth.instance.currentUser!.uid;

  @override
  void initState() {
    super.initState();
    _likes = widget.likes;
    _isLiked = widget.likedBy.contains(userId); // Check if user already liked
  }

  void _toggleLike() {
    setState(() {
      _isLiked = !_isLiked;
      _likes += _isLiked ? 1 : -1;

      // Update Firestore
      final reviewController = Get.find<ReviewController>();
      reviewController.toggleLike(widget.reviewId, userId, _isLiked);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: const Color(0xFF29252c),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // User Avatar
            CircleAvatar(
              radius: 24,
              backgroundColor: Colors.grey.shade700,
              child: const Icon(Icons.person, color: Colors.white),
            ),
            const SizedBox(width: 16),

            // Review Content
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Reviewer Name
                  Text(
                    widget.name,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),

                  // Review Date
                  Text(
                    widget.date,
                    style: GoogleFonts.poppins(
                      fontSize: 12,
                      color: Colors.white54,
                    ),
                  ),
                  const SizedBox(height: 8),

                  // Review Comment
                  Text(
                    widget.comment,
                    style: GoogleFonts.poppins(
                      fontSize: 14,
                      color: Colors.white70,
                    ),
                  ),
                ],
              ),
            ),

            // Like Button and Counter
            Column(
              children: [
                IconButton(
                  icon: Icon(
                    _isLiked ? Icons.favorite : Icons.favorite_border,
                    color: _isLiked ? Colors.redAccent : Colors.white54,
                  ),
                  onPressed: _toggleLike, // Call toggle like function
                ),
                Text(
                  '$_likes', // Display the number of likes
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    color: Colors.white70,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

// Helper: Redirect to Google Maps
void redirectToGoogleMaps(String address) async {
  final encodedAddress = Uri.encodeComponent(address);
  final url = "https://www.google.com/maps/search/?api=1&query=$encodedAddress";
  if (await canLaunchUrl(Uri.parse(url))) {
    await launchUrl(Uri.parse(url));
  }
}
