// ignore_for_file: unnecessary_string_interpolations, unused_local_variable, library_private_types_in_public_api, use_super_parameters, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sport_app_ewa/cubit/get_info_cubit.dart';
import 'package:sport_app_ewa/data/global_data/global_data.dart';
import 'package:sport_app_ewa/data/models/players_model.dart';
import 'package:sport_app_ewa/screens/widgets/text_field_widget.dart';
import 'package:sport_app_ewa/screens/players/components/dialog_players.dart';
import 'package:sport_app_ewa/screens/widgets/drawer_widget.dart';

class PlayersScreen extends StatefulWidget {
  PlayersScreen({Key? key, required this.players}) : super(key: key);

  final List<PlayersModel> players;

  @override
  _PlayersScreenState createState() => _PlayersScreenState();
}

class _PlayersScreenState extends State<PlayersScreen> {
  @override
  void initState() {
    super.initState();
    _fetchPlayers();
  }

  void _fetchPlayers() {
    context
        .read<GetInfoCubit>()
        .getInfoPlayers(widget.players, searchPlayers.text);
  }

  void onSearchPressed() {
    searchPlayers.clear();
    _fetchPlayers();
  }

  void _onSearchTextChanged(String text) {
    _fetchPlayers();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const DrawerWidget(),
      appBar: AppBar(
        title: const Text(
          'Players',
          style: TextStyle(
            color: Color(0xff171c38),
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              TextFieldWidget(
                text: 'Search for a player',
                controller: searchPlayers,
                prefixIcon: Icons.search,
                iconClose: () => onSearchPressed(),
                icon: Icons.close,
                fun: _onSearchTextChanged,
              ),
              const SizedBox(
                height: 10,
              ),
              BlocBuilder<GetInfoCubit, GetInfoState>(
                  builder: (context, state) {
                if (state is GetInfoPlayersLoading) {
                  return SizedBox(
                    height: MediaQuery.of(context).size.height / 1.7,
                    child: const Center(
                      child: CircularProgressIndicator(),
                    ),
                  );
                } else if (state is GetInfoPlayersSuccess) {
                  return ListView.separated(
                    physics: const ScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final player = state.playerList![index];
                      return InkWell(
                        onTap: () {
                          dialog(
                            context,
                            player.playerName,
                            player.playerNumber,
                            player.playerCountry,
                            player.playerImage,
                            player.playerType,
                            player.playerAge,
                            player.playerYellowCards,
                            player.playerRedCards,
                            player.playerGoals,
                            player.playerAssists,
                          );
                        },
                        child: Card(
                          color: const Color(0xff1b223f),
                          child: ListTile(
                            leading: ClipOval(
                              child: Image.network(
                                '${player.playerImage ?? ''}',
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(
                                  Icons.image,
                                  color: Color(0xffeefdfe),
                                ),
                              ),
                            ),
                            title: Text(
                              '${player.playerName ?? ''}',
                              style: const TextStyle(
                                color: Color(0xffeefdfe),
                                fontSize: 17,
                              ),
                            ),
                            subtitle: Text(
                              '${player.playerType ?? ''}',
                              style: const TextStyle(
                                color: Color(0xffa1a0b7),
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                    separatorBuilder: (context, index) {
                      return const Divider();
                    },
                    itemCount: state.playerList!.length,
                  );
                } else if (state is GetInfoPlayersError) {
                  return const Center(
                    child: Text('An error occurred while fetching player data'),
                  );
                }
                return Container();
              })
            ],
          ),
        ),
      ),
    );
  }
}
