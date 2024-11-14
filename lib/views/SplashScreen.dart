
import 'package:cityguid/colors/Colors.dart';
import 'package:cityguid/image/Images.dart';
import 'package:cityguid/views/SplashScreen2.dart';
import 'package:flutter/material.dart';

class Splashscreen extends StatelessWidget {
  const Splashscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundsplash,
      body: SafeArea(
        //child: Padding(padding: const EdgeInsets.symmetric(horizontal:15, vertical: 70),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                  left: 15, right: 15, top: 80, bottom: 10),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Image.asset(ImagesPath.logoonboarding),
                    const Text(
                      "Skip",
                      style: TextStyle(
                          fontSize: 19,
                          fontWeight: FontWeight.w300,
                          color: Color.fromARGB(255, 135, 130, 130)),
                    )
                  ]),
            ),
            const SizedBox(height: 10),
            Row(children: [
              Image.asset(
                ImagesPath.onboard,
                fit: BoxFit.fitWidth,
                width: 412,
              ),
              const SizedBox(height: 100),
            ]),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "Poular Places",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "in Madak",
                    style: TextStyle(
                        fontSize: 50,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "Lorem  Ipsum  is  simply  dummy  text  of the",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 135, 130, 130)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "printing  and  typesetting   industry. Lorem",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 135, 130, 130)),
                  )
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Row(
                children: [
                  Text(
                    "Ipsum  has  been  the  industry's  standard",
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w100,
                        color: Color.fromARGB(255, 135, 130, 130)),
                  )
                ],
              ),
            ),
          ],

          //  ),
        ),
      ),
      floatingActionButton: Stack(
        alignment: Alignment.center,
        children: [
          CustomPaint(
            size: const Size(70, 70),
            painter: HalfCirclePainter(),
          ),
          FloatingActionButton(
            onPressed: () {
              Navigator.push(
                context,
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const Splashscreen2(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) {
                    const begin = Offset(
                        1.0, 0.0); // Start position: Slide in from the right
                    const end =
                        Offset.zero; // End position: Center of the screen
                    final tween = Tween(begin: begin, end: end);
                    final offsetAnimation = animation.drive(tween);

                    return SlideTransition(
                      position: offsetAnimation,
                      child: child,
                    );
                  },
                ),
              );
            },
            backgroundColor: Colors.white,
            shape: const CircleBorder(),
            child: const Icon(
              Icons.arrow_forward,
              color: Colors.pink,
            ),
          ),
        ],
      ),
    );
  }
}

class HalfCirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.pink
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    // Define the part of the circle to be drawn
    const startAngle = -7.14 / 4; // Start a little before the top center
    const sweepAngle = 4.14 / 2; // Sweep a quarter circle

    final rect = Rect.fromCircle(
        center: Offset(size.width / 2, size.height / 2), radius: 35);

    canvas.drawArc(rect, startAngle, sweepAngle, false, paint

        //         floatingActionButton: FloatingActionButton(
        //   onPressed: () {
        //   },
        //   backgroundColor: Colors.white,
        //   child: const Icon(
        //     Icons.arrow_forward,
        //   ),
        // ),
        );
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
