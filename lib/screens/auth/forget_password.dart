import 'package:flutter/material.dart';
import 'package:roadmap/screens/auth/new_password.dart';


class ForgetPassword extends StatefulWidget {
  @override
  _ForgetPasswordState createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  final emailController = TextEditingController();

 

  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Forget Password"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 100.0),
          child: Column(
            children: [
              Container(
                alignment: Alignment.topCenter,
                child: Column(
                  children: [
                    Text(
                      "Forgot Password",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Enter the email address you used to create your account and we will email you a link to reset your password",
                        style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF515C6F),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              signInForm(),
            ],
          ),
        ),
      ),
    );
  }

  Widget signInForm() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Form(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: emailController,
              decoration: InputDecoration(
                hintText: 'you@example.com',
                labelText: 'Email Adress',
                labelStyle: TextStyle(
                  color: Color(0xFFFD7E77),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _flatButton("Submit", [Color(0xFFFF5B7F), Color(0xFFFC9272)])
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _flatButton(String text, List<Color> color) {
    return Container(
      margin: EdgeInsets.only(top: 30),
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
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => NewPassword()),
          );
        
        },
      ),
    );
  }
}
