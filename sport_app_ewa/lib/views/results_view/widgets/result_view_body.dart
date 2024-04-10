import 'package:flutter/material.dart';
import 'package:sport_app_ewa/views/results_view/widgets/custom_match_result.dart';


class ResultViewBody extends StatelessWidget {
  const ResultViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 18,
                      height: 2,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 240, 240),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 22,
                      height: 2,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 240, 240),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Container(
                      width: 12,
                      height: 2,
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 243, 240, 240),
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Icon(
                  Icons.settings,
                  size: 30,
                  color: Color.fromARGB(255, 243, 240, 240),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, bottom: 70),
            child: Column(
              children: [
                Image.asset(
                  'assets/images/premier_league.png',
                  width: 55,
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Top scorer in the league',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'English Championship',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(45),
                  topRight: Radius.circular(45),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.deepPurple[100],
                            borderRadius: BorderRadius.circular(30),
                          ),
                          child: const Text(
                            'Results',
                            style: TextStyle(
                              fontSize: 18,
                              color: Color.fromARGB(255, 0, 0, 0),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                        Text(
                          'Table',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey[600],
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 30),
                          child: Text(
                            'Goals',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.only(top: 40),
                      child: Column(
                        children: [
                          CustomMatchResult(
                            firstTeamLogo:
                                'assets/images/liverpool-logo-vector.png',
                            firstTeamName: 'Liverpool',
                            result: '3-1',
                            secondTeamLogo:
                                'assets/images/arsenal-logo-vector.png',
                            secondTeamName: 'Arsenal',
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomMatchResult(
                            firstTeamLogo:
                                'assets/images/manchester-city-fc-logo.png',
                            firstTeamName: 'Man. City',
                            result: '4-0',
                            secondTeamLogo:
                                'assets/images/chelsea-fc-logo-preview.png',
                            secondTeamName: 'Chelsea',
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomMatchResult(
                            firstTeamLogo:
                                'assets/images/tottenham-hotspur-fc-logo.png',
                            firstTeamName: 'Tottenham ',
                            result: '2-1',
                            secondTeamLogo:
                                'assets/images/newcastle-united-logo-preview.png',
                            secondTeamName: 'Newcastle',
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomMatchResult(
                            firstTeamLogo:
                                'assets/images/manchester-united-logo-vector.png',
                            firstTeamName: 'Man.Unit.',
                            result: '5-2',
                            secondTeamLogo:
                                'assets/images/crystal_palace_fc-logo_brandlogos.net_asddi.png',
                            secondTeamName: 'C.Palace',
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          CustomMatchResult(
                            firstTeamLogo:
                                'assets/images/leicester-city-vector-logo.png',
                            firstTeamName: 'Leicester',
                            result: '3-1',
                            secondTeamLogo:
                                'assets/images/aston-villa-logo.png',
                            secondTeamName: 'A.Villa',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
