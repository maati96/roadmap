import 'package:flutter/material.dart';

Future<bool> alert(
    {BuildContext context,
    String title,
    String image,
    Color color,
    String action1,
    String action2,
    Function function1,
    Function function2}) {
  return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
            buttonPadding: EdgeInsets.symmetric(horizontal: 16),
            backgroundColor: color ?? Theme.of(context).backgroundColor,
            elevation: 6.0,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
            title: Column(children: <Widget>[
              Image(height: 90, image: AssetImage(image)),
            ]),
            content: Text(title,
                style: TextStyle(
                    color: Theme.of(context).accentColor,
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center),
            actions: <Widget>[
              Center(
                child: TextButton(
                  child: Text(
                    action1,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: function1 ?? () {},
                ),
              ),
              Divider(
                thickness: 4,
              ),
              Center(
                child: FlatButton(
                  child: Text(
                    action2,
                    style: TextStyle(
                        color: Theme.of(context).accentColor,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  onPressed: function2,
                ),
              )
            ],
          ));
}
