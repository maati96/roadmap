//import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
//import 'package:roadmap/main.dart';
//import 'package:roadmap/screens/auth/forget_password.dart';
//import 'package:roadmap/screens/auth/signup.dart';
//import 'package:roadmap/utilities/storage.dart';
//import 'package:roadmap/webservices/auth/auth.dart';
//
//class Login extends StatefulWidget {
//  @override
//  _LoginState createState() => _LoginState();
//}
//
//class _LoginState extends State<Login> {
//  final SecureStorage secureStorage = SecureStorage();
//
//  TextEditingController emailController = TextEditingController();
//  TextEditingController passwordController = TextEditingController();
//  GlobalKey<FormState> _key = new GlobalKey();
//
//  _submit() {
//    var username = emailController.text;
//    var password = passwordController.text;
//    Provider.of<Auth>(context, listen: false).attemptLogIn(
//        data: {
//          "username": username,
//          "password": password,
//        },
//        success: () {
//          if (username != null) {
//            storage.write(key: 'key', value: username);
//          } else if (password != null) {
//            storage.write(key: 'key', value: password);
//          }
//          Navigator.of(context).pushNamed('/start');
//        },
//        error: () {
//          displayDialog(context, "error", "error in login");
//        });
//  }
//
//  @override
//  void initState() {
//    super.initState();
//    emailController = TextEditingController(text: "");
//    passwordController = TextEditingController(text: "");
//  }
//
//  @override
//  void dispose() {
//    emailController.dispose();
//    passwordController.dispose();
//    super.dispose();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      body: SingleChildScrollView(
//        child: Padding(
//            padding: const EdgeInsets.all(30.0),
//            child: Column(
//              children: [
//                Container(
//                  alignment: Alignment.topCenter,
//                  child: Image(
//                    image: AssetImage('assets/images/logo.png'),
//                  ),
//                ),
//                signInForm(),
//                Container(
//                  padding: EdgeInsets.only(top: 10.0),
//                  child: Text("OR",
//                      style: TextStyle(
//                        fontWeight: FontWeight.bold,
//                      )),
//                ),
//                Container(
//                  padding: EdgeInsets.only(top: 10.0),
//                  child: Column(
//                    children: [
//                      _flatButton("Login with Facebook",
//                          [Color(0xFF367FC0), Color(0xFF367FC0)]),
//                      _flatButton("Login with Google",
//                          [Color(0xFFDD4B39), Color(0xFFDD4B39)]),
//                    ],
//                  ),
//                ),
//                Padding(
//                  padding: const EdgeInsets.only(top: 20.0),
//                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
//                    children: [
//                      Text("New user?"),
//                      RaisedButton(
//                        child: Text(
//                          "Sign Up",
//                          style: TextStyle(color: Color(0xFFFD8176)),
//                        ),
//                        color: Colors.transparent,
//                        elevation: 0,
//                        onPressed: () {
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(builder: (context) => Signup()),
//                          );
//                        },
//                      ),
//                    ],
//                  ),
//                ),
//              ],
//            )),
//      ),
//    );
//  }
//
//  Widget signInForm() {
//    return Container(
//      padding: EdgeInsets.only(top: 20),
//      child: Form(
//        key: _key,
//        autovalidateMode: AutovalidateMode.always,
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.start,
//          children: [
//            TextFormField(
//              controller: emailController,
//              validator: validateUserName,
//              decoration: InputDecoration(
//                hintText: 'you@example.com',
//                labelText: 'Email Adress',
//                prefixIcon: Icon(Icons.email),
//                labelStyle: TextStyle(
//                  color: Color(0xFFFD7E77),
//                ),
//              ),
//            ),
//            TextFormField(
//              obscureText: true,
//              controller: passwordController,
//              validator: (String val) {
//                if (val.isEmpty) {
//                  return "plese enter your password";
//                }
//                return null;
//              },
//              decoration: InputDecoration(
//                hintText: 'Enter your Password',
//                labelText: 'Password',
//                prefixIcon: Icon(Icons.lock),
//                labelStyle: TextStyle(
//                  color: Color(0xFFFD7E77),
//                ),
//              ),
//            ),
//            Padding(
//              padding: const EdgeInsets.all(4.0),
//              child: Container(
//                alignment: Alignment.topRight,
//                child: RaisedButton(
//                  child: Text("ForgetPassword"),
//                  color: Colors.transparent,
//                  elevation: 0,
//                  onPressed: () {
//                    Navigator.push(
//                      context,
//                      MaterialPageRoute(builder: (context) => ForgetPassword()),
//                    );
//                  },
//                ),
//              ),
//            ),
//            Column(
//              crossAxisAlignment: CrossAxisAlignment.stretch,
//              children: [
//                _flatButton("Login", [Color(0xFFFF5B7F), Color(0xFFFC9272)])
//              ],
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//
//  Widget _flatButton(String text, List<Color> color) {
//    return Container(
//      margin: EdgeInsets.only(bottom: 10),
//      width: MediaQuery.of(context).size.width - 20,
//      height: 55,
//      decoration: BoxDecoration(
//        borderRadius: BorderRadius.circular(5),color: Colors.yellow
//
////        gradient: LinearGradient(
////          List: color,
////          begin: FractionalOffset.centerLeft,
////          end: FractionalOffset.centerRight,
////        ),
//      ),
//      child: FlatButton(
//        child: Text(
//          text,
//          style: TextStyle(color: Colors.white, fontSize: 18),
//        ),
//        onPressed: () async {
//          if (_key.currentState.validate()) {
//            _submit();
//          }
//        },
//      ),
//    );
//  }
//
//  String validateUserName(String value) {
//    String patttern = r'(^[a-zA-Z ]*$)';
//    RegExp regExp = new RegExp(patttern);
//    if (value.length == 0) {
//      return "Name is Required";
//    } else if (!regExp.hasMatch(value)) {
//      return "Name must be a-z and A-Z";
//    }
//    return null;
//  }
//
//  String validateEmail(String value) {
//    String pattern =
//        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
//    RegExp regExp = new RegExp(pattern);
//    if (value.length == 0) {
//      return "Email is Required";
//    } else if (!regExp.hasMatch(value)) {
//      return "Invalid Email";
//    } else {
//      return null;
//    }
//  }
//
//  void displayDialog(BuildContext context, String title, String text) =>
//      showDialog(
//        context: context,
//        builder: (context) =>
//            AlertDialog(title: Text(title), content: Text(text)),
//      );
//}
