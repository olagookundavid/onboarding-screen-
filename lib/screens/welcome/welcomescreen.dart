import 'package:flutter/material.dart';
import 'package:onboardingscreen/screens/welcome/welcomebody.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: WelcomeBody());
  }
}
