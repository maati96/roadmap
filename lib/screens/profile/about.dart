import 'package:flutter/material.dart';

class About extends StatefulWidget {
  @override
  _AboutState createState() => _AboutState();
}

class _AboutState extends State<About> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("من نحن "),
          flexibleSpace: PreferredSize(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],color: Colors.yellow

//                  gradient: LinearGradient(
//                    List: [Color(0xFFDD4B39), Color(0xFFFD8176)],
////                    colors: [Color(0xFFDD4B39), Color(0xFFFD8176)],
//                    begin: Alignment.centerLeft,
//                    end: Alignment.centerRight,
//                  )
              ),
            ),
            preferredSize: Size(double.infinity, 56),
          ),
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
                    title: const Text('لماذا قمنا بانشاء هذا التطبيق'),
                    subtitle: Text("مجاني للجميع "),
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
                    title: const Text('لماذا قمنا بانشاء هذا التطبيق'),
                    subtitle: Text("مجاني للجميع "),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Text(
                  "مطورين التطبيق",
                  style: TextStyle(
                    fontSize: 30,
                  ),
                  textAlign: TextAlign.center,
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
                          borderRadius: BorderRadius.circular(70),
                          image: DecorationImage(
                            image:
                                ExactAssetImage('assets/images/profile.jpeg'),
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
                              color: Color(0xFF26242e),
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
                            image:
                                ExactAssetImage('assets/images/profile.jpeg'),
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
                              color: Color(0xFF26242e),
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
      ),
    );
  }
}
