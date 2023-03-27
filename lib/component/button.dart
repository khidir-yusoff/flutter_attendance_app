import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/pages.dart';

class StandardButton extends StatelessWidget {
  const StandardButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String buttonText;
  final VoidCallback onPressed;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Color(0XFF4CAF50)),
        ),
        onPressed: onPressed,
        child: Center(
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class ReturnButton extends StatelessWidget {
  const ReturnButton({
    Key? key,
    required this.buttonText,
    required this.width,
    required this.height,
  }) : super(key: key);

  final String buttonText;
  final double width;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: const ButtonStyle(
          backgroundColor: MaterialStatePropertyAll<Color>(Color(0XFFE91E63)),
        ),
        onPressed: () => context.router.pop(),
        child: Center(
          child: Text(
            buttonText,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 14,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}
