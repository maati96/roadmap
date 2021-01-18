import 'package:flutter/material.dart';
import 'package:roadmap/utilities/AppTheme.dart';
import 'package:roadmap/utilities/colors.dart';

Widget btn({BuildContext context, String txt, Function onTap}) {
  return Center(
    child: InkWell(
      onTap: onTap,
      child: Material(  
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Color(getColorHexFromStr("#E12160")), Color(getColorHexFromStr("#3F5CC8"))],
              begin: FractionalOffset.centerLeft,
              end: FractionalOffset.centerRight,
            ),
          ),
          width: MediaQuery.of(context).size.width * .9,
          height: 50,
          child: Center(
            child: Text(
              txt,
              style: TextStyle(
                fontFamily: AppTheme.fontName,
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
