import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../component/component.dart';
import '../../platform.dart';
import 'state.dart';

class FAAAddAttendancePage extends StatelessWidget {
  const FAAAddAttendancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => FAAAddAttendancePageState(),
      child: MediaQuery.of(context).size.width < 360 ||
              MediaQuery.of(context).size.height < 640
          ? const NotSupportedBackground()
          : const StandardBackground(
              child: _AddAttendancePage(),
            ),
    );
  }
}

class _AddAttendancePage extends StatelessWidget {
  const _AddAttendancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool onMobile = false;

    if (isAndroid() || isIOS() || MediaQuery.of(context).size.width < 600) {
      onMobile = true;
    } else if (isWindows() || isLinux() || isMacOS() || isWeb()) {
      onMobile = false;
    }

    return Center(
      child: CardBackground(
        onMobile: onMobile,
        child: _Layout(onMobile: onMobile),
      ),
    );
  }
}

class _Layout extends StatelessWidget {
  const _Layout({
    Key? key,
    required this.onMobile,
  }) : super(key: key);

  final bool onMobile;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text(
          'ADD ATTENDANCE',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: Color(0xFF00796B),
          ),
        ),
        const SizedBox(height: 30),
        _TitleField(
          onMobile: onMobile,
        ),
        const SizedBox(height: 50),
        _DateTimeField(
          onMobile: onMobile,
        ),
        const SizedBox(height: 30),
        _BottomButton(onMobile: onMobile),
      ],
    );
  }
}

class _DateTimeField extends StatefulWidget {
  const _DateTimeField({
    Key? key,
    required this.onMobile,
  }) : super(key: key);

  final bool onMobile;

  @override
  State<_DateTimeField> createState() => _DateTimeFieldState();
}

class _DateTimeFieldState extends State<_DateTimeField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<FAAAddAttendancePageState>(
      builder: (_, state, __) {
        _controller.text = state.dateTime == null
            ? ''
            : DateFormat('dd MMM yyyy, h:mm a').format(state.dateTime!);

        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: widget.onMobile ? 200 : 260,
              height: 50,
              child: TextField(
                controller: _controller,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Date and Time',
                  enabled: false,
                ),
              ),
            ),
            const SizedBox(height: 5),
            _DateTimeButton(
              onMobile: widget.onMobile,
            ),
          ],
        );
      },
    );
  }
}

class _DateTimeButton extends StatefulWidget {
  const _DateTimeButton({
    Key? key,
    required this.onMobile,
  }) : super(key: key);

  final bool onMobile;

  @override
  State<_DateTimeButton> createState() => _DateTimeButtonState();
}

class _DateTimeButtonState extends State<_DateTimeButton> {
  @override
  Widget build(BuildContext context) {
    return Consumer<FAAAddAttendancePageState>(
      builder: (_, state, __) {
        Future<DateTime?> pickDate() => showDatePicker(
              context: context,
              initialDate: DateTime.now(),
              firstDate: DateTime(1900),
              lastDate: DateTime(2100),
            );

        Future<TimeOfDay?> pickTime() => showTimePicker(
              context: context,
              initialTime: TimeOfDay.now(),
            );

        Future pickDateTime() async {
          DateTime? date = await pickDate();
          if (date == null) return; //cancel pressed

          TimeOfDay? time = await pickTime();
          if (time == null) return;

          final dateTime = DateTime(
            date.year,
            date.month,
            date.day,
            time.hour,
            time.minute,
          );

          setState(() => state.dateTime = dateTime);
        }

        return SizedBox(
          height: 30,
          width: widget.onMobile ? 200 : 260,
          child: ElevatedButton(
            style: const ButtonStyle(
              backgroundColor:
                  MaterialStatePropertyAll<Color>(Color(0XFF4CAF50)),
            ),
            onPressed: pickDateTime,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: const [
                  Icon(
                    Icons.access_time,
                    color: Colors.white,
                  ),
                  Text(
                    'Tap to select',
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  Icon(
                    Icons.calendar_month,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class _TitleField extends StatefulWidget {
  const _TitleField({
    Key? key,
    required this.onMobile,
  }) : super(key: key);

  final bool onMobile;

  @override
  State<_TitleField> createState() => _TitleFieldState();
}

class _TitleFieldState extends State<_TitleField> {
  final _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<FAAAddAttendancePageState>(
      builder: (_, state, __) {
        if (state.updateTextController) {
          _controller.text = state.title!;
        }

        return SizedBox(
          width: widget.onMobile ? 200 : 260,
          height: 50,
          child: TextField(
            controller: _controller,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              hintText: 'Title',
            ),
            onChanged: (value) => state.title = value,
          ),
        );
      },
    );
  }
}

class _BottomButton extends StatelessWidget {
  const _BottomButton({Key? key, required this.onMobile}) : super(key: key);

  final bool onMobile;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: onMobile ? 200 : 260,
      child: onMobile
          ? Column(
              children: [
                StandardButton(
                  height: 40,
                  width: onMobile ? 200 : 100,
                  buttonText: 'Submit',
                  onPressed: () {},
                ),
                const SizedBox(height: 10),
                ReturnButton(
                  height: 40,
                  width: onMobile ? 200 : 100,
                  buttonText: 'Back',
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                StandardButton(
                  height: 40,
                  width: onMobile ? 200 : 100,
                  buttonText: 'Submit',
                  onPressed: () {},
                ),
                ReturnButton(
                  height: 40,
                  width: onMobile ? 200 : 100,
                  buttonText: 'Back',
                ),
              ],
            ),
    );
  }
}
