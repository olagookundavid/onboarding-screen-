import 'package:flutter/material.dart';

void showOTPDialog(
    {required BuildContext context,
    required TextEditingController codeController,
    required VoidCallback onPressed}) {
  showDialog(
    context: context,
    //doesn't allow the dialog to be dismissed when it's pressed outside
    barrierDismissible: false,
    builder: (BuildContext context) => AlertDialog(
      title: const Text('enter OTP'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(
            controller: codeController,
          )
        ],
      ),
      actions: [
        TextButton(
          onPressed: onPressed,
          child: const Text('Done'),
        ),
      ],
    ),
  );
}
