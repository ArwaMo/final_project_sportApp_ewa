import 'package:flutter/material.dart';

import 'widgets/result_view_body.dart';

class ResultView extends StatelessWidget {
  const ResultView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 118, 118, 202),
      body: ResultViewBody(),
    );
  }
}
