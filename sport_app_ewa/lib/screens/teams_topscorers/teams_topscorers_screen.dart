import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport_app_ewa/data/models/teams_model.dart';
import 'package:sport_app_ewa/screens/login/components/text_field_widget.dart';
import 'package:sport_app_ewa/screens/widgets/drawer_widget.dart';
import 'package:sport_app_ewa/services/services.dart';

class TeamsTopScorersScreen extends StatefulWidget {
  TeamsTopScorersScreen({
    Key? key,
    required this.leagueId,
  }) : super(key: key);

  final dynamic leagueId;

  @override
  State<TeamsTopScorersScreen> createState() => _TeamsTopScorersScreenState();
}

class _TeamsTopScorersScreenState extends State<TeamsTopScorersScreen>
    with TickerProviderStateMixin {
  late final TabController tabController;
  List<TeamModel>? teamsResult;
  TextEditingController searchController = TextEditingController();
  bool isLoading = true;
  TeamModel? team;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();
    // getData();

    Services().getTopscorersAPI(widget.leagueId);
  }

  Future<void> getData() async {
    try {
      // print('this leagueId ${widget.leagueId}');
      List<TeamModel>? result =
          await Services().getTeamsAPI(widget.leagueId, searchController.text);
      print('here fun getData');
      print(result);
      if (result != null) {
        //  print('here fun getData');
        // print(result);
        setState(() {
          teamsResult = result;
          isLoading = false;
        });
      } else {
        print('eror');
      }
    } catch (e) {
      print('Error fetching teams: $e');
      setState(() {
        isLoading = false;
      });
    }
  }

  // Future<void> getDataTop() async {
  //   try {
  //     var result = await Services().getTeamsAPI(
  //       widget.leagueId,
  //     );
  //     setState(() {
  //       teamsResult = result;
  //       isLoading = false;
  //     });
  //   } catch (e) {
  //     print('Error fetching teams: $e');
  //     setState(() {
  //       isLoading = false;
  //     });
  //   }
  // }

  @override
  void dispose() {
    tabController.dispose();
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        bottom: TabBar(
          controller: tabController,
          tabs: const [
            Tab(
              text: 'Teams',
            ),
            Tab(
              text: 'Topscorers',
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: tabController,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                const SizedBox(height: 10),
                TextFieldWidget(
                  text: 'Search for a team',
                  controller: searchController,
                  icon: Icons.search,
                ),
                if (isLoading)
                  const Center(
                    child: CircularProgressIndicator(),
                  )
                else if (teamsResult != null)
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                        itemCount: teamsResult!.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                        ),
                        itemBuilder: (context, index) {
                          final team = teamsResult![index];
                          return Container(
                            decoration: const BoxDecoration(
                              color: Color(0xff9e8a84),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image.network(
                                  team.teamLogo ?? '',
                                  scale: 2,
                                  errorBuilder: (context, error, stackTrace) =>
                                      const Icon(Icons.error),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                  team.teamName,
                                  style: const TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ),
              ],
            ),
          ),

          //here Topscrores
          ListView.separated(
            itemBuilder: (BuildContext context, int index) {
              return;
            },
            separatorBuilder: (BuildContext context, int index) {
              return const Divider();
            },
            itemCount: 0,
          ),
        ],
      ),
    );
  }
}
