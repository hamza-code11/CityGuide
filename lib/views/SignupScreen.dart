import 'package:cityguid/colors/Colors.dart';
import 'package:cityguid/conrtrollers/SignupController.dart';
import 'package:cityguid/views/LoginScreen.dart';
import 'package:cityguid/widgets/CustomButtom.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../widgets/LoginSignupTextField.dart';

class Signupscreen extends StatelessWidget {
  const Signupscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    return Scaffold(
      backgroundColor: CustomColors.LoginSignupbackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Sign Up",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            // Email Text Field
            Loginsignuptextfield(
              controller: controller.emailController,
              hinttext: "Email",
              hintTextColor: Colors.grey,
              borderRadius: 8,
              borderSideColor: Colors.white60,
              textColor: Colors.white,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            // pass Text Field
            Obx(() => Loginsignuptextfield(
                  obscureText:
                      controller.isObsecure.value, // Use the observable value
                  controller: controller.passController,
                  hinttext: "Password",
                  hintTextColor: Colors.grey,
                  borderRadius: 8,
                  borderSideColor: Colors.white60,
                  textColor: Colors.white,
                  suffixIcon: IconButton(
                    onPressed: () {
                      controller.isToggle(); // Call the toggle function
                    },
                    icon: Icon(
                      controller.isObsecure.value
                          ? Icons.visibility
                          : Icons.visibility_off,
                      color: Colors.grey,
                    ),
                  ),
                )),

            SizedBox(
              height: Get.height * 0.01,
            ),

            SizedBox(
              height: Get.height * 0.04,
            ),
            // Continue Button
            CustomButton(
              text: "Sign Up",
              onPressed: () {
                controller.signup();
              },
              backgroundColor: Colors.blue,
              textColor: Colors.white,
              borderRadius: 8.0,
              elevation: 4.0,
              padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 32.0),
            ),

            // "Do not have an account?" Text
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Do you have an account",
                  style: GoogleFonts.inter(
                    color: Colors.grey,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Loginscreen()));
                  },
                  child: Text(
                    "Sign In",
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
