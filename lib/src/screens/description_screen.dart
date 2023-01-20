import 'dart:math';

import 'package:architecture/src/providers/time_provider.dart';
import 'package:architecture/src/widgets/bottom_description.dart';
import 'package:architecture/src/widgets/person_widget.dart';
import 'package:architecture/src/widgets/time_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class DescriptionScreen extends StatefulWidget {
  const DescriptionScreen({super.key});

  @override
  State<DescriptionScreen> createState() => _DescriptionScreenState();
}

class _DescriptionScreenState extends State<DescriptionScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late AnimationController _animationTextController;
  late Animation<double> _animationTime;
  late Animation<double> _animationPerson;
  late Animation<double> _animationBackground;
  late Animation<double> _animationOptions;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animationTextController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 500));
    _animationTime =
        Tween<double>(begin: 0, end: 1).animate(_animationController);
    _animationBackground =
        Tween<double>(begin: 0, end: 777).animate(_animationController);
    _animationPerson =
        Tween<double>(begin: 1, end: 0.9).animate(_animationController);
    _animationOptions =
        Tween<double>(begin: 0, end: 1).animate(_animationTextController);
    _animationController.forward();
    Future.delayed(const Duration(seconds: 2), (() {
      _animationTextController.forward();
    }));
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => TimeProvider(),
        ),
      ],
      child: Scaffold(
        body: Stack(
          children: [
            Positioned(
                top: 115,
                left: 0,
                right: 0,
                child: AnimatedBuilder(
                    animation: _animationController,
                    builder: (context, child) {
                      return Transform.scale(
                          scale: _animationPerson.value,
                          child: const PersonWidget());
                    })),
            Positioned(
              top: size.height / 2 + 69,
              left: -125,
              right: 0,
              child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.translate(
                        offset: Offset(0, -(_animationTime.value * 40)),
                        child: Opacity(
                            opacity: 1 - _animationTime.value,
                            child: const TimeWidget()));
                  }),
            ),
            Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Center(
                      child: Container(
                        height: _animationBackground.value,
                        width: 450,
                        color: const Color(0xFFf1f0f2).withOpacity(0.6),
                      ),
                    );
                  }),
            ),
            BottomDescription(
              description: 'about us',
              isThrough: true,
              isLeft: true,
            ),
            Positioned(
              bottom: 75,
              right: 50,
              child: AnimatedBuilder(
                animation: _animationTextController,
                builder: ((context, child) {
                  return Transform.translate(
                    offset: Offset(_animationOptions.value * 25, 0),
                    child: Opacity(
                      opacity: _animationOptions.value,
                      child: Text(
                        'main idea',
                        style: GoogleFonts.lora(
                          color: const Color(0xFF55371f),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Positioned(
              bottom: 75,
              right: 125,
              child: AnimatedBuilder(
                animation: _animationTextController,
                builder: ((context, child) {
                  return Transform.translate(
                    offset: Offset(_animationOptions.value * 25, 0),
                    child: Opacity(
                      opacity: _animationOptions.value,
                      child: Text(
                        'Our team',
                        style: GoogleFonts.lora(
                          color: const Color(0xFF55371f),
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ),
            Positioned(
                top: 20,
                left: 50,
                right: 50,
                child: AnimatedBuilder(
                    animation: _animationTextController,
                    builder: (context, child) {
                      return Transform.translate(
                        offset: Offset(0, -_animationOptions.value * 20),
                        child: Opacity(
                          opacity: _animationOptions.value,
                          child: Container(
                            color: Colors.transparent,
                            height: size.height - 155,
                            child: SingleChildScrollView(
                              child: Text(
                                "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\nARC architecture Studio is a dynamic and innovative architectural firm dedicated to creating functional and visually stunning buildings. Our team of experienced architects, designers, and project managers are committed to understanding our clients' needs and delivering projects that exceed their expectations. We specialize in a wide range of building types, including residential, commercial, and institutional, and have a particular focus on sustainable design and the use of cutting-edge technology. Our goal is to enhance the built environment and improve the lives of the people who inhabit our buildings. We are always pushing the boundaries of what is possible and strive to create spaces that are not only functional but also beautiful. We're excited to be part of the community and to help shape the future of the cities we work in.",
                                style: GoogleFonts.lora(
                                  color: const Color(0xFF909090),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    })),
            Positioned(
              top: 73,
              left: 0,
              right: 0,
              child: Center(
                child: Text(
                  'arc',
                  style: GoogleFonts.lora(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
            Positioned(
                top: 75,
                left: 16,
                child: Transform.rotate(
                    angle: 90 * pi / 180,
                    child: const Icon(
                      Icons.drag_indicator,
                      color: Colors.black,
                    ))),
            Positioned(
                top: 75,
                right: 16,
                child: AnimatedBuilder(
                    animation: _animationOptions,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animationOptions.value,
                        child: Transform.rotate(
                            angle: (_animationOptions.value * 360) * pi / 180,
                            child: IconButton(
                              icon: const Icon(
                                Icons.close,
                                color: Colors.black,
                              ),
                              onPressed: () {
                                _animationController.reverse();
                                _animationTextController.reverse();
                                Future.delayed(const Duration(seconds: 2), (() {
                                  Navigator.pop(context);
                                }));
                              },
                            )),
                      );
                    })),
          ],
        ),
      ),
    );
  }
}
