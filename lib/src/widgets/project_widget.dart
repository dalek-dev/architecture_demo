import 'package:architecture/src/screens/projects_screen.dart';
import 'package:architecture/src/widgets/bottom_description.dart';
import 'package:flutter/material.dart';

class ProjectWidget extends StatelessWidget {
  const ProjectWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomDescription(
      description: 'projects',
      isLeft: false,
      isPressed: () {
        Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 1000),
            pageBuilder: (_, __, ___) => const ProjectsScreen(),
            transitionsBuilder: (_, animation, __, child) =>
                FadeTransition(opacity: animation, child: child),
          ),
        );
      },
    );
  }
}
