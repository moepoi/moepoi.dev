import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

class SkillBox extends StatelessWidget {
  const SkillBox({Key? key, required this.title, required this.image}) : super(key: key);

  final String title;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 15.0,
      child: Container(
        margin: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Flexible(
              flex: 3,
              child: SvgPicture.asset(
                image,
                height: 200,
                width: 200,
                fit: BoxFit.contain,
                semanticsLabel: title,
              ),
            ),
            Flexible(
              flex: 1,
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}