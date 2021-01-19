import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/screens/auth/SignUp/controller.dart';
import 'package:roadmap/screens/start.dart';
import 'package:roadmap/utilities/AppTheme.dart';
import 'package:roadmap/utilities/TextFields.dart';
import 'package:roadmap/widgets/Buttons.dart';
import 'package:roadmap/widgets/auth_logo.dart';
import 'package:toast/toast.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  String email, username, password, confirmPass;
  GlobalKey<FormState> formState = new GlobalKey<FormState>();
  bool _loading = false;
  SignUpController _controller = SignUpController();
  void _submit(BuildContext context) {
    if (!formState.currentState.validate())
      return;
    else {
      setState(() {
        _loading = true;
      });
      _controller
          .userSignUp(
        username: username,
        email: email,
        password: password,
        passwordConfirm: confirmPass,
      )
          .then((response) {
        print(response.statusCode.toString() + "<<<<<<<<<<<<<<<   status");
        if (response.success) {
          setState(() {
            _loading = false;
          });
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => StartNavigationButtom(),
            ),
          );
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
        appBar: AppBar(
          backgroundColor: AppTheme.appBarColor,
          title: Text(
            "انشاء حساب جديد",
            style: TextStyle(
              fontFamily: AppTheme.fontName,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                child: authLogo(
                    context: context,
                    welcomeMessage: "يسعدنا انضمامك لنا",
                    title: "من فضلك قم بتسجيل بيناتك لانشاء حسابك معنا "),
              ),
              signUpForm(),
              Container(
                padding: EdgeInsets.only(top: 8.0),
                child: Text(
                  "أو",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.cardColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "مستخدم حالي ؟",
                      style: TextStyle(
                        color: AppTheme.cardColor,
                        fontFamily: AppTheme.fontName,
                      ),
                    ),
                    TextButton(
                      child: Text(
                        "تسجيل دخول",
                        style: TextStyle(
                          color: AppTheme.cardColor,
                          fontFamily: AppTheme.boldFont,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget signUpForm() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Form(
        key: formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textFormField(
              context: context,
              labelText: "اسم المستخدم",
              validator: (String val) {
                if (val.isEmpty) {
                  return "هذا الحقل مطلوب";
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                username = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            textFormField(
              context: context,
              labelText: "البريك الالكتروني",
              validator: (String val) {
                if (val.isEmpty) {
                  return "هذا الحقل مطلوب";
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                email = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            textFormField(
              context: context,
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
              labelText: "كلمة السر",
              validator: (String val) {
                if (val.isEmpty) {
                  return "هذا الحقل مطلوب";
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                password = value;
              },
            ),
            SizedBox(
              height: 10,
            ),
            textFormField(
              context: context,
              obscureText: true,
              textInputType: TextInputType.visiblePassword,
              labelText: "تأكيد كلمة السر",
              validator: (String val) {
                if (val.isEmpty) {
                  return "هذا الحقل مطلوب";
                } else {
                  return null;
                }
              },
              onChanged: (value) {
                confirmPass = value;
              },
            ),
            SizedBox(
              height: 15,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _loading
                    ? CupertinoActivityIndicator(
                        animating: true,
                        radius: 20,
                      )
                    : btn(
                        context: context,
                        txt: "انشاء حساب جديد",
                        onTap: () {
                          _submit(context);
                        },
                      ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
