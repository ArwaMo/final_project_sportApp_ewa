// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app_ewa/cubit/get_info_cubit.dart';
import 'package:sport_app_ewa/data/models/countries_model.dart';
import 'package:sport_app_ewa/data/models/leagues_model.dart';
import 'package:sport_app_ewa/screens/teams_topscorers/teams_topscorers_screen.dart';
import 'package:sport_app_ewa/screens/widgets/drawer_widget.dart';
import 'package:sport_app_ewa/services/services.dart';

class LeaguesScreen extends StatefulWidget {
  const LeaguesScreen({
    super.key,
    this.countryKey,
  });
  final dynamic countryKey;
  @override
  State<LeaguesScreen> createState() => _LeaguesScreenState();
}

class _LeaguesScreenState extends State<LeaguesScreen> {
  @override
  void initState() {
    context.read<GetInfoCubit>().getInfoLeagues(widget.countryKey);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 33, 39, 74),
      appBar: AppBar(
        title: const Text(
          'Leagues',
          style: TextStyle(
            color: Color(0xffeefdfe),
          ),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 33, 39, 74),
        iconTheme: IconThemeData(
          color: Color(0xffeefdfe),
        ),
      ),
      drawer: DrawerWidget(),
      body: BlocBuilder<GetInfoCubit, GetInfoState>(
        buildWhen: (previous, current) => current is GetInfoLeagueSuccess,
        builder: (context, state) {
          if (state is GetInfoLeagueLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetInfoLeagueSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Align(
                      alignment: AlignmentDirectional.topStart,
                      child: Text(
                        'Leagues of ${state.leaguesList.leagues[0].countryName}',
                        style: TextStyle(
                          fontSize: 25,
                          color: Color(0xffeefdfe),
                        ),
                      ),
                    ),
                  ),
                  ListView.separated(
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      final league = state.leaguesList.leagues[index];

                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => TeamsTopScorersScreen(
                                        leagueId: league.leagueKey,
                                      )),
                            );
                          },
                          child: Card(
                            color: Color(0xffc8ac89),
                            child: ListTile(
                              contentPadding: EdgeInsets.all(10),
                              trailing: ClipRRect(
                                borderRadius: BorderRadius.circular(3),
                                child: Image.network(
                                  league.countryLogo ?? '',
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.error),
                                  scale: 4,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              leading: ClipRRect(
                                borderRadius: BorderRadius.circular(20),
                                child: Image.network(
                                  league.leagueLogo ?? '',
                                  errorBuilder: (context, error, stackTrace) =>
                                      Icon(Icons.image),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              title: Text(
                                league.leagueName ?? '',
                                style: TextStyle(
                                    color: Color(0xff171c38), fontSize: 17),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider();
                    },
                    itemCount: state.leaguesList.leagues.length,
                  ),
                ],
              ),
            );
          } else if (state is GetInfoLeagueError) {
            return Center(
              child: Text('Something went wrong'),
            );
          } else {
            return Center(child: Text('Initial State'));
          }
        },
      ),
    );
  }
}
