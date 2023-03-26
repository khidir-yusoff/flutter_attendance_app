// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i2;
import 'package:flutter/material.dart' as _i3;

import '../pages.dart' as _i1;

class AppRouter extends _i2.RootStackRouter {
  AppRouter([_i3.GlobalKey<_i3.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i2.PageFactory> pagesMap = {
    FAALandingRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.FAALandingPage(),
      );
    },
    FAAMainRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.FAAMainPage(),
      );
    },
    FAATutorialRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.FAATutorialPage(),
      );
    },
    FAAAddAttendanceRoute.name: (routeData) {
      return _i2.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.FAAAddAttendancePage(),
      );
    },
  };

  @override
  List<_i2.RouteConfig> get routes => [
        _i2.RouteConfig(
          FAALandingRoute.name,
          path: '/',
        ),
        _i2.RouteConfig(
          FAAMainRoute.name,
          path: '/f-aa-main-page',
        ),
        _i2.RouteConfig(
          FAATutorialRoute.name,
          path: '/f-aa-tutorial-page',
        ),
        _i2.RouteConfig(
          FAAAddAttendanceRoute.name,
          path: '/f-aa-add-attendance-page',
        ),
      ];
}

/// generated route for
/// [_i1.FAALandingPage]
class FAALandingRoute extends _i2.PageRouteInfo<void> {
  const FAALandingRoute()
      : super(
          FAALandingRoute.name,
          path: '/',
        );

  static const String name = 'FAALandingRoute';
}

/// generated route for
/// [_i1.FAAMainPage]
class FAAMainRoute extends _i2.PageRouteInfo<void> {
  const FAAMainRoute()
      : super(
          FAAMainRoute.name,
          path: '/f-aa-main-page',
        );

  static const String name = 'FAAMainRoute';
}

/// generated route for
/// [_i1.FAATutorialPage]
class FAATutorialRoute extends _i2.PageRouteInfo<void> {
  const FAATutorialRoute()
      : super(
          FAATutorialRoute.name,
          path: '/f-aa-tutorial-page',
        );

  static const String name = 'FAATutorialRoute';
}

/// generated route for
/// [_i1.FAAAddAttendancePage]
class FAAAddAttendanceRoute extends _i2.PageRouteInfo<void> {
  const FAAAddAttendanceRoute()
      : super(
          FAAAddAttendanceRoute.name,
          path: '/f-aa-add-attendance-page',
        );

  static const String name = 'FAAAddAttendanceRoute';
}
