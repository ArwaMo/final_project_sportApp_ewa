import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:sport_app_ewa/data/models/countries_model.dart';
import 'package:sport_app_ewa/screens/countries/countries_screen.dart';
import 'package:sport_app_ewa/screens/home/components/dialog_category.dart';
import 'package:sport_app_ewa/screens/home/components/sport_category.dart';
import 'package:sport_app_ewa/screens/widgets/drawer_widget.dart';
import 'package:sport_app_ewa/services/services.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Image.asset('assets/images/logo_player.png'),
        ],
      ),
      drawer: const DrawerWidget(),
      body: Column(
        children: [
          SizedBox(
            height: 15,
          ),
          const Text(
            'SPORTS CATEGORIES',
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xff2a3c4e)),
          ),
          const SizedBox(
            height: 90,
          ),
          GridView(
            shrinkWrap: true,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, crossAxisSpacing: 8, mainAxisSpacing: 9),
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SportCategory(
                  image: 'assets/images/Football.jpg',
                  text: 'Football',
                  fun: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const CountriesScreen()),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SportCategory(
                  image: 'assets/images/BasketBall.jpeg',
                  text: 'BasketBall',
                  fun: () {
                    dialog(context, 'Coming soon');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: SportCategory(
                  image: 'assets/images/Cricket.jpg',
                  text: 'Cricket',
                  fun: () {
                    dialog(context, 'Coming soon');
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: SportCategory(
                  image: 'assets/images/tennis.jpg',
                  text: 'Tennis',
                  fun: () {
                    dialog(context, 'Coming soon');
                  },
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
