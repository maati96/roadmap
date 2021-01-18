import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/screens/home/controller.dart';
import 'package:roadmap/screens/home/home_model.dart';
import 'package:roadmap/screens/roadmap/roadmap_Section_Detail/view.dart';
import 'package:roadmap/utilities/AppTheme.dart';
import 'package:roadmap/webservices/network_gate.dart';
import 'package:roadmap/widgets/ErrorDialog.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  HomeController _controller = HomeController();
  HomeModel _model = HomeModel();
 
  void _getData() async {
    CustomResponse response = await _controller.getData();
    if (response.success) {
      setState(() {
        _model = HomeModel.fromJson(response.response.data);
        _loading = false;
      });
    } else if (response.errType == 0) {
      showNetworkErrorDialog(context, () {
        Navigator.of(context).pop();
        _getData();
      });
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
          title: Text(
            "مسارك",
            style: TextStyle(fontFamily: AppTheme.fontName, fontSize: 25),
          ),
          flexibleSpace: PreferredSize(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                  color: AppTheme.appBarColor),
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
                Stack(
                  children: [
                    Container(
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Color(0xFF26242e),
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/illustrations/illustration-01.png"),
                            fit: BoxFit.cover),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 12.0, left: 10),
                      child: Container(
                        alignment: Alignment.center,
                        child: Column(
                          children: [
                            Text(
                              "دائما مسارات جديدة",
                              style: AppTheme.titleStyle,
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "حان وقت التعلم والاستكشاف",
                              textAlign: TextAlign.center,
                              style: AppTheme.titleStyle,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "احدث الاقسام المضافة",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.cardColor,
                      fontFamily: AppTheme.fontName,
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.30,
                    child: _loading
                        ? CupertinoActivityIndicator(
                            radius: 20,
                            animating: true,
                          )
                        : ListView.builder(
                            itemCount: _model.latestCategroies.length,
                            itemBuilder: (context, index) {
                              return _newCategoryies(
                                () {},
                                _model.latestCategroies[index].feeds.name,
                                _model.latestCategroies[index].feeds.image,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "احدث المسارات المضافة",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: AppTheme.cardColor,
                      fontFamily: AppTheme.fontName,
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.18,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: _loading
                        ? CupertinoActivityIndicator(
                            radius: 20,
                            animating: true,
                          )
                        : ListView.builder(
                            itemCount: _model.latestroadmaps.length,
                            itemBuilder: (context, index) {
                              return _latestRoadmaps(
                                () {
                                  Navigator.of(context).push(
                                    MaterialPageRoute(
                                      builder: (context) =>
                                          RoadmapSectionDetailView(
                                        sectionDetail:
                                            _model.latestroadmaps[index].slug,
                                      ),
                                    ),
                                  );
                                },
                                _model.latestroadmaps[index].name,
                                _model.latestroadmaps[index].author.username,
                                _model.latestroadmaps[index].image,
                              );
                            },
                            scrollDirection: Axis.horizontal,
                          ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _newCategoryies(Function onTap, String name, String image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.30,
        width: MediaQuery.of(context).size.width * 0.38,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          image: DecorationImage(
              image: NetworkImage(
                image,
              ),
              fit: BoxFit.cover),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 25,
                fontFamily: AppTheme.fontName,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _latestRoadmaps(
      Function onTap, String name, String author, String image) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 12),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.40,
          width: MediaQuery.of(context).size.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20.0),
            color: Colors.white,
            image:
                DecorationImage(image: NetworkImage(image), fit: BoxFit.cover),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontFamily: AppTheme.fontName,
                ),
                textAlign: TextAlign.center,
              ),
              Row(
                children: [
                  Icon(
                    Icons.computer_outlined,
                    size: 30,
                  ),
                  Text(
                    author,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontFamily: AppTheme.boldFont,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

 
}
