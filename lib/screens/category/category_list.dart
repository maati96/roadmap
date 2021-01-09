import 'package:flutter/material.dart';
import 'package:roadmap/models/category_list.dart';
import 'package:roadmap/screens/category/category_sub_list.dart';
import 'package:roadmap/webservices/web_servies.dart';

class CategoryList extends StatefulWidget {
  CategoryListModel categoryListModel;
  CategoryList({this.categoryListModel});
  @override
  _CategoryListState createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {
  bool _isLike = false;

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "الأقسام الرئيسية",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: FutureBuilder(
          future: WebService().fromAllCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('خطأ في تحميل الاقسام'),
                  ],
                ),
              );
            }
            if (snapshot.hasData) {
              // widget.categoryListModel = snapshot.data as CategoryListModel;
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: _buildCategoryList(snapshot.data[index], context),
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => CategorySubList(
                                subCateogryModel: snapshot.data[index].slug,
                              ),),);
                    },
                  );
                },
              );
            }
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildCategoryList(
      CategoryListModel categoryListModel, BuildContext context) {
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
                  image: NetworkImage(categoryListModel.image),
                  fit: BoxFit.cover),
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
                    categoryListModel.name,
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
