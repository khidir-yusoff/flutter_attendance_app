import 'package:flutter/material.dart';
import 'package:flutter_attendance_app/pages.dart';

import '../../component/component.dart';

class SubmitDialog extends StatelessWidget {
  const SubmitDialog({
    Key? key,
    required this.dialogType,
  }) : super(key: key);

  final int dialogType;

  @override
  Widget build(BuildContext context) {
    String? dialogText;
    String? buttonText;

    switch (dialogType) {
      case 1:
        dialogText = 'Successfully added!';
        buttonText = 'Add more';
        break;
      case 2:
        dialogText = 'Empty field detected.';
        buttonText = 'Back';
        break;
      default:
        dialogText = 'n/a';
        buttonText = 'return';
        break;
    }

    return AlertDialog(
      content: Text(dialogText),
      actions: [
        ReturnButton(buttonText: buttonText, width: 100, height: 30),
        if (dialogType == 1)
          StandardButton(
            buttonText: 'Main Page',
            onPressed: () => context.router.replace(const FAAMainRoute()),
            width: 100,
            height: 30,
          ),
      ],
    );
  }
}
