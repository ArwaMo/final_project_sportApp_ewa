import 'package:flutter/material.dart';
import 'package:sport_app/views/results_view/widgets/custom_match_result.dart';
import 'package:sport_app/views/resulty_view/widgets/custom_match_resulty.dart';
import 'package:sport_app/views/resulty_view/widgets/share.dart';

class ResultyyViewBody extends StatelessWidget {
  final scorersModel player;

  const ResultyyViewBody({Key? key, required this.player}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: Column(
        children: [
          CustomMatchResultyy(
            firstTeamName: 'Player country',
            result: player.teamName,
            secondTeamName: '',
          ),
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
                Image.network(
                  'assets/images/criss.png',
                  width: 55,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  player.playerName,
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  'Player number: ${player.playerKey}',
                  style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromARGB(255, 255, 255, 255)),
                ),
                IconButton(
                  icon: Icon(
                    Icons.share,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ShareDialog(contentToShare: 'Share information');
                      },
                    );
                  },
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
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 230, 33, 8),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: const Text(
                                'Results',
                                style: TextStyle(
                                  fontSize: 18,
                                  color: Color.fromARGB(255, 255, 251, 251),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            Text(
                              'Championships',
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
                          padding: EdgeInsets.only(top: 30),
                          child: Column(
                            children: [],
                          ),
                        ),
                      ]))))
        ],
      ),
    );
  }
}
