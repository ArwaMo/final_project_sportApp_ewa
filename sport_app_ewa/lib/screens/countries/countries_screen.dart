// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:sport_app_ewa/cubit/get_current_country_cubit.dart';
import 'package:sport_app_ewa/cubit/get_info_cubit.dart';
import 'package:sport_app_ewa/data/models/countries_model.dart';
import 'package:sport_app_ewa/screens/leagues/leagues_screen.dart';
import 'package:sport_app_ewa/screens/widgets/drawer_widget.dart';

class CountriesScreen extends StatefulWidget {
  const CountriesScreen({super.key});

  @override
  State<CountriesScreen> createState() => _CountriesScreenState();
}

class _CountriesScreenState extends State<CountriesScreen> {
  CountriesList? countriesList;
  ScrollController controller = ScrollController();
  double itemHeight = 92.0;
  String? currentCountry;
  bool isColorDecoration = false;

  @override
  void initState() {
    context.read<GetInfoCubit>().getInfoCountry();

    super.initState();
  }

  List<String> allCountry = [];

  scrollCountry(String currentCountry) {
    int? scrollToIndex;
    for (int i = 0; i < allCountry.length; i++) {
      if (currentCountry == 'United States') {
        int index = allCountry.indexOf('USA');

        scrollToIndex = index;
      }

      if (currentCountry == allCountry[i]) {
        scrollToIndex = i;
        break;
      }
    }

    if (scrollToIndex! != 0) {
      Future.delayed(Duration(seconds: 6), () {
        controller.animateTo(
          scrollToIndex! * itemHeight,
          duration: Duration(milliseconds: 1000),
          curve: Curves.easeInOut,
        );
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Countries',
            style: TextStyle(
              color: Color((0xff171c38)),
            )),
        centerTitle: true,
      ),
      drawer: const DrawerWidget(),
      body: BlocBuilder<GetInfoCubit, GetInfoState>(
        buildWhen: (previous, current) => current is GetInfoCountrySuccess,
        builder: (context, state) {
          if (state is GetInfoCountryLoading) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is GetInfoCountrySuccess) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                controller: controller,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ElevatedButton.icon(
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(
                              const Color(0xffc8ac89))),
                      onPressed: () {
                        context
                            .read<GetCurrentCountryCubit>()
                            .getCurrentCountry(currentCountry);
                        scrollCountry('United States');

                        isColorDecoration = true;
                        setState(() {}); // edit in bloc
                      },
                      icon: Icon(
                        Icons.location_on,
                        color: Color(0xff171c38),
                      ),
                      label: Text(
                        'Get Current Location',
                        style: TextStyle(
                          color: Color.fromARGB(255, 29, 34, 64),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    BlocBuilder<GetCurrentCountryCubit, GetCurrentCountryState>(
                      builder: (context, state) {
                        if (state is GetCurrentCountryLoading) {
                          return Center(
                            child: LinearProgressIndicator(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                            ),
                          );
                        } else if (state is GetCurrentCountrySuccess) {
                          return RichText(
                            text: TextSpan(
                              text: 'Current Country: ',
                              style: TextStyle(color: Color(0xff171c38)),
                              children: <TextSpan>[
                                TextSpan(
                                    text: '${state.currentCountry}',
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 17)),
                              ],
                            ),
                          );
                        } else if (state is GetCurrentCountryError) {
                          return Center(
                            child: Text(
                                'There is an error, your current location cannot be retrieved'),
                          );
                        }
                        return Center(
                          child: Container(),
                        );
                      },
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    AnimationLimiter(
                      child: GridView.builder(
                        controller: controller,
                        physics: ScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: state.countriesList.countries.length,
                        itemBuilder: (context, index) {
                          final country = state.countriesList.countries[index];
                          allCountry.add(country.countryName!);

                          return AnimationConfiguration.staggeredGrid(
                              position: index,
                              duration: const Duration(milliseconds: 800),
                              columnCount: 2,
                              child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => LeaguesScreen(
                                                countryKey: country.countryKey,
                                              )),
                                    );
                                  },
                                  child: (state.countriesList.countries[index]
                                                  .countryName ==
                                              'USA' &&
                                          isColorDecoration)
                                      ? ScaleAnimation(
                                          child: FadeInAnimation(
                                            child: Column(
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        border: Border.symmetric(
                                                            vertical: BorderSide(
                                                                width: 10,
                                                                color: Color
                                                                    .fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0)),
                                                            horizontal: BorderSide(
                                                                width: 10,
                                                                color:
                                                                    Color.fromARGB(
                                                                        255,
                                                                        0,
                                                                        0,
                                                                        0)))),
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      child: Image.network(
                                                        country.countryLogo ??
                                                            '',
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            Icon(Icons.error),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Text(
                                                  country.countryName ??
                                                      'Unknown',
                                                  style: const TextStyle(
                                                      color: Color(0xff171c38),
                                                      fontSize: 17,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                              ],
                                            ),
                                          ),
                                        )
                                      : ScaleAnimation(
                                          child: FadeInAnimation(
                                            child: Container(
                                              decoration: const BoxDecoration(),
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: ClipRRect(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                      child: Image.network(
                                                        country.countryLogo ??
                                                            '',
                                                        fit: BoxFit.cover,
                                                        errorBuilder: (context,
                                                                error,
                                                                stackTrace) =>
                                                            const Icon(
                                                                Icons.image),
                                                      ),
                                                    ),
                                                  ),
                                                  Text(
                                                    country.countryName ??
                                                        'Unknown',
                                                    style: const TextStyle(
                                                        color:
                                                            Color(0xff171c38),
                                                        fontSize: 17,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        )));
                        },
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 7,
                          mainAxisSpacing: 2,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            );
          } else if (state is GetInfoCountryError) {
            return Center(child: Text('Something went wrong'));
          }

          return Center(child: Text('Initial State'));
        },
      ),
    );
  }
}
