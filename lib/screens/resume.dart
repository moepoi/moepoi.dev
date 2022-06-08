import 'package:flutter/material.dart';

import 'package:moepoi_site/components/resume_experience.dart';
import 'package:moepoi_site/components/resume_education.dart';
import 'package:moepoi_site/components/resume_language.dart';
import 'package:moepoi_site/utils/utils.dart' show HideScrollGlow, kDesktopBreakPoint, kMobileBreakpoint, kTabletBreakpoint;

class Resume extends StatefulWidget {
  const Resume({Key? key}) : super(key: key);

  @override
  State<Resume> createState() => _ResumeState();
}

class _ResumeState extends State<Resume> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Moe Poi | Resume',
      color: const Color.fromARGB(255, 80, 192, 144),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Resume', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 40.0),),
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
                  Navigator.pop(context);
                },
              ),
            ),
          ],
        ),
        body: LayoutBuilder(builder: (context, dimension) {
          Widget desktop = ScrollConfiguration(
            behavior: HideScrollGlow(),
            child: ListView(
              shrinkWrap: true,
              children: [
                const SizedBox(height: 50.0,),
                SizedBox(
                  height: 500,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const Flexible(
                        flex: 1,
                        child: ResumeExperience(),
                      ),
                      Flexible(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Flexible(flex: 1, child: ResumeEducation()),
                            Flexible(flex: 2, child: ResumeLanguage()),
                          ],
                        ),
                      )
                    ]
                  )
                )
              ]
            )
          );
    
          Widget mobile = ScrollConfiguration(
            behavior: HideScrollGlow(),
            child: Center(
              child: ListView(
                // crossAxisCount: 1,
                padding: const EdgeInsets.all(15.0),
                shrinkWrap: true,
                // childAspectRatio: 0.8,
                children: const [
                  ResumeExperience(),
                  SizedBox(height: 30.0,),
                  ResumeEducation(),
                  SizedBox(height: 30.0,),
                  ResumeLanguage(),
                ]
              ),
            )
          );
    
          if (dimension.maxWidth <= kMobileBreakpoint) {
            return mobile;
          } else if (dimension.maxWidth > kMobileBreakpoint &&
              dimension.maxWidth <= kTabletBreakpoint) {
            return desktop;
          } else if (dimension.maxWidth > kTabletBreakpoint &&
              dimension.maxWidth <= kDesktopBreakPoint) {
            return desktop;
          } else {
            return desktop;
          }
        })
      ),
    );
  }
}