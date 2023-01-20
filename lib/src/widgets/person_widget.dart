import 'package:architecture/utils/blend_mask.dart';
import 'package:flutter/material.dart';

class PersonWidget extends StatelessWidget {
  const PersonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(children: [
      const SizedBox(
        height: 600,
        width: 500,
      ),
      Positioned(
          top: size.height / 5,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 300,
            width: 200,
            child: Image.asset(
              'assets/images/person.png',
            ),
          )),
      Positioned(
          top: size.height / 3.5,
          left: 0,
          right: 0,
          child: SizedBox(
            height: 300,
            width: 150,
            child: BlendMask(
              opacity: 0.3,
              blendMode: BlendMode.darken,
              child: Image.asset(
                'assets/images/cloud.png',
                scale: 1.8,
              ),
            ),
          )),
    ]);
  }
}
