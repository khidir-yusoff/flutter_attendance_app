import 'package:auto_route/auto_route.dart';

import '../pages.dart';

export 'routes.gr.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(
      page: FAALandingPage,
      initial: true,
    ),
    AutoRoute(
      page: FAAMainPage,
    ),
    AutoRoute(
      page: FAATutorialPage,
    ),
    AutoRoute(
      page: FAAAddAttendancePage,
    ),
  ],
)
class $AppRouter {}
