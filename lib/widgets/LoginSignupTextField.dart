import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Loginsignuptextfield extends StatelessWidget {
  final bool obscureText;
  final String hinttext;
  final Color hintTextColor;
  final double borderRadius;
  final Color borderSideColor;
  final Color textColor;
  final Widget? suffixIcon;
  final TextEditingController controller;

  const Loginsignuptextfield({
    super.key,
    this.obscureText = false, 
    required this.hinttext,
    required this.controller,
    this.hintTextColor = const Color.fromARGB(255, 253, 253, 253),
    this.borderRadius = 12.0,
    this.borderSideColor = const Color(0xff0D986A),
    this.textColor = Colors.white,
    this.suffixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          obscureText: obscureText, 
          style: TextStyle(color: textColor),
          decoration: InputDecoration(
            filled: true,
            fillColor: Colors.transparent,
            hintText: hinttext,
            hintStyle: GoogleFonts.inter(
              fontSize: 12,
              color: hintTextColor,
              fontWeight: FontWeight.w300,
            ),
            suffixIcon: suffixIcon,
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderSideColor,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(borderRadius),
              borderSide: BorderSide(
                color: borderSideColor,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
