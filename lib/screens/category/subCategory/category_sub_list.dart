import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/screens/category/subCategory/model.dart';
import 'package:roadmap/screens/roadmap/RoadmapList/roadmap_detail.dart';
import 'package:roadmap/utilities/AppTheme.dart';
import 'package:roadmap/webservices/network_gate.dart';
import 'package:roadmap/widgets/ErrorDialog.dart';
import 'controller.dart';

class CategorySubList extends StatefulWidget {
  final String slug;

  const CategorySubList({Key key, this.slug}) : super(key: key);
  @override
  _CategorySubListState createState() => _CategorySubListState();
}

class _CategorySubListState extends State<CategorySubList> {
  SubCategoriesController _controller = SubCategoriesController();
  SubCategoryModel _model = SubCategoryModel();

  void _getData() async {
    CustomResponse response = await _controller.getData(widget.slug);
    try {
      if (response.success) {
        setState(
          () {
            _model = SubCategoryModel.fromJson(response.response.data);
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
          backgroundColor: AppTheme.appBarColor,
          title: Text(
            "الأقسام الفرعية",
            style: TextStyle(
              color: AppTheme.cardColor,
              fontFamily: AppTheme.boldFont,
              fontSize: 20,
            ),
          ),
        ),
        body: _loading
            ? Center(
                child: CupertinoActivityIndicator(
                animating: true,
                radius: 30,
              ))
            : GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: _model.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: _buildCategoryList(_model.data[index].feeds.name,
                        _model.data[index].feeds.image),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => RoadmapListView(
                                  category: widget.slug,
                                  subCategory: _model.data[index].feeds.slug,
                                )),
                      );
                    },
                  );
                },
              ),
      ),
    );
  }

  Widget _buildCategoryList(String name, String img) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 1,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.0),
              color: Colors.grey,
              image: DecorationImage(
                  image: NetworkImage(img ?? null), fit: BoxFit.cover),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              name,
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: AppTheme.fontName,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
