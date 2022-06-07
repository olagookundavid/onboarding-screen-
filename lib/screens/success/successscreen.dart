import 'package:flutter/material.dart';

class SuccessScreen extends StatelessWidget {
  const SuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Successfully Logged In'),
      ),
      body: const Center(
        child: Text('Success\nAwait Instructions'),
      ),
    );
  }
}
