import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:roadmap/screens/profile/profile_Details/controller.dart';
import 'package:roadmap/screens/profile/profile_Details/model.dart';
import 'package:roadmap/utilities/AppTheme.dart';
import 'package:roadmap/webservices/network_gate.dart';
import 'package:roadmap/widgets/ErrorDialog.dart';

class UserProfileScreen extends StatefulWidget {
  @override
  _UserProfileScreenState createState() => _UserProfileScreenState();
}

class _UserProfileScreenState extends State<UserProfileScreen> {
  UserDetialModel _model = UserDetialModel();
  ProfileDetailsController _controller = ProfileDetailsController();
  void _getData() async {
    CustomResponse response = await _controller.getData();
    try {
      if (response.success) {
        setState(
          () {
            _model = UserDetialModel.fromJson(response.response.data);
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
      child: new Scaffold(
          backgroundColor: AppTheme.backGroundColor,
          appBar: AppBar(
            backgroundColor: AppTheme.appBarColor,
            title: Text(
              "معلوماتك الشخصيه ",
              style: TextStyle(
                color: AppTheme.cardColor,
                fontFamily: AppTheme.boldFont,
              ),
            ),
            centerTitle: true,
          ),
          body: _loading
              ? Center(
                  child: CupertinoActivityIndicator(
                  animating: true,
                  radius: 30,
                ))
              : new Container(
                  child: new ListView(
                    children: [
                      Column(
                        children: [
                          new Container(
                            child: new Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 20.0),
                                  child: new Stack(
                                    fit: StackFit.loose,
                                    children: [
                                      new Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          new Container(
                                            width: 140.0,
                                            height: 140.0,
                                            decoration: new BoxDecoration(
                                              shape: BoxShape.circle,
                                              image: new DecorationImage(
                                                image: new ExactAssetImage(
                                                    'assets/images/profile.jpeg'),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          Divider(
                            height: 10,
                          ),
                          new Container(
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 25.0),
                              child: new Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'المعلومات الشخصية',
                                                style: TextStyle(
                                                  color: AppTheme.cardColor,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: AppTheme.fontName,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'الاسم',
                                                style: TextStyle(
                                                  color: AppTheme.cardColor,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: AppTheme.fontName,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 2.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Flexible(
                                            child: Text(
                                              _model.username,
                                              style: TextStyle(
                                                color: AppTheme.cardColor,
                                                fontSize: 16.0,
                                                fontFamily: AppTheme.fontName,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'البريدالالكتروني',
                                                style: TextStyle(
                                                  color: AppTheme.cardColor,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: AppTheme.fontName,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 2.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Flexible(
                                            child: new Text(
                                              _model.email,
                                              style: TextStyle(
                                                color: AppTheme.cardColor,
                                                fontSize: 16.0,
                                                fontFamily: AppTheme.fontName,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 25.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            mainAxisSize: MainAxisSize.min,
                                            children: <Widget>[
                                              new Text(
                                                'المسمي الوظيفي',
                                                style: TextStyle(
                                                  color: AppTheme.cardColor,
                                                  fontSize: 16.0,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: AppTheme.fontName,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )),
                                  Padding(
                                      padding: EdgeInsets.only(
                                          left: 25.0, right: 25.0, top: 2.0),
                                      child: new Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: <Widget>[
                                          new Flexible(
                                            child: Text(
                                              "وظيفتك",
                                              style: TextStyle(
                                                color: AppTheme.cardColor,
                                                fontSize: 16.0,
                                                fontFamily: AppTheme.fontName,
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                )),
    );
  }
}
