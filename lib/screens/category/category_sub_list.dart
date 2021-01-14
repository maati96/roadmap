import 'package:flutter/material.dart';

import 'package:roadmap/models/sub_category_model.dart';
import 'package:roadmap/screens/roadmap/roadmap_detail.dart';
import 'package:roadmap/webservices/network_gate.dart';
import 'package:roadmap/widgets/ErrorDialog.dart';
import 'package:roadmap/widgets/appbar_search.dart';

import 'controller.dart';

class CategorySubList extends StatefulWidget {
  final String slug;

  const CategorySubList({Key key, this.slug}) : super(key: key);
  @override
  _CategorySubListState createState() => _CategorySubListState();
}

class _CategorySubListState extends State<CategorySubList> {
  CategoriesController _controller = CategoriesController();
  List<SubCateogryModel> _model;

  void _getData() async {
    CustomResponse response = await _controller.getData(widget.slug);

    try {
      if (response.success) {
        setState(
          () {
            _model = subCateogryModelFromJson(response.response.data);
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
        appBar: AppBarSearch.appBarBase("الاقسام الفرعية"),
        body: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: _model.length,
          itemBuilder: (BuildContext context, int index) {
        
            return InkWell(
              child: _buildCategoryList(_model[index].name, _model[index].image),
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => RoadmapDetail(
                        // roadmapModel: ,
                        // subCateogryModel: ,
                        ),
                  ),
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
              image:
                  DecorationImage(image: NetworkImage(img ?? null), fit: BoxFit.cover),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              name,
              style: TextStyle(color: Colors.white, fontSize: 30),
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ],
    );
  }
}
