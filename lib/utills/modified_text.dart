import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class modified_text extends StatelessWidget {

  final String text;
  final Color color;
  final double size;
  final TextOverflow textOverflow;

  const modified_text({Key? key, required this.text,  this.color = Colors.white,  this.size = 12,  this.textOverflow = TextOverflow.ellipsis}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.poppins(
        color: color,
        fontSize: size,

      ),
    );
  }
}
