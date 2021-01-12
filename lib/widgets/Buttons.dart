import 'package:flutter/material.dart';


Widget btn({BuildContext context,String txt,Function onTap}){
  return  Center(
    child: InkWell(
      onTap: onTap,
      child: Material(
        elevation: 3,
        child: Container(
          decoration: BoxDecoration(
              color:Colors.green
          ),
          width: MediaQuery.of(context).size.width*.9,
          height: 50,
          child: Center(
            child: Text(
              txt,
              style: TextStyle(
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