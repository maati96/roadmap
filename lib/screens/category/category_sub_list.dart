import 'package:flutter/material.dart';
import 'package:roadmap/models/sub_category_model.dart';
import 'package:roadmap/screens/roadmap/roadmap_detail.dart';
import 'package:roadmap/webservices/web_servies.dart';

class CategorySubList extends StatefulWidget {
  @override
  _CategorySubListState createState() => _CategorySubListState();
}

class _CategorySubListState extends State<CategorySubList> {
  @override
  void initState() {
    WebService().fromCategory();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text(
            "الأقسام الفرعية",
            style: TextStyle(color: Colors.black),
          ),
        ),
        body: FutureBuilder(
          future: WebService().fromCategory(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('خطأ في تحميل الأقسام'),
                  ],
                ),
              );
            }
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: _buildCategoryList(snapshot.data[index], context),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                            builder: (context) => RoadmapDetail()),
                      );
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
      SubCateogryModel subCateogryModel, BuildContext context) {
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
                  image: NetworkImage(subCateogryModel.image),
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
                  padding: const EdgeInsets.all(20.0),
                  child: Text(
                    subCateogryModel.name,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
