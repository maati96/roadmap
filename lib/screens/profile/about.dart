
import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("About App"),
        centerTitle: true,
      ),
      body: ListView(
        children: [
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.question_answer),
                  title: const Text('why we create this app?'),
                  subtitle: Text("this app is for all "),
                ),
              ],
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.question_answer),
                  title: const Text('why we create this app?'),
                  subtitle: Text("this app is for all "),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: Text("About Team", style: TextStyle(fontSize: 30,), textAlign: TextAlign.center,),
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/profile.jpeg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Flex(
                      mainAxisAlignment: MainAxisAlignment.center,
                      direction: Axis.vertical,
                      children: [
                        Text(
                          "Mohamed AboElmaati",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Mobile Developer",
                          style: TextStyle(
                            fontSize: 18,
                            color: 
                                 Color(0xFF26242e),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            clipBehavior: Clip.antiAlias,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: MediaQuery.of(context).size.height * 0.15,
                child: Row(
                  children: [
                    Container(
                      width: 110,
                      height: 110,
                      
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(55),
                        image: DecorationImage(
                          image: ExactAssetImage('assets/images/profile.jpeg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    Flex(
                      mainAxisAlignment: MainAxisAlignment.center,
                      direction: Axis.vertical,
                      children: [
                        Text(
                          "Mahmoud Ahmed",
                          style: TextStyle(fontSize: 20),
                        ),
                        Text(
                          "Backend Developer",
                          style: TextStyle(
                            fontSize: 18,
                            color:  Color(0xFF26242e),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
