import 'dart:async';

import 'package:flutter/material.dart';
import 'package:sport_app_ewa/screens/onboarding/onboarding_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

//
class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (_) => const OnboardingScreen()),
          (Route route) => false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedOpacity(
              opacity: 1,
              duration: const Duration(seconds: 3),
              child: Image.asset('assets/images/logo_sport.png')),
        ],
      ),
    );
  }
}
