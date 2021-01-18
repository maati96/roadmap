import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/screens/category/allCategoriyes/controller.dart';
import 'package:roadmap/screens/category/subCategory/category_sub_list.dart';
import 'package:roadmap/utilities/AppTheme.dart';
import 'package:roadmap/webservices/network_gate.dart';
import 'package:roadmap/widgets/ErrorDialog.dart';

import 'model.dart';

class CategoryList extends StatefulWidget {
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  CategoriesListController _controller = CategoriesListController();
  CategoryListModel _model = CategoryListModel();
  void _getData() async {
    CustomResponse response = await _controller.getData();
    if (response.success) {
      setState(() {
        _model = CategoryListModel.fromJson(response.response.data);
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
          backgroundColor: AppTheme.appBarColor,
          title: Text(
            "الأقسام الرئيسية",
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
                  radius: 20,
                  animating: true,
                ),
              )
            : ListView.builder(
                itemCount: _model.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return _buildCategoryList(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => CategorySubList(
                              slug: _model.data[index].feeds.slug,
                            )));
                  }, _model.data[index].feeds.name,
                      _model.data[index].feeds.image);
                },
              ),
      ),
    );
  }

  Widget _buildCategoryList(Function onTap, String name, String image) {
    return InkWell(
      onTap: onTap,
      child: Stack(
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
                    image: NetworkImage(image), fit: BoxFit.cover),
              ),
            ),
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.25,
            width: MediaQuery.of(context).size.width * 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 25.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Text(
                      name,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontFamily: AppTheme.fontName,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
