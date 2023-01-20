import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TimeWidget extends StatelessWidget {
  const TimeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          '1996',
          textAlign: TextAlign.center,
          style: GoogleFonts.lora(
              fontSize: 60,
              color: const Color(0xFF55371f),
              fontWeight: FontWeight.w500),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 220),
          child: Text(
            'since',
            textAlign: TextAlign.left,
            style: GoogleFonts.lora(
                fontSize: 10,
                color: const Color(0xFF55371f),
                fontWeight: FontWeight.w100),
          ),
        ),
      ],
    );
  }
}
