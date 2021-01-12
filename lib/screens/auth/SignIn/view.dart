import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/utilities/TextFields.dart';
import 'package:roadmap/widgets/Buttons.dart';

import '../../start.dart';
import 'controller.dart';
import 'package:toast/toast.dart';

class SignInView extends StatefulWidget {
  @override
  _SignInViewState createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  String name, password;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  bool _loading = false;
  SignInController _controller = SignInController();
  void _submit(BuildContext context) {
    if (!_formKey.currentState.validate())
      return;
    else {
      setState(() {
        _loading = true;
      });
      _controller
          .userSignIn(
        name: name,
        password: password,
      )
          .then((response) {
        print(response.statusCode.toString() + "<<<<<<<<<<<<<<<   status");
        if (response.success) {
          setState(() {
            _loading = false;
          });
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) => StartNavigationButtom()));
//          Navigator.pushNamed(context, "/start");
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

//              Toast.show(response.error['non_field_errors'].toString(), context,
//                  gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
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
    return Scaffold(
      appBar: AppBar(
        title: Text("login"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              textFormField(
                context: context,
                onChanged: (val) {
                  name = val;
                },
                labelText: "name",
                validator: (String val) {
                  if (val.isEmpty) {
                    return "name is required";
                  } else
                    return null;
                },
              ),
              SizedBox(
                height: 15,
              ),
              textFormField(
                  context: context,
                  onChanged: (val) {
                    password = val;
                  },
                  labelText: "password",
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "password is required";
                    } else
                      return null;
                  },
                  textInputType: TextInputType.visiblePassword,
                  obscureText: true),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: _loading
                    ? CupertinoActivityIndicator(
                        animating: true,
                        radius: 20,
                      )
                    : btn(
                        context: context,
                        onTap: () {
                          _submit(context);
                        },
                        txt: "send"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
