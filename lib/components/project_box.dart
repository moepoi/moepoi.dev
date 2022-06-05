import 'package:flutter/material.dart';

class ProjectBox extends StatefulWidget {
  const ProjectBox({Key? key, required this.image, required this.title, required this.callback}) : super(key: key);

  final String image;
  final String title;
  final Function() callback;

  @override
  State<ProjectBox> createState() => _ProjectBoxState();
}

class _ProjectBoxState extends State<ProjectBox> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      elevation: 20.0,
      child: InkWell(
        onTap: () => widget.callback(),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(widget.image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    Container(
                      height: 120.0,
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(bottomLeft: Radius.circular(10), bottomRight: Radius.circular(10)),
                        color: const Color.fromARGB(255, 80, 192, 144).withOpacity(0.9)
                      ),
                    ),
                    Center(
                      child: Container(
                        margin: const EdgeInsets.only(top: 40),
                        child: Text(widget.title, style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Colors.white)),
                      ),
                    )
                  ],
                ),
              ],
            )
          ],
        ),
      )
    );
  }
}