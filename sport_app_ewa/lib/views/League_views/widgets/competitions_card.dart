import 'package:flutter/material.dart';

class CustomCompetitionCards extends StatelessWidget {
  CustomCompetitionCards(
      {super.key,
      required this.leagueLogo,
      required this.leagueName,
      required this.leagueNation,
      this.onPressed});

  final String leagueLogo;
  final String leagueName;
  final String leagueNation;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(15))),
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, left: 20, right: 20, bottom: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    leagueLogo,
                    height: 50,
                  ),
                  const Icon(
                    Icons.more_vert_rounded,
                    size: 25,
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                leagueName,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Text(
                leagueNation,
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black.withOpacity(0.5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}