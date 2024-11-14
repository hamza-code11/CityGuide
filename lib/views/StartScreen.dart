import 'dart:async';
import 'dart:ui';
import 'package:cityguid/colors/Colors.dart';
import 'package:cityguid/image/Images.dart';
import 'package:cityguid/views/SplashScreen.dart';
import 'package:flutter/material.dart';


class Startscreen extends StatefulWidget {
  const Startscreen({super.key});
  @override
  State<Startscreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<Startscreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).push(_createBlurTransition());
    });
  }

  PageRouteBuilder _createBlurTransition() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>
          const Splashscreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        return Stack(
          children: [
            // Apply blur effect to the previous screen
            BackdropFilter(
              filter: ImageFilter.blur(
                sigmaX: animation.value * 5,
                sigmaY: animation.value * 5,
              ),
              child: FadeTransition(
                opacity: Tween<double>(begin: 1.0, end: 0.0).animate(animation),
                child: child,
              ),
            ),
            // Fade in the new page
            FadeTransition(
              opacity: animation,
              child: child,
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.titleHeading,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.only(top: 150),
        child: Column(
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image(image: AssetImage(ImagesPath.logo)),
            const SizedBox(height: 10),
            const Text(
              "Medak City Guide",
              style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(height: 10),
            const Text(
              "Your search end here",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w400,
                  color: Colors.white),
            ),
            const SizedBox(height: 130),
            Align(
              alignment: Alignment.bottomCenter,
              child: Opacity(
                opacity: 0.4, // Set the desired opacity level here
                child: SizedBox(
                  width: MediaQuery.of(context).size.width, // Full screen width
                  child: Image(
                    image: AssetImage(ImagesPath.login1),
                    fit: BoxFit
                        .cover, // Ensures the image covers the width and scales proportionally
                  ),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
