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
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.99,
                child: FutureBuilder(
                  future:
                      WebService().fromRoadmap(subCateogryModel, roadmapModel),
                  builder: (context, snapshot) {
                    List<RoadmapModel> roadmap = snapshot.data;
                    if (snapshot.connectionState != ConnectionState.done) {
                      return Center(child: CircularProgressIndicator());
                    }
                    if (snapshot.hasData) {
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
                                                0.15,
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
                                        padding: EdgeInsets.only(
                                            right: 10),
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.15,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                1,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              roadmap[index].name,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 30),
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
                                                        fontSize: 20,
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
