import 'dart:math';

import 'package:architecture/src/widgets/aboutus_widget.dart';
import 'package:architecture/src/widgets/person_widget.dart';
import 'package:architecture/src/widgets/project_widget.dart';
import 'package:architecture/src/widgets/time_widget.dart';
import 'package:architecture/src/widgets/title_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          centerTitle: true,
          elevation: 0,
          title: Text(
            'arc',
            style: GoogleFonts.lora(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w300,
            ),
          ),
          backgroundColor: Colors.transparent,
          leading: Transform.rotate(
              angle: 90 * pi / 180,
              child: const Icon(
                Icons.drag_indicator,
                color: Colors.black,
              ))),
      body: Stack(
        children: [
          const TitleWidget(),
          const Positioned(top: 0, left: 0, right: 0, child: PersonWidget()),
          Positioned(
              top: size.height / 2.22,
              left: -125,
              right: 0,
              child: const TimeWidget()),
          const AboutUsWidget(),
          const ProjectWidget()
        ],
      ),
    );
  }
}
