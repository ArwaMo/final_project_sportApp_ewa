import 'package:flutter/material.dart';
import 'package:sport_app/views/home_view/home_view.dart';

import 'widgets/League_Views_body.dart';

class LeagueViews extends StatelessWidget {
  const LeagueViews({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 18,
                height: 2,
                decoration: BoxDecoration(
                  color: Colors.black,
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
                  color: Colors.black,
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
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
            ],
          ),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: Icon(
              Icons.settings,
              size: 30,
            ),
          )
        ],
      ),
      body: const LeagueViewsody(),
    );
  }
}
