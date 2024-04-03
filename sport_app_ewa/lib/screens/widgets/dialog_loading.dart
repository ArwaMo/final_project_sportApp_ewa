import 'package:flutter/material.dart';

void showLoading(
  BuildContext context,
) {
  showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) {
      return SimpleDialog(
        backgroundColor: Colors.transparent,
        elevation: 0,
        children: [
          Center(
            child: CircularProgressIndicator(
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      );
    },
  );
}
