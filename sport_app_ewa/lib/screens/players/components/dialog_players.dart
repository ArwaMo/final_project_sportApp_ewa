import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

dialog(
    BuildContext context,
    String? name, //
    String? number, //
    String? country,
    String? image, //
    String? position, //
    String? age, //
    String? yellowCardsNum,
    String? redCardsNum,
    String? goals,
    String? assists) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      //insetPadding: EdgeInsets.all(10),
      child: Stack(
        children: [
          Align(
            alignment: AlignmentDirectional.center,
            child: ClipOval(
              child: Image.network(
                image ?? '',
                errorBuilder: (context, error, stackTrace) =>
                    const Icon(Icons.image),
                width: 200,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: 440,
            left: 20,
            child: Container(
              width: 270,
              height: 200,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 3),
                    ),
                  ],
                  color: const Color.fromARGB(255, 201, 221, 255),
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        number ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30,
                            color: Colors.blue),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        name ?? '',
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 20),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Age:   $age',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'country:  ${country ?? ''}',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Position:   $position'),
                      Text('Yellow Cards:  ${yellowCardsNum ?? ''}'),
                      Text('Red Cards:  ${redCardsNum ?? ''}'),
                      Text('Goals:  ${goals ?? ''}'),
                      Text('Assists:  ${assists ?? ''}'),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    ),
  );
}
