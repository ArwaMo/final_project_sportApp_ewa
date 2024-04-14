// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class IntroAppInfoWidget extends StatelessWidget {
  final String title;
  final String content;
  final String image;

  const IntroAppInfoWidget({
    super.key,
    required this.title,
    required this.content,
    required this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            title,
            style: TextStyle(
              color: Color(0xff171c38),
              fontSize: 28.0,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 30.0),
          Image.asset(
            image,
            height: 250.0,
          ),
          SizedBox(height: 20.0),
          Text(
            content,
            style: TextStyle(
              color: Color(0xff171c38),
              fontSize: 18.0,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
