import 'package:flutter/material.dart';
import 'package:sport_app_ewa/views/home_view/home_view.dart';
import 'package:sport_app_ewa/views/home_view/widgets/competition_card.dart';
import 'package:sport_app_ewa/views/resulty_view/resulty_view.dart';


class LeagueViewsody extends StatelessWidget {
  const LeagueViewsody({super.key});

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
                  'League top scorer',
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
                    color: Color.fromARGB(15, 2, 59, 247).withOpacity(0.1),
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
                            hintText: 'Search for a player',
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
                    'Top Scorers',
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
                              return const ResultyyView();
                            }));
                          },
                          leagueLogo: 'assets/images/criss.png',
                          leagueName: 'cristiano ronaldo',
                          leagueNation: 'Striker',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomCompetitionCard(
                          leagueLogo: 'assets/images/salam.jpg',
                          leagueName: 'salem\nAldosary',
                          leagueNation: 'Attacking Midfield ',
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
                          leagueLogo: 'assets/images/ali.png',
                          leagueName: 'Alexander\n Mitrovic',
                          leagueNation: 'Striker',
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomCompetitionCard(
                          leagueLogo: 'assets/images/kilans.jpg',
                          leagueName: 'kilan\nmbape',
                          leagueNation: 'Striker',
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
                                      builder: (context) => HomeView()),
                                );

                                // ResultView
                              },
                              child: const Text(
                                'See all\n eligible teamssggg',
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
