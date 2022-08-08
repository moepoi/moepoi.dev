import 'package:flutter/material.dart';

import 'package:moepoi_site/data/resume.dart' show resumeData;

class ResumeExperience extends StatelessWidget {
  const ResumeExperience({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Text(
            'Experience',
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w700),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text(
            resumeData['experience']![0]['name'].toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            '${resumeData['experience']![0]['role'].toString()} | ${resumeData['experience']![0]['duration'].toString()}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            resumeData['experience']![0]['description'].toString(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            resumeData['experience']![1]['name'].toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            '${resumeData['experience']![1]['role'].toString()} | ${resumeData['experience']![1]['duration'].toString()}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            resumeData['experience']![1]['description'].toString(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            resumeData['experience']![2]['name'].toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            '${resumeData['experience']![2]['role'].toString()} | ${resumeData['experience']![2]['duration'].toString()}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            resumeData['experience']![2]['description'].toString(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            resumeData['experience']![3]['name'].toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            '${resumeData['experience']![3]['role'].toString()} | ${resumeData['experience']![3]['duration'].toString()}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            resumeData['experience']![3]['description'].toString(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            resumeData['experience']![4]['name'].toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            '${resumeData['experience']![4]['role'].toString()} | ${resumeData['experience']![4]['duration'].toString()}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            resumeData['experience']![4]['description'].toString(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 10.0,
          ),
          Text(
            resumeData['experience']![5]['name'].toString(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            '${resumeData['experience']![5]['role'].toString()} | ${resumeData['experience']![5]['duration'].toString()}',
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 5.0,
          ),
          Text(
            resumeData['experience']![5]['description'].toString(),
            style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
          ),
        ]);
  }
}
