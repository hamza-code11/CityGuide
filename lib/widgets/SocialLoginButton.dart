import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Socialloginbutton extends StatelessWidget {
  final IconData icon;
  final String label;
  final Color color;
  final VoidCallback onPressed;
  final Color borderColor; 
  final double borderWidth; 

  const Socialloginbutton({
    required this.icon,
    required this.label,
    required this.color,
    required this.onPressed,
    this.borderColor = Colors.grey,
    this.borderWidth = 1.0, 
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity, 
      child: ElevatedButton.icon(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF1C1C1E), 
          padding: EdgeInsets.symmetric(vertical: 14),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          side: BorderSide(
              color: borderColor, width: borderWidth), 
        ),
        icon: Icon(icon, color: color),
        label: Text(
          label,
          style: TextStyle(fontFamily: "inter", color: Colors.white),
        ),
      ),
    );
  }
}
