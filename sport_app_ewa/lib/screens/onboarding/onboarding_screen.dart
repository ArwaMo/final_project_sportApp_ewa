// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport_app_ewa/screens/login/login_screen.dart';
import 'package:sport_app_ewa/screens/onboarding/components/intro_app_info_widget.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  PageController pageController = PageController();
  Timer? _timer;
  int _currentPage = 0;
  int numPages = 3;

  @override
  void initState() {
    super.initState();
    _timer = Timer.periodic(Duration(seconds: 3), (Timer timer) {
      if (_currentPage <= numPages - 1) {
        _currentPage++;
      } else {
        _currentPage = 0;
      }

      pageController.animateToPage(
        _currentPage,
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    pageController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        PageView(
          controller: pageController,
          children: [
            IntroAppInfoWidget(
              title: 'Welcome to TopSport',
              content:
                  'Your ultimate sports companion! Stay updated with the latest sports news, live scores, and much more.',
              image: 'assets/images/logo_player.png',
            ),
            IntroAppInfoWidget(
              title: 'Live Scores & Updates',
              content:
                  'Never miss a moment! Get real-time scores and updates on your favorite teams and leagues.',
              image: 'assets/images/soccer.png',
            ),
            IntroAppInfoWidget(
              title: 'Join Our Community',
              content:
                  'Connect with other sports fans, share your experiences, and discuss all things sports.',
              image: 'assets/images/community.png',
            ),
          ],
        ),
        Positioned(
          top: 66,
          left: 330,
          child: TextButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => const LoginScreen()),
                    (Route route) => false);
              },
              child: Text(
                'Skip',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16,
                    color: Color(0xff2ba1e3)),
              )),
        )
      ],
    ));
  }
}
