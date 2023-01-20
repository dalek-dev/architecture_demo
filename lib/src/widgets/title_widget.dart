import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TitleWidget extends StatefulWidget {
  const TitleWidget({super.key});

  @override
  State<TitleWidget> createState() => _TitleWidgetState();
}

class _TitleWidgetState extends State<TitleWidget>
    with TickerProviderStateMixin {
  late AnimationController _animationTitleController;
  late Animation<double> _animationTitle;

  final someNotifier = ValueNotifier<bool>(false);
  @override
  void initState() {
    super.initState();
    _animationTitleController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animationTitle =
        Tween<double>(begin: 0, end: 1).animate(_animationTitleController);
  }

  @override
  void dispose() {
    _animationTitleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Positioned(
      top: size.height / 4,
      left: 0,
      right: 0,
      child: Column(
        children: [
          Text(
            'architecture',
            textAlign: TextAlign.center,
            style: GoogleFonts.lora(
                fontSize: 50,
                color: Colors.grey.withOpacity(0.5),
                fontWeight: FontWeight.w500),
          ),
          Text(
            'studio',
            textAlign: TextAlign.center,
            style: GoogleFonts.lora(
                fontSize: 50,
                color: Colors.grey.withOpacity(0.5),
                fontWeight: FontWeight.w100),
          ),
        ],
      ),
    );
  }
}
