import 'dart:math';

import 'package:architecture/utils/blend_mask.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProjectsScreen extends StatefulWidget {
  const ProjectsScreen({super.key});

  @override
  State<ProjectsScreen> createState() => _ProjectsScreenState();
}

class _ProjectsScreenState extends State<ProjectsScreen>
    with TickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 2));
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController);

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
              top: 0,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _animation.value * 300),
                      child: SizedBox(
                          height: 480,
                          child: FittedBox(
                            fit: BoxFit.fill,
                            child: BlendMask(
                                opacity: 0.3,
                                blendMode: BlendMode.darken,
                                child: Image.asset(
                                    'assets/images/buildingOne.png')),
                          )),
                    );
                  })),
          Positioned(
              top: -100,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.translate(
                        offset: Offset(0, _animation.value * 100),
                        child: Container(
                          color: Colors.white,
                          height: 600,
                          width: 500,
                        ));
                  })),
          Positioned(
              top: -100,
              left: 0,
              right: 0,
              child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.translate(
                        offset: Offset(0, _animation.value * 100),
                        child: SizedBox(
                            height: 600,
                            child: FittedBox(
                                fit: BoxFit.fill,
                                child: BlendMask(
                                    opacity: 0.4,
                                    blendMode: BlendMode.darken,
                                    child: Image.asset(
                                      'assets/images/buildingTwo.jpg',
                                    )))));
                  })),
          Positioned(
              top: size.height / 2 - 50,
              left: 25,
              child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _animation.value * 100),
                      child: Opacity(
                        opacity: _animation.value,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'milstein hall',
                              style: GoogleFonts.lora(
                                color: const Color(0xFF55371f),
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'This bright, any space',
                              style: GoogleFonts.lora(
                                color: Colors.black,
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  })),
          const Positioned(
            bottom: 75,
            left: 25,
            child: Icon(Icons.unfold_more),
          ),
          Positioned(
              top: size.height / 2 - 30,
              left: 25,
              child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Transform.translate(
                      offset: Offset(0, _animation.value * 300),
                      child: Opacity(
                        opacity: _animation.value,
                        child: Text(
                          'arent fox',
                          style: GoogleFonts.lora(
                            color: const Color(0xFF55371f),
                            fontSize: 14,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    );
                  })),
          Positioned(
            bottom: 75,
            right: 25,
            child: Text(
              'open filter',
              style: GoogleFonts.lora(
                color: const Color(0xFF55371f),
                fontSize: 14,
                fontWeight: FontWeight.w500,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          Positioned(
              top: 75,
              left: 16,
              child: AnimatedBuilder(
                  animation: _animationController,
                  builder: (context, child) {
                    return Opacity(
                      opacity: _animation.value,
                      child: Transform.rotate(
                          angle: 90 * pi / 180,
                          child: const Icon(
                            Icons.drag_indicator,
                            color: Colors.black,
                          )),
                    );
                  })),
          Positioned(
            top: 73,
            left: 0,
            right: 0,
            child: AnimatedBuilder(
                animation: _animationController,
                builder: (context, child) {
                  return Opacity(
                    opacity: _animation.value,
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
                  );
                }),
          ),
          Positioned(
              top: 70,
              right: 16,
              child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animation.value,
                      child: Transform.rotate(
                          angle: (_animation.value * 360) * pi / 180,
                          child: IconButton(
                            icon: const Icon(
                              Icons.close,
                              color: Colors.black,
                            ),
                            onPressed: () {
                              _animationController.reverse();
                              Future.delayed(const Duration(seconds: 2), (() {
                                Navigator.pop(context);
                              }));
                            },
                          )),
                    );
                  })),
        ],
      ),
    );
  }
}
