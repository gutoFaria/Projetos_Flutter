import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle textStyle(double size,
    [Color color = Colors.black, FontWeight fw = FontWeight.w600]) {
  return GoogleFonts.montserrat(fontSize: size, color: color, fontWeight: fw);
}
