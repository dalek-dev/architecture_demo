import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BottomDescription extends StatefulWidget {
  final String description;
  final bool isLeft;
  final bool isThrough;
  VoidCallback? isPressed;
  BottomDescription(
      {required this.description,
      this.isPressed,
      this.isLeft = false,
      this.isThrough = false,
      super.key});

  @override
  State<BottomDescription> createState() => _BottomDescriptionState();
}

class _BottomDescriptionState extends State<BottomDescription> {
  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 75,
      left: widget.isLeft ? 25 : null,
      right: !widget.isLeft ? 25 : null,
      child: GestureDetector(
        onTap: widget.isPressed,
        child: Container(
          child: Text(
            widget.description,
            style: GoogleFonts.lora(
              color: const Color(0xFF55371f),
              fontSize: 14,
              fontWeight: FontWeight.w500,
              decoration: widget.isThrough
                  ? TextDecoration.lineThrough
                  : TextDecoration.underline,
            ),
          ),
        ),
      ),
    );
  }
}
