import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../component/component.dart';

class FAALandingPage extends StatelessWidget {
  const FAALandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 360 ||
            MediaQuery.of(context).size.height < 640
        ? const NotSupportedBackground()
        : const StandardBackground(
            child: _LandingPage(),
          );
  }
}

class _LandingPage extends StatefulWidget {
  const _LandingPage({Key? key}) : super(key: key);

  @override
  State<_LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<_LandingPage> {
  bool tutorialCheck = false;

  @override
  void initState() {
    super.initState();
    _getTutorial();
  }

  Future<void> _getTutorial() async {
    final tutorial = await SharedPreferences.getInstance();

    setState(() {
      tutorialCheck = tutorial.getBool('unTutorial')!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _LandingPageText(),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              if (tutorialCheck) {
                context.router.replace(
                  const FAAMainRoute(),
                );
              } else {
                context.router.replace(
                  const FAATutorialRoute(),
                );
              }
            },
          ),
        ),
      ],
    );
  }
}

class _LandingPageText extends StatelessWidget {
  const _LandingPageText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text(
            'ATTENDANCE APPLICATION',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 40,
              fontWeight: FontWeight.bold,
              color: Color(0xFF00796B),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.height * 0.2),
          const Text(
            'Tap to continue',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.w300,
              color: Color(0xFF00796B),
            ),
          ),
        ],
      ),
    );
  }
}
