import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:roadmap/screens/category/category_sub_list.dart';
import 'package:roadmap/screens/category/controller.dart';
import 'package:roadmap/webservices/network_gate.dart';
import 'package:roadmap/webservices/web_servies.dart';
import 'package:roadmap/widgets/ErrorDialog.dart';
import 'package:roadmap/widgets/appbar_search.dart';

import 'model.dart';

class CategoryList extends StatefulWidget {
  CategoryListModel categoryListModel;
  CategoryList({this.categoryListModel});
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  bool _isLike = false;
  CategoriesController _controller = CategoriesController();

  CategoryListModel _model = CategoryListModel();

  bool _loading = true;
  void _getData() async {
    CustomResponse response = await _controller.getData();
    print(">>>>>>>>>>>>>>>>>>>>>>>${response.statusCode}");
//    print(">>>>>>>>>>>>>>>>>>>>>>>${response.response.data}");
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
        appBar: AppBarSearch.appBarBase('مسارات التعلم'),
        body: _loading
            ? Center(
                child: CupertinoActivityIndicator(
                radius: 20,
                animating: true,
              ))
            : ListView.builder(
                itemCount: 4,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: _buildCategoryList("ssss",
                        "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/1200px-Image_created_with_a_mobile_phone.png"),
                    onTap: () {
//                      Navigator.of(context).push(
//                        MaterialPageRoute(
//                          builder: (context) => CategorySubList(
////                    subCateogryModel: snapshot.data[index].slug,
//                              ),
//                        ),
//                      );
                    },
                  );
                },
              ),

//        FutureBuilder(
//          future: WebService().fromAllCategory(),
//          builder: (context, snapshot) {
//            if (snapshot.hasError) {
//              print(snapshot.error);
//              return Center(
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.center,
//                  children: [
//                    Text('خطأ في تحميل الاقسام'),
//                  ],
//                ),
//              );
//            }
//            if (snapshot.hasData) {
//              return ListView.builder(
//                itemCount: snapshot.data.length,
//                itemBuilder: (BuildContext context, int index) {
//                  return InkWell(
//                    child: _buildCategoryList(snapshot.data[index], context),
//                    onTap: () {
//                      Navigator.of(context).push(MaterialPageRoute(
//                          builder: (context) => CategorySubList(
//                                subCateogryModel: snapshot.data[index].slug,
//                              ),),);
//                    },
//                  );
//                },
//              );
//            }
//            return Center(
//              child: Column(
//                mainAxisAlignment: MainAxisAlignment.center,
//                children: [
//                  CircularProgressIndicator(),
//                ],
//              ),
//            );
//          },
//        ),
      ),
    );
  }

  Widget _buildCategoryList(
    String name,
    String img,
  ) {
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
              image:
                  DecorationImage(image: NetworkImage(img), fit: BoxFit.cover),
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
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: IconButton(
            icon: Icon(
              _isLike ? Icons.favorite : Icons.favorite_border,
              color: Color(0xFFFD7E77),
              size: 30,
            ),
            onPressed: () {},
          ),
        ),
      ],
    );
  }
}
