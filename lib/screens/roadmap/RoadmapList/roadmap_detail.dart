import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/screens/roadmap/RoadmapList/controller.dart';
import 'package:roadmap/screens/roadmap/RoadmapList/model.dart';
import 'package:roadmap/screens/roadmap/roadmap_Section_Detail/view.dart';
import 'package:roadmap/utilities/AppTheme.dart';
import 'package:roadmap/webservices/network_gate.dart';
import 'package:roadmap/widgets/ErrorDialog.dart';
import 'package:roadmap/widgets/appbar_search.dart';

class RoadmapListView extends StatefulWidget {
  final String category;
  final String subCategory;

  const RoadmapListView({Key key, this.category, this.subCategory})
      : super(key: key);

  @override
  _RoadmapListViewState createState() => _RoadmapListViewState();
}

class _RoadmapListViewState extends State<RoadmapListView> {
  RoadmapListModel _model = RoadmapListModel();
  RoadmapListController _controller = RoadmapListController();

  void _getData() async {
    CustomResponse response =
        await _controller.getData("${widget.category}/${widget.subCategory}");
    try {
      if (response.success) {
        setState(
          () {
            _model = RoadmapListModel.fromJson(response.response.data);
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
        appBar: AppBarSearch.appBarBase('مسارات التعلم لهذا القسم'),
        body: _loading
            ? Center(
                child: CupertinoActivityIndicator(
                animating: true,
                radius: 30,
              ))
            : ListView.builder(
                itemCount: _model.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RoadmapSectionDetailView(
                            category: widget.category,
                            subCategory: widget.subCategory,
                            sectionDetail: _model.data[index].slug,
                          ),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.30,
                        child: Card(
                          clipBehavior: Clip.antiAliasWithSaveLayer,
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Image.network(
                                  
                                  _model.data[index].image,
                                  fit: BoxFit.cover ,
                                  height: MediaQuery.of(context).size.height * 0.2,
                                  width: MediaQuery.of(context).size.width * 1,
                                ),
                                Text(
                                  _model.data[index].name,
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: AppTheme.boldFont,
                                  ),
                                ),
                                Text(
                                  _model.data[index].author.username,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: AppTheme.fontName,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}
