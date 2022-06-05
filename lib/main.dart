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
      routes: {
        '/': (context) => const Home(),
        '/projects': (context) => const Projects(),
        '/skills': (context) => const Skills(),
        '/resume': (context) => const Resume(),
      },
    );
  }
}