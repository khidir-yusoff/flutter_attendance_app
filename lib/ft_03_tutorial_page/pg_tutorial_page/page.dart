import 'package:flutter/material.dart';

import '../../component/background.dart';

class FAATutorialPage extends StatelessWidget {
  const FAATutorialPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MediaQuery.of(context).size.width < 360 &&
            MediaQuery.of(context).size.height < 640
        ? const NotSupportedBackground()
        : const StandardBackground(
            child: Center(
              child: Text('Tutorial!'),
            ),
          );
  }
}
