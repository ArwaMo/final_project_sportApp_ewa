import 'package:flutter/material.dart';

class CustomMatchResultyy extends StatelessWidget {
  const CustomMatchResultyy(
      {super.key,
      // required this.firstTeamLogo,
      required this.firstTeamName,
      required this.result,
      // required this.secondTeamLogo,
      required this.secondTeamName});

  // final String firstTeamLogo;
  final String firstTeamName;
  final String result;
  // final String secondTeamLogo;
  final String secondTeamName;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            // Image.asset(
            //   // firstTeamLogo,
            //   width: 45,
            // ),
            const SizedBox(
              width: 5,
            ),
            Text(
              firstTeamName,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.7)),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              result,
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.7)),
            ),
          ],
        ),
        Row(
          children: [
            Text(
              secondTeamName,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: Colors.black.withOpacity(0.7)),
            ),
            const SizedBox(
              width: 5,
            ),
            // Image.asset(
            //   secondTeamLogo,
            //   width: 40,
            // ),
          ],
        ),
      ],
    );
  }
}
