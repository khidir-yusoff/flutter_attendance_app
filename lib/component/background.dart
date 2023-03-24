import 'package:flutter/material.dart';

class StandardBackground extends StatelessWidget {
  const StandardBackground({
    Key? key,
    required this.child,
  }) : super(key: key);

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFDCEDC8),
      body: child,
    );
  }
}

class NotSupportedBackground extends StatelessWidget {
  const NotSupportedBackground({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xFFDCEDC8),
      body: Center(
        child: Text('Size not supported'),
      ),
    );
  }
}
