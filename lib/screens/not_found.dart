import 'package:flutter/material.dart';

import 'package:moepoi_site/utils/utils.dart';

class NotFound extends StatelessWidget {
  const NotFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Moe Poi | 404',
      color: const Color.fromARGB(255, 80, 192, 144),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('-_-', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700, fontSize: 40.0),),
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
        body: Center(
          child: ScrollConfiguration(
            behavior: HideScrollGlow(),
            child: ListView(
              shrinkWrap: true,
              children: const [
                Center(child: Text('404', style: TextStyle(fontSize: 120, fontWeight: FontWeight.w800, color: Color.fromARGB(255, 80, 192, 144)),)),
                Center(child: Text('Not Found', style: TextStyle(fontSize: 35, fontWeight: FontWeight.w600),)),
              ]
            ),
          ),
        )
    ));
  }
}