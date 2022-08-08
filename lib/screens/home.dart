import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/material.dart';

import 'package:moepoi_site/utils/utils.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Title(
      title: 'Moe Poi',
      color: const Color.fromARGB(255, 80, 192, 144),
      child: Scaffold(
          body: Center(
        child: ScrollConfiguration(
          behavior: HideScrollGlow(),
          child: ListView(shrinkWrap: true, children: [
            const SizedBox(height: 20),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/home/profile.webp'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Moe Poi',
              style: TextStyle(
                fontSize: 50,
                fontWeight: FontWeight.w600,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                    flex: 1,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () async {
                        if (!await launchUrl(
                            Uri.parse('https://t.me/moepoi'))) {
                          throw 'Could not launch';
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/images/home/telegram.svg',
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain,
                        semanticsLabel: 'Telegram',
                      ),
                    )),
                const SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    flex: 1,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () async {
                        if (!await launchUrl(
                            Uri.parse('https://github.com/moepoi'))) {
                          throw 'Could not launch';
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/images/home/github.svg',
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain,
                        semanticsLabel: 'GitHub',
                      ),
                    )),
                const SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    flex: 1,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () async {
                        if (!await launchUrl(
                            Uri.parse('https://gitlab.com/moepoi'))) {
                          throw 'Could not launch';
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/images/home/gitlab.svg',
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain,
                        semanticsLabel: 'Gitlab',
                      ),
                    )),
                const SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    flex: 1,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () async {
                        if (!await launchUrl(
                            Uri.parse('https://linkedin.com/in/moepoi'))) {
                          throw 'Could not launch';
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/images/home/linkedin.svg',
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain,
                        semanticsLabel: 'Linkedin',
                      ),
                    )),
                const SizedBox(
                  width: 10.0,
                ),
                Flexible(
                    flex: 1,
                    child: InkWell(
                      splashFactory: NoSplash.splashFactory,
                      onTap: () async {
                        if (!await launchUrl(
                            Uri.parse('https://ipinfo.io/AS209310'))) {
                          throw 'Could not launch';
                        }
                      },
                      child: SvgPicture.asset(
                        'assets/images/home/ipinfo.svg',
                        height: 40,
                        width: 40,
                        fit: BoxFit.contain,
                        semanticsLabel: 'IpInfo',
                      ),
                    ))
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Flexible(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/resume');
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5.0),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(25.0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 80, 192, 144)),
                    ),
                    child: const Text('Resume'),
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/skills');
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5.0),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(25.0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 80, 192, 144)),
                    ),
                    child: const Text('Skills'),
                  ),
                ),
                const SizedBox(width: 20),
                Flexible(
                  flex: 1,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/projects');
                    },
                    style: ButtonStyle(
                      elevation: MaterialStateProperty.all(5.0),
                      padding:
                          MaterialStateProperty.all(const EdgeInsets.all(25.0)),
                      shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                      backgroundColor: MaterialStateProperty.all(
                          const Color.fromARGB(255, 80, 192, 144)),
                    ),
                    child: const Text('Projects'),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ]),
        ),
      )),
    );
  }
}
