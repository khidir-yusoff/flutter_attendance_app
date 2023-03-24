import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/pages.dart';

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

class _LandingPage extends StatelessWidget {
  const _LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const _LandingPageText(),
        SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () => context.router.replace(
              const FAAMainRoute(),
            ),
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
