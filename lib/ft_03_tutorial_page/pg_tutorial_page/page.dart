import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/pages.dart';
import 'package:flutter_attendance_app/platform.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../component/component.dart';

class FAATutorialPage extends StatelessWidget {
  const FAATutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 360 ||
            MediaQuery.of(context).size.height < 640
        ? const NotSupportedBackground()
        : const StandardBackground(
            child: Center(
              child: _TutorialPage(),
            ),
          );
  }
}

class _TutorialPage extends StatefulWidget {
  const _TutorialPage({Key? key}) : super(key: key);

  @override
  State<_TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<_TutorialPage> {
  Future<void> _unTutorial() async {
    final tutorial = await SharedPreferences.getInstance();

    setState(() {
      tutorial.setBool('unTutorial', true);
    });
  }

  @override
  Widget build(BuildContext context) {
    bool onMobile = false;

    if (isAndroid() || isIOS() || MediaQuery.of(context).size.width < 600) {
      onMobile = true;
    } else if (isWindows() || isLinux() || isMacOS() || isWeb()) {
      onMobile = false;
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _Tutorial(onMobile: onMobile),
          const SizedBox(height: 20),
          SizedBox(
            width: 120,
            child: StandardButton(
                height: 40,
                width: 75,
                buttonText: 'I understand!',
                onPressed: () {
                  _unTutorial();
                  context.router.replace(
                    const FAAMainRoute(),
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class _Tutorial extends StatelessWidget {
  const _Tutorial({
    Key? key,
    required this.onMobile,
  }) : super(key: key);

  final bool onMobile;

  @override
  Widget build(BuildContext context) {
    return CardBackground(
      onMobile: onMobile,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          SizedBox(height: 10),
          Text(
            'How To Use',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(height: 10),
          Text(
            'Tap Add Attendance button to add attendance.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'You can add name, phone number and date/time.',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'You can toggle the date/time for different format, with button with icon',
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Text(
            'Proceed if understand, and we part.',
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
