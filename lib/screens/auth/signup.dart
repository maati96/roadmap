import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../start.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final userNameController = TextEditingController();
  String email, username, password, confirmPass;
  GlobalKey<FormState> formState = new GlobalKey<FormState>();

  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    userNameController.dispose();
    super.dispose();
  }

  void _submit() async {
    var formData = formState.currentState;
    if (formData.validate()) {
      formData.save();
      var data = {
        "username": userNameController.text,
        "email": emailController.text,
        "password1": passwordController.text,
        "password2": confirmPasswordController.text
      };
      var url = "https://roadmap-django-api.herokuapp.com/rest-auth/signup";
      var response = await http.post(url, body: data);
      var responseBody = jsonDecode(response.body.toString());
      if (responseBody == true) {
        Navigator.of(context).push(
            MaterialPageRoute(builder: (context) => StartNavigationButtom()));
      }
      print(responseBody.toString());
    } else {
      print("error resiter");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Your Accout"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Image(
                  image: AssetImage('assets/images/logo.png'),
                ),
              ),
              signUpForm(),
              Container(
                padding: EdgeInsets.only(top: 5.0),
                child: Text("OR",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    )),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Current User?"),
                    RaisedButton(
                      child: Text(
                        "Login",
                        style: TextStyle(color: Color(0xFFFD8176)),
                      ),
                      color: Colors.transparent,
                      elevation: 0,
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
      padding: EdgeInsets.only(top: 20),
      child: Form(
        key: formState,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: userNameController,
              onSaved: (String val) {
                username = val;
              },
              decoration: InputDecoration(
                hintText: 'Username',
                labelText: 'Username',
                prefixIcon: Icon(Icons.person),
                labelStyle: TextStyle(
                  color: Color(0xFFFD7E77),
                ),
              ),
            ),
            TextFormField(
              controller: emailController,
              onSaved: (String val) {
                email = val;
              },
              decoration: InputDecoration(
                hintText: 'you@example.com',
                labelText: 'Email Adress',
                prefixIcon: Icon(Icons.email),
                labelStyle: TextStyle(
                  color: Color(0xFFFD7E77),
                ),
              ),
            ),
            TextFormField(
              obscureText: true,
              controller: passwordController,
              onSaved: (String val) {
                password = val;
              },
              decoration: InputDecoration(
                hintText: 'Enter your Password',
                labelText: 'Password',
                prefixIcon: Icon(Icons.lock),
                labelStyle: TextStyle(
                  color: Color(0xFFFD7E77),
                ),
              ),
            ),
            TextFormField(
              obscureText: true,
              controller: confirmPasswordController,
              onSaved: (String val) {
                confirmPass = val;
              },
              decoration: InputDecoration(
                hintText: 'Enter your Password again',
                labelText: 'Confirm Password',
                prefixIcon: Icon(Icons.lock),
                labelStyle: TextStyle(
                  color: Color(0xFFFD7E77),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.topRight,
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _flatButton("SignUp", [Color(0xFFFF5B7F), Color(0xFFFC9272)])
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _flatButton(String text, List<Color> color) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      width: MediaQuery.of(context).size.width - 20,
      height: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        gradient: LinearGradient(
          colors: color,
          begin: FractionalOffset.centerLeft,
          end: FractionalOffset.centerRight,
        ),
      ),
      child: FlatButton(
        child: Text(
          text,
          style: TextStyle(color: Colors.white, fontSize: 18),
        ),
        onPressed: () {
          _submit();
        },
      ),
    );
  }
}
