import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/models/home_model.dart';
import 'package:roadmap/screens/home/controller.dart';
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
        appBar: AppBar(
          title: Text("مسارك"),
          flexibleSpace: PreferredSize(
            child: Container(
              height: 100,
              decoration: BoxDecoration(
                  boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
                  gradient: LinearGradient(
                    colors: [Color(0xFFDD4B39), Color(0xFFFD8176)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight,
                  )),
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
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Container(
                        height: MediaQuery.of(context).size.height * 0.12,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: Color(0xFF26242e),
                          image: DecorationImage(
                              image: AssetImage(
                                  "assets/illustrations/illustration-01.png"),
                              fit: BoxFit.cover),
                        ),
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
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                              textAlign: TextAlign.center,
                            ),
                            Text(
                              "حان وقت التعلم والاستكشاف",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black.withOpacity(0.6)),
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
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.35,
                    child: _loading
                        ? CupertinoActivityIndicator(
                            radius: 20,
                            animating: true,
                          )
                        : ListView.builder(
                            itemCount: _model.latestCategroies.length,
                            itemBuilder: (context, index) {
                              return _featureCard(
                                () {},
                                _model.latestCategroies[index].name,
                                _model.latestCategroies[index].image,
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
                    ),
                  ),
                ),
                Container(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.15,
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: _loading
                        ? CupertinoActivityIndicator(
                            radius: 20,
                            animating: true,
                          )
                        : ListView.builder(
                            itemCount: _model.latestRoadmaps.length,
                            itemBuilder: (context, index) {
                              return _latestRoadmaps(
                                () {},
                                _model.latestRoadmaps[index].name,
                                _model.latestRoadmaps[index].author.username,
                                _model.latestRoadmaps[index].image,
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

  Widget _featureCard(Function onTap, String name, String image) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.0),
                color: Colors.white,
                image: DecorationImage(
                    image: NetworkImage(image), fit: BoxFit.cover),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              height: MediaQuery.of(context).size.height * 0.35,
              width: MediaQuery.of(context).size.width * 0.35,
              decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.4),
                borderRadius: BorderRadius.all(Radius.circular(20.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _latestRoadmaps(
      Function onTap, String name, String author, String image) {
    return InkWell(
      onTap: onTap,
      child: Stack(
        alignment: AlignmentDirectional.bottomStart,
        children: [
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.white,
              image: DecorationImage(
                  image: NetworkImage(image), fit: BoxFit.cover),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.35,
            width: MediaQuery.of(context).size.width * 0.8,
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(0.4),
              borderRadius: BorderRadius.all(Radius.circular(20.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  name,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  children: [
                    Icon(Icons.computer_outlined),
                    SizedBox(
                      width: 8.0,
                    ),
                    Text(
                      author,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
