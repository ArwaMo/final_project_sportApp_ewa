// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app_ewa/cubit/get_info_cubit.dart';
import 'package:sport_app_ewa/data/global_data/global_data.dart';
import 'package:sport_app_ewa/data/models/teams_topscorers_model.dart';
import 'package:sport_app_ewa/data/models/topscorers_model.dart';
import 'package:sport_app_ewa/screens/login/components/text_field_widget.dart';
import 'package:sport_app_ewa/screens/players/players_screen.dart';
import 'package:sport_app_ewa/screens/widgets/drawer_widget.dart';
import 'package:sport_app_ewa/services/services.dart';

class TeamsTopScorersScreen extends StatefulWidget {
  const TeamsTopScorersScreen({
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
  TextEditingController searchController = TextEditingController();
  TeamTopscorersModel? team;
  @override
  void initState() {
    tabController = TabController(length: 2, vsync: this);
    super.initState();

    context
        .read<GetInfoCubit>()
        .getInfoTeam(widget.leagueId, searchController.text);

    print(widget.leagueId);
  }

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
          onTap: (value) {
            if (value == 1) {
              context.read<GetInfoCubit>().getInfoTopscorers(
                    widget.leagueId,
                  );
            } else {
              context
                  .read<GetInfoCubit>()
                  .getInfoTeam(widget.leagueId, searchController.text);
            }
          },
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
            child: BlocBuilder<GetInfoCubit, GetInfoState>(
              buildWhen: (previous, current) => current is GetInfoTeamSuccess,
              builder: (context, state) {
                if (state is GetInfoTeamLoading) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is GetInfoTeamSuccess) {
                  return Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        text: 'Search for a team',
                        controller: searchTeams,
                        icon: Icons.search,
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: GridView.builder(
                            itemCount: state.teamList!.length,
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                            ),
                            itemBuilder: (context, index) {
                              final team = state.teamList![index];
                              return InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => PlayersScreen(
                                            player: team.teamKey)),
                                  );
                                },
                                child: Container(
                                  decoration: const BoxDecoration(
                                    color: const Color(0xffc8ac89),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(20)),
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.network(
                                        team.teamLogo ?? '',
                                        scale: 2,
                                        errorBuilder:
                                            (context, error, stackTrace) =>
                                                const Icon(Icons.image),
                                      ),
                                      const SizedBox(
                                        height: 9,
                                      ),
                                      Text(
                                        team.teamName,
                                        style: const TextStyle(
                                          color: Color(0xff171c38),
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  );
                } else if (state is GetInfoTeamError) {
                  return const Center(
                    child: Text('There is no data to display'),
                  );
                }
                return const Center(
                  child: Text('Initial State'),
                );
              },
            ),
          ),

          //here Topscrores
          BlocBuilder<GetInfoCubit, GetInfoState>(
            builder: (context, state) {
              if (state is GetInfoTopscorersLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is GetInfoTopscorersSuccess) {
                return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return Stack(children: [
                      Card(
                        color: const Color(0xff1b223f),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: AlignmentDirectional.topStart,
                                  child: Container(
                                    width: 30,
                                    height: 30,
                                    decoration: const BoxDecoration(
                                        color: Color(0xffd30f59),
                                        borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(8))),
                                    child: Center(
                                      child: Text(
                                        ' ${state.topScorersList![index].playerPlace}',
                                        style: const TextStyle(
                                            color: Color(0xffeefdfe)),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(bottom: 20, left: 60),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '${state.topScorersList![index].playerName}',
                                        style: const TextStyle(
                                            color: Color(0xffeefdfe),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w500),
                                      ),
                                      Text(
                                        '${state.topScorersList![index].teamName}',
                                        style: const TextStyle(
                                            color: Color(0xffeefdfe),
                                            fontWeight: FontWeight.w300),
                                      ),
                                    ],
                                  ),
                                  Spacer(),
                                  Padding(
                                    padding: const EdgeInsets.only(right: 10),
                                    child: Text(
                                      '${state.topScorersList![index].goals}',
                                      style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Color(0xfff8f1e0)),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Positioned(
                          left: 300,
                          child: Opacity(
                            opacity: 0.1,
                            child: Image.asset(
                              'assets/images/logo.png',
                              width: 100,
                              height: 100,
                            ),
                          )),
                    ]);
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return const Divider();
                  },
                  itemCount: state.topScorersList!.length,
                );
              } else if (state is GetInfoTopscorersError) {
                return const Center(
                  child: Text('There is no data to display'),
                );
              }
              return const Center(child: Text('Initial State'));
            },
          ),
        ],
      ),
    );
  }
}
