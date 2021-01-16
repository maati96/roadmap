import 'package:flutter/material.dart';

class RoadmapDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("تفاصيل المسار "),
          flexibleSpace: PreferredSize(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                gradient: LinearGradient(
                  colors: [Color(0xFFDD4B39), Color(0xFFFD8176)],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                ),
              ),
            ),
            preferredSize: Size(double.infinity, 56),
          ),
          centerTitle: true,
        ),
        body: ListView.builder(
          itemCount: 1,
          itemBuilder: (BuildContext context, int index) {
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.20,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xFF26242e),
                      image: DecorationImage(
                          image: NetworkImage(
                              "assets/illustrations/illustration-01.png"),
                          fit: BoxFit.cover),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      Icon(Icons.computer_sharp),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        "محمد أبو المعاطي",
                        style: Theme.of(context).textTheme.headline6,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 1,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "الوصف",
                        ),
                        Divider(
                          height: 5,
                        ),
                        Text(
                            "احترف البرمجة بمختلف مجالاتها من خلال معسكرات مسارك الاحترافية للحصول على دخل ممتاز وفرص وظيفية حول العالم."),
                      ],
                    ),
                  ),
                ),
                Divider(
                  height: 10,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: RawMaterialButton(
                    onPressed: () {},
                    elevation: 2.0,
                    fillColor: Colors.pinkAccent,
                    child: Icon(
                      Icons.leaderboard,
                      size: 35.0,
                    ),
                    padding: EdgeInsets.all(15.0),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                  ),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
