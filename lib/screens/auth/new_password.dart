import 'package:flutter/material.dart';

class NewPassword extends StatefulWidget {
  @override
  _NewPasswordState createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final passwordController = TextEditingController();


  void dispose() {
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add New Password"),
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
                      "Add New Password",
                      style:
                          TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                        "Enter the new password you used to create your account",
                        style:
                            TextStyle(fontSize: 18, color: Color(0xFF8AA3CE),),
                            textAlign: TextAlign.center,
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
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'New Password',
                labelText: 'New Password',
                labelStyle: TextStyle(
                  color: Color(0xFFFD7E77),
                ),
              ),
            ),
            TextFormField(
              controller: passwordController,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Confirm password',
                labelText: 'Confirm password',
                labelStyle: TextStyle(
                  color: Color(0xFFFD7E77),
                ),
              ),
            ),
            
            SizedBox(height: 30,),
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
          
        },
      ),
    );
  }
}
