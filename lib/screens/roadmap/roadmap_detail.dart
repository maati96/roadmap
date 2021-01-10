import 'package:flutter/material.dart';
import 'package:roadmap/models/roadmap_model.dart';
import 'package:roadmap/webservices/web_servies.dart';
import 'package:roadmap/widgets/appbar_search.dart';

class RoadmapDetail extends StatelessWidget {
  final String subCateogryModel;
  final String roadmapModel;
  RoadmapDetail({this.roadmapModel, this.subCateogryModel});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBarSearch.appBarBase('مسارات التعلم لهذا القسم'),
        body: ListView(
          children: [
            SizedBox(
              height: 5,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.99,
              child: Expanded(
                child: FutureBuilder(
                  future:
                      WebService().fromRoadmap(subCateogryModel, roadmapModel),
                  builder: (context, snapshot) {
                    List<RoadmapModel> roadmap = snapshot.data;
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
                      print(roadmap[0].image);
                      return InkWell(
                        child: ListView.builder(
                          itemCount: roadmap.length,
                          itemBuilder: (BuildContext context, int index) {
                            return Column(
                              children: [
                                Container(
                                  padding: EdgeInsets.only(left: 8, right: 8),
                                  height:
                                      MediaQuery.of(context).size.height * 0.15,
                                  child: Stack(
                                    alignment: AlignmentDirectional.bottomStart,
                                    children: [
                                      Container(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.30,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10.0),
                                          color: Colors.white,
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                  roadmap[index].image),
                                              fit: BoxFit.cover),
                                        ),
                                      ),
                                      Container(
                                         padding: EdgeInsets.only(right: 10, left: 10),
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.4),
                                          borderRadius: BorderRadius.only(
                                              bottomLeft: Radius.circular(20),
                                              bottomRight: Radius.circular(20)),
                                        ),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              roadmap[index].name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Row(
                                                children: [
                                                  Icon(Icons.computer,
                                                      color: Colors.white),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    roadmap[index]
                                                        .author
                                                        .username,
                                                    style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.bold),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
