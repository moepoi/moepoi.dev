import 'package:flutter/material.dart';

import 'package:moepoi_site/data/resume.dart' show resumeData;

class ResumeEducation extends StatelessWidget {
  const ResumeEducation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const Text('Education', style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),),
        const SizedBox(height: 20.0,),
        Text(resumeData['education']![0]['level'].toString(), style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),),
        const SizedBox(height: 5.0,),
        Text(resumeData['education']![0]['institution'].toString(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
        const SizedBox(height: 5.0,),
        Text(resumeData['education']![0]['duration'].toString(), style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),),
      ]
    );
  }
}