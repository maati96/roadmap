import 'package:flutter/material.dart';
import 'package:roadmap/models/roadmap_model.dart';
import 'package:roadmap/webservices/web_servies.dart';
import 'package:roadmap/widgets/custom_bar.dart';



class RoadmapDetail extends StatelessWidget {
 final  RoadmapModel _roadmapModel;
 RoadmapDetail({RoadmapModel roadmapModel}) : _roadmapModel  = roadmapModel;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: ListView(
          children: [
            CustomAppBar(),
            Expanded(
              child: SizedBox(
                height: MediaQuery.of(context).size.height * 0.60,
                child: FutureBuilder(
                  future: WebService().fromRoadmap(),
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
                                  height:
                                      MediaQuery.of(context).size.height * 0.30,
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
                                                  Icon(Icons.code,
                                                      color: Colors.white),
                                                  SizedBox(
                                                    width: 8,
                                                  ),
                                                  Text(
                                                    roadmap[index]
                                                        .author
                                                        .toString(),
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
                                  height: 10,
                                ),
                                Container(
                                  width: MediaQuery.of(context).size.width * 1,
                                  
                                  child: Text(roadmap[index].description, textAlign: TextAlign.center,),
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
