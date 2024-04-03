import 'package:flutter/material.dart';

import 'widgets/resulty_view_body.dart';

class ResultyyView extends StatelessWidget {
  const ResultyyView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color.fromARGB(108, 185, 205, 247),
      body: ResultyViewBody(),
    );
  }
}
