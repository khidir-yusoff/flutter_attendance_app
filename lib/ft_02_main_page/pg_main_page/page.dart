import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/pages.dart';

import '../../component/component.dart';
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
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Running on $platform!'),
                  SizedBox(
                    width: 120,
                    child: StandardButton(
                      height: 40,
                      width: 75,
                      buttonText: 'Add Attendance',
                      onPressed: () => context.router.push(
                        const FAAAddAttendanceRoute(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
  }
}
