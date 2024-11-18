import 'package:cityguid/colors/Colors.dart';
import 'package:cityguid/conrtrollers/LoginController.dart';
import 'package:cityguid/views/SignupScreen.dart';
import 'package:cityguid/widgets/CustomButtom.dart';
import 'package:cityguid/widgets/LoginSignupTextField.dart';
import 'package:cityguid/widgets/SocialLoginButton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginscreen extends StatelessWidget {
  const Loginscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Scaffold(
      backgroundColor: CustomColors.LoginSignupbackColor,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          Text(
              "Login",
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
                      controller.togglePasswordVisibility(); // Call the toggle function
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
            // Forgot Password Text
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot your password?",
                style: GoogleFonts.inter(color: Colors.grey),
              ),
            ),
            SizedBox(
              height: Get.height * 0.04,
            ),
            // Continue Button
            CustomButton(
              text: "Login",
              onPressed: () {
                controller.signIn();
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
                  "Dont have have an account",
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
                            builder: (context) => const Signupscreen()));
                  },
                  child: Text(
                    "Sign Up",
                    style: GoogleFonts.inter(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),

            // Social Login Options
            // Divider(color: Colors.grey[800]),
            Row(
              children: [
                Expanded(child: Divider(color: Colors.grey)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8),
                  child:
                      Text("or", style: GoogleFonts.inter(color: Colors.grey)),
                ),
                Expanded(child: Divider(color: Colors.grey)),
              ],
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Socialloginbutton(
              icon: Icons.facebook,
              label: "Continue with Facebook",
              color: Colors.blue,
              onPressed: () {},
              borderColor: Colors.blue,
              borderWidth: 1,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),

            Socialloginbutton(
              icon: Icons.g_mobiledata,
              label: "Continue with Google",
              color: Colors.red,
              onPressed: () {},
              borderColor: Colors.red,
              borderWidth: 1,
            ),
            SizedBox(
              height: Get.height * 0.02,
            ),

            Socialloginbutton(
              icon: Icons.apple,
              label: "Continue with Apple",
              color: Colors.grey,
              onPressed: () {},
              borderColor: Colors.grey,
              borderWidth: 1,
            ),
          ],
        ),
      ),
    );
  }
}
