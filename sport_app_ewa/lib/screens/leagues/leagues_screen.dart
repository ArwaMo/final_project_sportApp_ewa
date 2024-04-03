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
      appBar: AppBar(
        title: const Text('Leagues'),
        centerTitle: true,
      ),
      drawer: DrawerWidget(),
      body: BlocBuilder<GetInfoCubit, GetInfoState>(
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
                        style: TextStyle(fontSize: 25),
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
                            child: ListTile(
                              trailing: Image.network(
                                league.countryLogo ?? '',
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.error),
                                scale: 4,
                                fit: BoxFit.cover,
                              ),
                              leading: Image.network(
                                league.leagueLogo ?? '',
                                errorBuilder: (context, error, stackTrace) =>
                                    Icon(Icons.error),
                                fit: BoxFit.cover,
                              ),
                              title: Text(league.leagueName ?? ''),
                              subtitle: Text(league.countryName ?? ''),
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
