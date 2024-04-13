// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:share_plus/share_plus.dart';

dialog(
    BuildContext context,
    String? name,
    String? number,
    String? country,
    String? image,
    String? position,
    String? age,
    String? yellowCardsNum,
    String? redCardsNum,
    String? goals,
    String? assists) {
  showDialog<String>(
    context: context,
    builder: (BuildContext context) => Dialog(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
                alignment: AlignmentDirectional.topEnd,
                child: IconButton(
                    onPressed: () {
                      Share.share(
                        'Share $name information',
                      );
                    },
                    icon: Icon(
                      Icons.ios_share_outlined,
                    ))),
            Stack(children: [
              Align(
                alignment: AlignmentDirectional.topCenter,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20, bottom: 400),
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
              ),
              Positioned(
                top: 199,
                left: 15,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                      Padding(
                        padding: const EdgeInsets.only(left: 40),
                        child: Row(
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
                            Expanded(
                              flex: 1,
                              child: Text(
                                'country:  ${country ?? ''}',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Color.fromARGB(255, 127, 174, 255),
                      ),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 50),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('Position:   $position'),
                                Text('Yellow Cards:  ${yellowCardsNum ?? ''}'),
                                Text('Red Cards:  ${redCardsNum ?? ''}'),
                                Text('Goals:  ${goals ?? ''}'),
                                Text('Assists:  ${assists ?? ''}'),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ])
          ],
        ),
      ),
    ),
  );
}
