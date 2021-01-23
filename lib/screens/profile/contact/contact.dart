import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/screens/profile/contact/controller.dart';
import 'package:roadmap/utilities/AppTheme.dart';
import 'package:roadmap/widgets/Buttons.dart';
import 'package:roadmap/widgets/auth_logo.dart';
import 'package:toast/toast.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _loading = false;
  ContactUsController _controller = ContactUsController();
  String message,email;
  int sender = 1;
  void _submit(BuildContext context) {
    if (!_formKey.currentState.validate())
      return;
    else {
      setState(() {
        _loading = true;
      });
      _controller.postData(message: message, sender: email).then((response) {
        print(response.statusCode.toString() + "<<<<<<<<<<<<<<<   status");
        if (response.success) {
          Toast.show("تم ارسال الرسالة بنجاح", context);
          setState(() {
            _loading = false;
          });
        } else {
          setState(() {
            _loading = false;
          });
          if (response.errType == 0) {
            // network error
            Toast.show("Check your internet connection", context);
          } else if (response.errType == 1) {
            // error from server
            print(response.error.toString());
            if (response.statusCode == 400 || response.statusCode == 422) {
              Toast.show("invalid data", context);
            }
          } else {
            // other error
            Toast.show("server error  , try again later", context,
                gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
          }
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
//    final messageController = TextEditingController();
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppTheme.appBarColor,
          title: Text("تواصل معنا "),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        child: authLogo(
                            context: context,
                            welcomeMessage: "يسعدنا تواصلك معنا ",
                            title:
                                "يسعدنا ارسال مقتراحاتك والمشاكل التي تقابلك والتحسينات التي تفضلها"),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                        child: TextFormField(
                          onChanged: (val) {
                            email = val;
                          },
                          validator: (val){
                            if(val.isEmpty){
                              return "email is required";
                            }else return null ;
                          },
//                          controller: messageController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'البريد الاكترونى',
                          ),
                          keyboardType: TextInputType.emailAddress,
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                          maxLines: 1,
                        ),
                      ),
                      SizedBox(height: 20,),  Padding(
                        padding: const EdgeInsets.only(right: 8.0, left: 8.0),
                        child: TextFormField(
                          onChanged: (val) {
                            message = val;
                          },
//                          controller: messageController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                            labelText: 'اترك رسالتك',
                          ),
                          keyboardType: TextInputType.text,
                          style: TextStyle(fontSize: 16.0, color: Colors.black),
                          maxLines: 10,validator: (val){
                          if(val.isEmpty){
                            return "message is required";
                          }else return null ;
                        },
                        ),
                      ),
                      SizedBox(height: 20,),
                      Container(
                        padding: EdgeInsets.all(15),
                        child:
                        _loading
                            ? Center(
                            child: CupertinoActivityIndicator(
                              animating: true,
                              radius: 30,
                            ))
                            :
                        btn(
                            context: context,
                            txt: "ارسال الرسالة",
                            onTap: () {
                              print(">>>>>>>>>>>>>>>>>>>> $email >>>>>>>>>>> $message");
                              _submit(context);
                            }),
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
