import 'package:page_transition/page_transition.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';
import 'package:flutter/material.dart';

import 'package:moepoi_site/screens/home.dart';
import 'package:moepoi_site/screens/projects.dart';
import 'package:moepoi_site/screens/resume.dart';
import 'package:moepoi_site/screens/skills.dart';

void main() {
  setUrlStrategy(PathUrlStrategy());
  runApp(const Moepoi());
}

class Moepoi extends StatefulWidget {
  const Moepoi({Key? key}) : super(key: key);

  @override
  State<Moepoi> createState() => _MoepoiState();
}

class _MoepoiState extends State<Moepoi> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return PageTransition(child: const Home(), type: PageTransitionType.fade);
          case '/resume':
            return PageTransition(child: const Resume(), type: PageTransitionType.leftToRight);
          case '/skills':
            return PageTransition(child: const Skills(), type: PageTransitionType.bottomToTop);
          case '/projects':
            return PageTransition(child: const Projects(), type: PageTransitionType.rightToLeft);
          default:
            return PageTransition(child: const Home(), type: PageTransitionType.fade);
        }
      },
    );
  }
}