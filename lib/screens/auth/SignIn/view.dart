import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/screens/auth/ForgetPassword/forget_password.dart';
import 'package:roadmap/screens/auth/SignUp/signup.dart';
import 'package:roadmap/utilities/AppTheme.dart';
import 'package:roadmap/utilities/TextFields.dart';
import 'package:roadmap/widgets/Buttons.dart';
import 'package:roadmap/widgets/auth_logo.dart';
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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppTheme.backGroundColor,
        body: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: authLogo(
                      context: context,
                      welcomeMessage: "مرحبا بعدودتك مرة اخرى",
                      title: "من فضلك قم بتسجيل الدخول لحسابك"),
                ),
                textFormField(
                  context: context,
                  onChanged: (val) {
                    name = val;
                  },
                  labelText: "اسم المستخدم",
                  validator: (String val) {
                    if (val.isEmpty) {
                      return "اسم المستخدم مطلوب";
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
                    labelText: "كلمة المرور",
                    validator: (String val) {
                      if (val.isEmpty) {
                        return "كلمة المرور مطلوبة";
                      } else
                        return null;
                    },
                    textInputType: TextInputType.visiblePassword,
                    obscureText: true),
                SizedBox(
                  height: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ForgetPassword(),
                          ),
                        );
                      },
                      child: Text(
                        'نسيت كلمة المرور',
                        style: TextStyle(
                          color: AppTheme.cardColor,
                          fontFamily: AppTheme.fontName,
                        ),
                      ),
                    ),
                  ],
                ),
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
                          txt: "دخول"),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => Signup(),
                      ),
                    );
                  },
                  child: Text(
                    'مستخدم جديد ؟ قم بالتسجيل',
                    style: TextStyle(
                      color: AppTheme.cardColor,
                      fontFamily: AppTheme.fontName,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
