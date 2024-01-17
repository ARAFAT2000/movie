import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class modified_Text extends StatelessWidget {
  final String text;
  final double size;
   modified_Text({super.key, required this.text, required this.size});


  @override
  Widget build(BuildContext context) {
    return Text(text,style: GoogleFonts.breeSerif(
     fontSize: size
    ),);
  }
}
