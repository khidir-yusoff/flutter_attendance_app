import 'package:flutter/material.dart';

import '../../component/background.dart';
import '../../platform.dart';

class FAAMainPage extends StatelessWidget {
  const FAAMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String platform = '';

    if (isAndroid() || isIOS()) {
      platform = 'Mobile';
    } else if (isWindows() || isLinux() || isMacOS()) {
      platform = 'Native';
    } else if (isWeb()) {
      platform = 'Web';
    } else {
      platform = 'unidentfied device';
    }

    return MediaQuery.of(context).size.width < 360 &&
            MediaQuery.of(context).size.height < 640
        ? const NotSupportedBackground()
        : StandardBackground(
            child: Center(
              child: Text('Running on $platform!'),
            ),
          );
  }
}
