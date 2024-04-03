import 'package:flutter/material.dart';

import 'widgets/resulty_view_body.dart';

class ResultyView extends StatelessWidget {
  const ResultyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 87, 85, 189),
      body: ResultyViewBody(),
    );
  }
}
