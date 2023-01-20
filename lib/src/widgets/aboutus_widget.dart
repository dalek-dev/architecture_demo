import 'package:architecture/src/screens/description_screen.dart';
import 'package:architecture/src/widgets/bottom_description.dart';
import 'package:flutter/material.dart';

class AboutUsWidget extends StatelessWidget {
  const AboutUsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomDescription(
      description: 'about us',
      isLeft: true,
      isPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 200),
            pageBuilder: (_, __, ___) => const DescriptionScreen(),
            transitionsBuilder: (_, animation, __, child) => FadeTransition(
              opacity: animation,
              child: child,
            ),
          ),
        );
      },
    );
  }
}
