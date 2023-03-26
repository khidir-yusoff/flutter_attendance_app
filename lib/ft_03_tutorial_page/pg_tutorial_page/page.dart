import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/pages.dart';

import '../../component/component.dart';

class FAATutorialPage extends StatelessWidget {
  const FAATutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 360 &&
            MediaQuery.of(context).size.height < 640
        ? const NotSupportedBackground()
        : const StandardBackground(
            child: Center(
              child: _TutorialPage(),
            ),
          );
  }
}

class _TutorialPage extends StatelessWidget {
  const _TutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('TUTORIAL HERE!'),
          SizedBox(
            width: 120,
            child: StandardButton(
              buttonText: 'I understand!',
              onPressed: () => context.router.replace(
                const FAAMainRoute(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
