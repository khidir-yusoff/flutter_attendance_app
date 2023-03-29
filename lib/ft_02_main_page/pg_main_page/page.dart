import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/pages.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timeago_flutter/timeago_flutter.dart' as timeago;

import '../../component/component.dart';
import '../../platform.dart';
import 'state.dart';

class FAAMainPage extends StatelessWidget {
  const FAAMainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool onMobile = false;

    if (isAndroid() || isIOS() || MediaQuery.of(context).size.width < 600) {
      onMobile = true;
    } else if (isWindows() || isLinux() || isMacOS() || isWeb()) {
      onMobile = false;
    }

    return ChangeNotifierProvider(
      create: (context) => FAAMainPageState(),
      child: MediaQuery.of(context).size.width < 360 ||
              MediaQuery.of(context).size.height < 640
          ? const NotSupportedBackground()
          : StandardBackground(
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: onMobile ? 310 : 590,
                      child: Row(
                        children: [
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
                          const SizedBox(width: 20),
                          const _TimeFormatButton(),
                        ],
                      ),
                    ),
                    _Attendance(onMobile: onMobile),
                  ],
                ),
              ),
            ),
    );
  }
}

class _TimeFormatButton extends StatefulWidget {
  const _TimeFormatButton({Key? key}) : super(key: key);

  @override
  State<_TimeFormatButton> createState() => _TimeFormatButtonState();
}

class _TimeFormatButtonState extends State<_TimeFormatButton> {
  int? format;

  @override
  void initState() {
    super.initState();
    _getFormatting();
  }

  Future<void> _getFormatting() async {
    final formatting = await SharedPreferences.getInstance();

    if (!formatting.containsKey('timeFormat')) {
      return;
    }

    setState(() {
      format = formatting.getInt('timeFormat') ?? 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FAAMainPageState>(
      builder: (_, state, __) {
        return SizedBox(
          width: 80,
          height: 40,
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Color(0XFF4CAF50)),
            ),
            onPressed: () {
              state.timeFormat = format!;
              if (state.timeFormat == 0) {
                format = 1;
                state.timeFormat = 1;
              } else if (state.timeFormat == 1) {
                format = 0;
                state.timeFormat = 0;
              }
            },
            child: SizedBox(
              width: 80,
              height: 40,
              child: Center(
                child: Icon(
                  format == 0 ? Icons.punch_clock : Icons.calendar_view_day,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class _Attendance extends StatelessWidget {
  const _Attendance({
    Key? key,
    required this.onMobile,
  }) : super(key: key);

  final bool onMobile;

  @override
  Widget build(BuildContext context) {
    return CardBackground(
      onMobile: onMobile,
      child: const _AttendanceList(),
    );
  }
}

class _AttendanceList extends StatefulWidget {
  const _AttendanceList({Key? key}) : super(key: key);

  @override
  State<_AttendanceList> createState() => _AttendanceListState();
}

class _AttendanceListState extends State<_AttendanceList> {
  var attendanceRecord = Hive.box('attendance_record');

  @override
  void initState() {
    super.initState();
    attendanceRecord = Hive.box('attendance_record');
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FAAMainPageState>(
      builder: (_, state, __) {
        var items = attendanceRecord.values.toList();
        var sortedItems = items
          ..sort((a, b) => (b['time']).compareTo(a['time']));

        return ListView.separated(
          itemCount: attendanceRecord.length + 1,
          itemBuilder: (BuildContext context, int index) {
            final item = sortedItems;
            if (index < attendanceRecord.length) {
              return ListTile(
                title: Text(item[index]['name'] + ' - ' + item[index]['phone']),
                subtitle: state.timeFormat == 0
                    ? Text(timeago.format(item[index]['time']))
                    : Text(DateFormat('dd MMM yyyy, h:mm a')
                        .format(item[index]['time'])
                        .toString()),
              );
            } else {
              return const ListTile(
                subtitle: Text('End of the list'),
              );
            }
          },
          separatorBuilder: (BuildContext context, int index) =>
              const Divider(),
        );
      },
    );
  }
}
