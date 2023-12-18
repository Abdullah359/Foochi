import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../model/content_model.dart';

class CustomTextButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String text;
  final Color? color;
  final double? fontSize;
  const CustomTextButton({
    required this.onPressed,
    required this.text,
    this.fontSize,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      style: TextButton.styleFrom(padding: EdgeInsets.zero),
      child: Text(
        text,
        style: GoogleFonts.poppins(
            color: color ?? AppColors.kPrimary, fontSize: 14),
      ),
    );
  }
}
