import 'package:flutter/material.dart';
import 'package:roadmap/models/sub_category_model.dart';
import 'package:roadmap/screens/roadmap/roadmap_detail.dart';
import 'package:roadmap/webservices/web_servies.dart';
import 'package:roadmap/widgets/appbar_search.dart';

class CategorySubList extends StatelessWidget {
  final String subCateogryModel;
  CategorySubList({this.subCateogryModel});

  @override
  Widget build(BuildContext context) {
    print("Sub Cat:" + subCateogryModel);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBarSearch.appBarBase("الاقسام الفرعية"),
        body: FutureBuilder(
          future: WebService().fromSubCategory(subCateogryModel),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
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
              return GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return InkWell(
                    child: _buildCategoryList(snapshot.data[index], context),
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => RoadmapDetail(
                            roadmapModel: snapshot.data[index].slug,
                            subCateogryModel: subCateogryModel,
                          ),
                        ),
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
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              subCateogryModel.name,
              style: TextStyle(color: Colors.white, fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
