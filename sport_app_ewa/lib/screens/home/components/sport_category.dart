import 'package:flutter/material.dart';

class SportCategory extends StatelessWidget {
  const SportCategory(
      {super.key, required this.image, required this.text, required this.fun});

  final String image;
  final String text;
  final Function() fun;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(),
      child: InkWell(
        onTap: () {
          fun();
        },
        child: Column(
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Text(
              text,
              style: const TextStyle(fontWeight: FontWeight.w500, fontSize: 17),
            ),
          ],
        ),
      ),
    );
  }
}
