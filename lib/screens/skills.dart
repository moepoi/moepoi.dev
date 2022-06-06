import 'package:universal_html/html.dart' as html;
import 'package:flutter/material.dart';

import 'package:moepoi_site/components/skill_box.dart';
import 'package:moepoi_site/data/skills.dart' show skillsData;
import 'package:moepoi_site/utils/utils.dart' show HideScrollGlow, kDesktopBreakPoint, kMobileBreakpoint, kTabletBreakpoint;

class Skills extends StatefulWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  State<Skills> createState() => _SkillsState();
}

class _SkillsState extends State<Skills> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Moe Poi | Skills',
      color: const Color.fromARGB(255, 80, 192, 144),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Skills', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 40.0),),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          automaticallyImplyLeading: false,
          actions: [
            Container(
              margin: const EdgeInsets.only(right: 20),
              child: IconButton(
                icon: const Icon(Icons.close, color: Color.fromARGB(255, 80, 192, 144),),
                onPressed: () {
                  html.window.history.pushState(null, '', '/');
                  Navigator.pushReplacementNamed(context, '/');
                },
              ),
            ),
          ],
        ),
        body: LayoutBuilder(builder: (context, dimension) {
          int gridCount = 2;
        
          if (dimension.maxWidth <= kMobileBreakpoint) {
            gridCount = 2;
          } else if (dimension.maxWidth > kMobileBreakpoint &&
              dimension.maxWidth <= kTabletBreakpoint) {
            gridCount = 3;
          } else if (dimension.maxWidth > kTabletBreakpoint &&
              dimension.maxWidth <= kDesktopBreakPoint) {
            gridCount = 4;
          } else {
            gridCount = 4;
          }
    
          return ScrollConfiguration(
            behavior: HideScrollGlow(),
            child: GridView.count(
              shrinkWrap: true,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: const EdgeInsets.all(20.0),
              crossAxisCount: gridCount,
              children: List.generate(skillsData.length, (index) {
                return SkillBox(
                  title: skillsData[index]['name'].toString(),
                  image: skillsData[index]['image'].toString(),
                );
              }),
            ),
          );
        })
      ),
    );
  }
}