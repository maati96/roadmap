import 'package:flutter/material.dart';
import 'package:sliver_fab/sliver_fab.dart';

class CustomAppBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double media = ((MediaQuery.of(context).size.width - 100) / 2);

    return appBarSliver(context, media);
  }

  Container appBarSliver(BuildContext context, double media) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.1,
      child: SliverFab(
        floatingWidget: Container(
          height: 40,
          width: 40,
          margin: EdgeInsets.only(left: 15.0),
          child: ClipOval(
            child: Image.asset(
              "assets/illustrations/illustration-02.png",
              fit: BoxFit.fill,
            ),
          ),
          decoration: BoxDecoration(
            color: Color.fromRGBO(255, 255, 255, 0.7),
            shape: BoxShape.circle,
            border: Border.all(
              color: Color.fromRGBO(255, 255, 255, 0.1),
              width: 8.0,
            ),
          ),
          
        ),
        floatingPosition: FloatingPosition(left: media - 10, top: -22),
        
        expandedHeight: MediaQuery.of(context).size.height * 0.1,
        slivers: <Widget>[
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height * 0.1,
            backgroundColor: const Color(0xff1c0436),
            pinned: true,
            floating: true,
            leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pop(context);
                }),
            flexibleSpace: Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        "assets/illustrations/illustration-09.png"), //your image
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(50),
                  ),
                ),
                child: FlexibleSpaceBar(
                    collapseMode: CollapseMode.pin,
                    centerTitle: true,
                    title: Text("Roadmap", style: TextStyle(color: Colors.black87),))),
          ),
        ],
      ),
    );
  }
}
