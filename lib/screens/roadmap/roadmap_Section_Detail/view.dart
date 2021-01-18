import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/screens/roadmap/roadmap_Section_Detail/controller.dart';
import 'package:roadmap/screens/roadmap/roadmap_Section_Detail/model.dart';
import 'package:roadmap/utilities/AppTheme.dart';
import 'package:roadmap/webservices/network_gate.dart';
import 'package:roadmap/widgets/ErrorDialog.dart';

class RoadmapSectionDetailView extends StatefulWidget {
  final String category;
  final String subCategory;
  final String sectionDetail;

  const RoadmapSectionDetailView(
      {Key key, this.category, this.subCategory, this.sectionDetail})
      : super(key: key);

  @override
  _RoadmapSectionDetailViewState createState() =>
      _RoadmapSectionDetailViewState();
}

class _RoadmapSectionDetailViewState extends State<RoadmapSectionDetailView> {
  RoadmapSectionModel _model = RoadmapSectionModel();
  RoadmapSectionDetilController _controller = RoadmapSectionDetilController();

  void _getData() async {
    CustomResponse response = await _controller.getData(
        "${widget.category}/${widget.subCategory}/${widget.sectionDetail}");
    try {
      if (response.success) {
        setState(
          () {
            _model = RoadmapSectionModel.fromJson(response.response.data);
            _loading = false;
          },
        );
      } else if (response.errType == 0) {
        showNetworkErrorDialog(context, () {
          Navigator.of(context).pop();
          _getData();
        });
      }
    } catch (e) {
      print(e.toString());
    }
  }

  bool _loading = true;
  @override
  void initState() {
    _getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppTheme.backGroundColor,
        appBar: AppBar(
          title: Text("تفاصيل المسار "),
          backgroundColor: AppTheme.appBarColor,
          centerTitle: true,
        ),
        body: _loading
            ? Center(
                child: CupertinoActivityIndicator(
                animating: true,
                radius: 30,
              ))
            : ListView.builder(
                itemCount: _model.roadmapsections.length,
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
                                    _model.roadmapsections[index].image),
                                fit: BoxFit.cover),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            Icon(
                              Icons.computer_sharp,
                              color: AppTheme.cardColor,
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Text(
                              _model.roadmapsections[index].name,
                              style: TextStyle(
                                color: AppTheme.cardColor,
                              ),
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
                                style: TextStyle(
                                  color: AppTheme.cardColor,
                                ),
                              ),
                              Divider(
                                height: 5,
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Color(0xff1B213B),
                                ),
                                height:
                                    MediaQuery.of(context).size.height * 0.25,
                                width: MediaQuery.of(context).size.width * 0.95,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    _model.roadmapsections[index].description,
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: AppTheme.cardColor,
                                      fontFamily: AppTheme.fontName,
                                    ),
                                  ),
                                ),
                              ),
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
                          fillColor: AppTheme.btnColor,
                          child: Text(
                            "تعلم الان",
                            style: TextStyle(
                              color: AppTheme.cardColor,
                              fontFamily: AppTheme.fontName,
                            ),
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
