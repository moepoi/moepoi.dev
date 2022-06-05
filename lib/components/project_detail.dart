import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/material.dart';

import 'package:moepoi_site/utils/utils.dart';

class ProjectDetail extends StatelessWidget {
  const ProjectDetail({Key? key, required this.title, required this.image, required this.date, required this.categories, required this.description, required this.url}) : super(key: key);

  final String title;
  final String image;
  final String date;
  final String categories;
  final String description;
  final String url;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: const TextStyle(fontWeight: FontWeight.w600),),
          IconButton(onPressed: () {Navigator.pop(context);}, icon: const Icon(Icons.close))
        ],
      ),
      content: SizedBox(
        height: 700.0,
        width: 700.0,
        child: ScrollConfiguration(
          behavior: HideScrollGlow(),
          child: ListView(
            children: [
              Center(
                child: SizedBox(
                  width: 400,
                  height: 200,
                  child: Image.asset(image, fit: BoxFit.cover,),
                ),
              ),
              const SizedBox(height: 30.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Date : $date', style: const TextStyle(fontSize: 18.0)),
                  Text('Categories : $categories', style: const TextStyle(fontSize: 18.0)),
                ],
              ),
              const SizedBox(height: 50.0,),
              Text(description, style: const TextStyle(fontSize: 18.0)),
              const SizedBox(height: 50.0,),
              Center(
                child: ElevatedButton(
                  onPressed: () async {
                    if (!await launchUrl(Uri.parse(url))) {
                      throw 'Could not launch';
                    }
                  },
                  style: ButtonStyle(
                    elevation: MaterialStateProperty.all(5.0),
                    padding: MaterialStateProperty.all(const EdgeInsets.all(25.0)),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
                    backgroundColor: MaterialStateProperty.all(const Color.fromARGB(255, 80, 192, 144)),
                  ),
                  child: const Text('Visit Project'),
                ),
              ),
              const SizedBox(height: 20.0,),
            ],
          ),
        ),
      ),
    );
  }
}