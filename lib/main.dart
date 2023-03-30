import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/data/attendance_record.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'pages.dart';

late Box box;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();
  box = await Hive.openBox('attendance_record');
  Hive.registerAdapter(AttendanceRecordAdapter());
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _appRouter = AppRouter();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Attendance Application',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
      ),
      routerDelegate: _appRouter.delegate(),
      routeInformationParser: _appRouter.defaultRouteParser(),
    );
  }
}
