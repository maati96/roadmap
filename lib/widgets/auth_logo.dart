import 'package:flutter/material.dart';
import 'package:roadmap/utilities/AppTheme.dart';

Widget authLogo({BuildContext context, String welcomeMessage, String title}) {
  return Padding(
    padding: const EdgeInsets.all(8),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10, bottom: 8),
          child: Center(
              child: Image.asset(
            "assets/images/logo.png",
            width: MediaQuery.of(context).size.width * .5,
            height: 180,
          )),
        ),
        Text(
          welcomeMessage,
          style: TextStyle(
              color: AppTheme.cardColor,
              fontSize: 14,
              fontFamily: AppTheme.boldFont,
              fontWeight: FontWeight.w900),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          title,
          style: TextStyle(
              color: AppTheme.cardColor,
              fontSize: 12,
              fontWeight: FontWeight.w600),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    ),
  );
}
