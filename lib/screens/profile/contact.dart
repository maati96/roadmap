import 'package:flutter/material.dart';

class Contact extends StatefulWidget {
  @override
  _ContactState createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  Widget build(BuildContext context) {
    final messageController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Suggestions"),
        centerTitle: true,
        backgroundColor:
            Color(0xFF26242e),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: TextFormField(
                onSaved: (String val) {},
                controller: messageController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  labelText: 'Your Message',
                ),
                keyboardType: TextInputType.text,
                style: TextStyle(fontSize: 16.0, color: Colors.white),
                maxLines: 10,
              ),
            ),
            Container(
              padding: EdgeInsets.all(30),
              child: _flatButton(
                  "Send Message", [Color(0xFFFF5B7F), Color(0xFFFC9272)]),
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
          Navigator.pop(context);
        },
      ),
    );
  }
}
