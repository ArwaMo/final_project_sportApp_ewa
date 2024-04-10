// ignore_for_file: unnecessary_string_interpolations

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app_ewa/cubit/get_info_cubit.dart';
import 'package:sport_app_ewa/data/global_data/global_data.dart';
import 'package:sport_app_ewa/data/models/players_model.dart';
import 'package:sport_app_ewa/screens/login/components/text_field_widget.dart';
import 'package:sport_app_ewa/screens/players/components/dialog_players.dart';
import 'package:sport_app_ewa/screens/widgets/drawer_widget.dart';
import 'package:sport_app_ewa/services/services.dart';

class PlayersScreen extends StatefulWidget {
  PlayersScreen({super.key, required this.player});

  @override
  State<PlayersScreen> createState() => _PlayersScreenState();
  int? player;
}

List<PlayersModel>? res;

class _PlayersScreenState extends State<PlayersScreen> {
  @override
  void initState() {
    super.initState();
    //print('player key::${widget.players[0].teamName}');
    context.read<GetInfoCubit>().getInfoPlayers(widget.player);
  }

  // Future<void> getPlayerKey() async {
  //   var fetchedPlayers = await Services().getPlayersAPI(widget.player);

  //   if (fetchedPlayers != null) {
  //     setState(() {
  //       res = fetchedPlayers;
  //     });
  //   }
  // }

  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const DrawerWidget(),
        appBar: AppBar(
          title: const Text('Players'),
          centerTitle: true,
        ),
        body: BlocBuilder<GetInfoCubit, GetInfoState>(
          builder: (context, state) {
            if (state is GetInfoPlayersLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is GetInfoPlayersSuccess) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 10),
                      TextFieldWidget(
                        text: 'Search for a player',
                        controller: searchPlayers,
                        icon: Icons.search,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ListView.separated(
                          physics: const ScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                dialog(
                                  context,
                                  state.playerList![index].playerName,
                                  state.playerList![index].playerNumber,
                                  state.playerList![index].playerCountry,
                                  state.playerList![index].playerImage,
                                  state.playerList![index].playerType,
                                  state.playerList![index].playerAge,
                                  state.playerList![index].playerYellowCards,
                                  state.playerList![index].playerRedCards,
                                  state.playerList![index].playerGoals,
                                  state.playerList![index].playerAssists,
                                );
                              },
                              child: Card(
                                child: ListTile(
                                  leading: Image.network(
                                      '${state.playerList![index].playerImage}',
                                      errorBuilder:
                                          (context, error, stackTrace) =>
                                              const Icon(Icons.image)),
                                  title: Text(
                                      '${state.playerList![index].playerName ?? ''}'),
                                  subtitle: Text(
                                      'Player Number: ${state.playerList![index].playerType ?? ''}'),
                                ),
                              ),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return const Divider();
                          },
                          itemCount: state.playerList!.length)
                    ],
                  ),
                ),
              );
            } else if (state is GetInfoPlayersError) {
              return const Center(
                child: Text('An error occurred while fetching player data'),
              );
            }
            return Container();
          },
        ));
  }
}
