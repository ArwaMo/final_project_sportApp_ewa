import 'package:flutter/material.dart';
<<<<<<< HEAD

import 'package:sport_app_ewa/views/League_views/League_views.dart';
import 'package:sport_app_ewa/views/home_view/widgets/competition_card.dart';
import 'package:sport_app_ewa/views/results_view/result_view.dart';
=======
import 'package:sport_app/views/home_view/home_view.dart';
import 'package:sport_app/views/home_view/widgets/competition_card.dart';
import 'package:sport_app/views/League_views/League_views.dart';
import 'package:sport_app/views/results_view/result_view.dart';
>>>>>>> 4e06da94d858eb7c464bb67c4aaa08be565adbea

class HomeViewBody extends StatelessWidget {
  const HomeViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // const Text(
                //   'Search',
                //   style: TextStyle(
                //       fontWeight: FontWeight.w500,
                //       color: Color.fromARGB(255, 17, 17, 211),
                //       fontSize: 25),
                // ),
                const Text(
                  'League teams',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Color.fromARGB(255, 34, 35, 49),
                    fontSize: 25,
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 10,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 2, 59, 247).withOpacity(0.2),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        size: 28,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search for a team',
                          ),
                          style: TextStyle(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 18),
                  child: Text(
                    'League teams standings',
                    style: TextStyle(
                      fontWeight: FontWeight.w600,
                      fontSize: 24,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            decoration: BoxDecoration(
                color: Color.fromARGB(255, 2, 59, 247).withOpacity(0.1),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                )),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: CustomCompetitionCard(
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) {
                              return const ResultView();
                            }));
                          },
                          leagueLogo: 'assets/images/premier_league.png',
                          leagueName: 'Premier League',
                          leagueNation: 'English championship',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomCompetitionCard(
                          leagueLogo: 'assets/images/la_liga.png',
                          leagueName: 'La Liga\nBBVA',
                          leagueNation: 'Spanish championship',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: CustomCompetitionCard(
                          leagueLogo: 'assets/images/bundes_liga.png',
                          leagueName: 'Bundes\nLiga',
                          leagueNation: 'German championship',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomCompetitionCard(
                          leagueLogo: 'assets/images/sa.png',
                          leagueName: 'League 1 Conforama',
                          leagueNation: 'French championship',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 12),
                    decoration: BoxDecoration(
                        color: Color.fromARGB(255, 87, 85, 189),
                        borderRadius: BorderRadius.circular(15)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            CircleAvatar(
                              backgroundColor:
                                  Color.fromARGB(255, 255, 255, 255),
                              radius: 35,
                              child: Image.asset(
                                'assets/images/ty.png',
                                width: 45,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => LeagueViews()),
                                );

                                // ResultView
                              },
                              child: const Text(
                                'The best scorers\n in this league',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Color.fromARGB(255, 255, 255, 255)),
                              ),
                            )
                          ],
                        ),
                        const Icon(
                          Icons.arrow_forward_rounded,
                          size: 30,
                          color: Color.fromARGB(255, 255, 255, 255),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
