import 'package:flutter/material.dart';
import 'package:share/share.dart';

class ShareDialog extends StatelessWidget {
  final String contentToShare;

  ShareDialog({required this.contentToShare});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      elevation: 0,
      backgroundColor: Colors.transparent,
      child: contentBox(context),
    );
  }

  contentBox(context) {
    return Stack(
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
              shape: BoxShape.rectangle,
              color: Color.fromARGB(223, 247, 245, 245),
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                BoxShadow(
                    color: Color.fromARGB(71, 0, 0, 0),
                    offset: Offset(0, 10),
                    blurRadius: 10),
              ]),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              Text(
                'Share Player Info',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
              ),
              SizedBox(
                height: 22,
              ),
              Text(
                contentToShare,
                style: TextStyle(fontSize: 14),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 22,
              ),
              Align(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: () {
                      Share.share(contentToShare);
                    },
                    child: Text(
                      'Share',
                      style: TextStyle(
                        fontSize: 18,
                        color: const Color.fromARGB(255, 24, 23, 23),
                      ),
                    )),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
