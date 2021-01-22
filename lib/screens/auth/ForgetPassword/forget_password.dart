import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/screens/auth/ForgetPassword/controller.dart';
import 'package:roadmap/screens/auth/ForgetPassword/new_password.dart';
import 'package:roadmap/utilities/AppTheme.dart';
import 'package:roadmap/utilities/TextFields.dart';
import 'package:roadmap/widgets/Buttons.dart';
import 'package:roadmap/widgets/auth_logo.dart';
import 'package:toast/toast.dart';

class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();
  String email;
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ForgetPasswordController _controller = ForgetPasswordController();
  bool _loading = false;
  void _submit(BuildContext context) {
    if (!_formKey.currentState.validate())
      return;
    else {
      setState(() {
        _loading = true;
      });
      _controller
          .forgetPassword(
        email: email,
      )
          .then((response) {
        print(response.statusCode.toString() + "<<<<<<<<<<<<<<<   status");
        if (response.success) {
          Toast.show('وصلك رابط علي بريد الخاص الذي ادخلته', context);
          setState(() {
            _loading = false;
          });
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => NewPassword(),
            ),
          );
        } else {
          setState(() {
            _loading = false;
          });
          if (response.errType == 0) {
            // network error
            Toast.show("تأكد من اتصالك بالانترنت", context);
          } else if (response.errType == 1) {
            // error from server
            print(response.error.toString());
            if (response.statusCode == 400 || response.statusCode == 422) {
              Toast.show("البيانات التي قمت بادخالها غير صحيحة", context);
            }
          } else {
            // other error
            Toast.show("حدث خطأ ما , حاول مرة اخري", context,
                gravity: Toast.CENTER, duration: Toast.LENGTH_LONG);
          }
        }
      });
    }
  }

  void dispose() {
    emailController.dispose();
    super.dispose();
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
            "نسيت كلمة المرور",
            style: TextStyle(
              fontFamily: AppTheme.fontName,
            ),
          ),
        ),
        body: _loading
            ? Center(
                child: CupertinoActivityIndicator(
                animating: true,
                radius: 30,
              ))
            : SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        child: authLogo(
                            context: context,
                            welcomeMessage: "نسيت كلمة المرور",
                            title:
                                "ادخل البريد الآلكتروني الذي قمت بالتسجيل من خلاله لانشاء كلمة مرور جديدة"),
                      ),
                      textFormField(
                        context: context,
                        labelText: "ادخل البريد الالكتروني",
                        onChanged: (val) {
                          email = val;
                        },
                        validator: (String value) {
                          if (value.isEmpty) {
                            return "البريك الالكتروني مطلوب";
                          } else {
                            return null;
                          }
                        },
                      ),
                      SizedBox(
                        height: 60,
                      ),
                      btn(
                        context: context,
                        txt: "متابعة",
                        onTap: () {
                          _submit(context);
                        },
                      ),
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
