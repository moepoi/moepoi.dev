import 'package:flutter/material.dart';

import 'package:moepoi_site/components/project_box.dart';
import 'package:moepoi_site/components/project_detail.dart';
import 'package:moepoi_site/data/projects.dart' show projectsData;
import 'package:moepoi_site/utils/utils.dart' show HideScrollGlow, kDesktopBreakPoint, kMobileBreakpoint, kTabletBreakpoint;

class Projects extends StatefulWidget {
  const Projects({Key? key}) : super(key: key);

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Moe Poi | Projects',
      color: const Color.fromARGB(255, 80, 192, 144),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Projects', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 40.0),),
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
                  Navigator.pushReplacementNamed(context, '');
                },
              ),
            ),
          ],
        ),
        body: LayoutBuilder(builder: (context, dimension) {
          int gridCount = 1;
        
          if (dimension.maxWidth <= kMobileBreakpoint) {
            gridCount = 1;
          } else if (dimension.maxWidth > kMobileBreakpoint &&
              dimension.maxWidth <= kTabletBreakpoint) {
            gridCount = 2;
          } else if (dimension.maxWidth > kTabletBreakpoint &&
              dimension.maxWidth <= kDesktopBreakPoint) {
            gridCount = 3;
          } else {
            gridCount = 3;
          }
        
          return ScrollConfiguration(
            behavior: HideScrollGlow(),
            child: GridView.count(
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: const EdgeInsets.all(20.0),
              crossAxisCount: gridCount,
              children: List.generate(projectsData.length, (index) {
                return ProjectBox(
                  image: projectsData[index]['image'].toString(),
                  title: projectsData[index]['title'].toString(),
                  callback: () {
                    showDialog(
                      context: context,
                      builder: (context) {
                        return ProjectDetail(
                          title: projectsData[index]['title'].toString(),
                          image: projectsData[index]['image'].toString(),
                          date: projectsData[index]['date'].toString(),
                          categories: projectsData[index]['categories'].toString(),
                          description: projectsData[index]['description'].toString(),
                          url: projectsData[index]['url'].toString(),
                        );
                      }
                    );
                  },
                );
              }),
            ),
          );
        })
      ),
    );
  }
}