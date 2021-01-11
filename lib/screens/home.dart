// import 'package:flutter/material.dart';
// import 'package:roadmap/models/home_model.dart';
// import 'package:roadmap/screens/category/category_list.dart';
// import 'package:roadmap/webservices/web_servies.dart';
// import 'package:roadmap/widgets/appbar_search.dart';

// class Home extends StatefulWidget {
//   @override
//   _HomeState createState() => _HomeState();
// }

// class _HomeState extends State<Home> {
//   HomeModel homeModel;
//   _HomeState({this.homeModel});

//   // _HomeState() {
//   //   homeModel;
//   //   _searchText = "";
//   //   names = [];
//   //   filteredNames = [];
//   //   _filter = TextEditingController();
//   // }

//   bool isSearching = false;
//   String _searchText;
//   List names;
//   List filteredNames;
//   TextEditingController _filter;
//   AppBarSearch appbar;

//   @override
//   void initState() {
//     //
//     super.initState();
//     // WebService().getLetastCategory();
//     appbar = AppBarSearch(
//       state: this,
//       controller: _filter,
//     );

//     // _getNames();

//     // _filter.addListener(() {
//     //   if (_filter.text.isEmpty) {
//     //     _searchText = "";
//     //     filteredNames = names;
//     //   } else {
//     //     _searchText = _filter.text;
//     //   }
//     // });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Directionality(
//       textDirection: TextDirection.rtl,
//       child: Scaffold(
//         appBar: AppBar(
//           flexibleSpace: PreferredSize(
//             child: Container(
//               height: 100,
//               decoration: BoxDecoration(
//                   boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 10)],
//                   gradient: LinearGradient(
//                     colors: [Color(0xFFDD4B39), Color(0xFFFD8176)],
//                     begin: Alignment.centerLeft,
//                     end: Alignment.centerRight,
//                   )),
//             ),
//             preferredSize: Size(double.infinity, 56),
//           ),
//           centerTitle: true,
//           title: appbar.onTitle(Text("ابحث عن المسار الخاص بك")),
//           actions: [
//             appbar.searchIcon,
//           ],
//         ),
//         body: ListView.builder(
//           itemCount: 1,
//           itemBuilder: (BuildContext context, int index) {
//             return Column(
//               children: [
//                 Stack(
//                   children: [
//                     Padding(
//                       padding: const EdgeInsets.only(top: 8.0),
//                       child: Container(
//                         height: MediaQuery.of(context).size.height * 0.12,
//                         width: double.infinity,
//                         decoration: BoxDecoration(
//                           color: Color(0xFF26242e),
//                           image: DecorationImage(
//                               image: AssetImage(
//                                   "assets/illustrations/illustration-01.png"),
//                               fit: BoxFit.cover),
//                         ),
//                       ),
//                     ),
//                     Padding(
//                       padding: const EdgeInsets.only(top: 12.0, left: 10),
//                       child: Container(
//                         alignment: Alignment.center,
//                         child: Column(
//                           children: [
//                             Text(
//                               "دائما مسارات جديدة",
//                               style:
//                                   TextStyle(fontSize: 30, color: Colors.white),
//                               textAlign: TextAlign.center,
//                             ),
//                             Text(
//                               "حان وقت التعلم والاستكشاف",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontSize: 25,
//                                   fontWeight: FontWeight.bold,
//                                   color: Colors.black.withOpacity(0.6)),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "احدث الاقسام المضافة",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.35,
//                   child: FutureBuilder<HomeModel>(
//                     future: WebService().getLetastCategory(),
//                     builder: (context, snapshot) {
//                       if (snapshot.hasError) {
//                         print(snapshot.error);
//                         return Center(
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.center,
//                             children: [
//                               Text('خطأ في تحميل الاقسام'),
//                             ],
//                           ),
//                         );
//                       }
//                       if (snapshot.hasData) {
//                         return ListView.builder(
//                           itemCount: snapshot.data.latestCategroies.length,
//                           itemBuilder: (context, index) {
//                             return _featureCard(, index);
//                           },
//                           scrollDirection: Axis.horizontal,
//                         );
//                       }
//                       return Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             CircularProgressIndicator(),
//                           ],
//                         ),
//                       );
//                     },
//                   ),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Text(
//                     "احدث المسارات المضافة",
//                     style: TextStyle(
//                       fontSize: 20,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                 ),
//                 Container(
//                   height: MediaQuery.of(context).size.height * 0.18,
//                   child: ListView.builder(
//                     itemCount: 3,
//                     itemBuilder: (context, index) {
//                       return _newCard(index);
//                     },
//                     scrollDirection: Axis.horizontal,
//                   ),
//                 ),
//               ],
//             );
//           },
//         ),
//       ),
//     );
//   }

//   Widget _featureCard(HomeModel homeModel, int index) {
//     return InkWell(
//       onTap: () {
//         Navigator.push(
//             context, MaterialPageRoute(builder: (context) => CategoryList()));
//       },
//       child: Stack(
//         alignment: AlignmentDirectional.bottomStart,
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               width: MediaQuery.of(context).size.width * 0.48,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.0),
//                 color: Colors.white,
//                 image: DecorationImage(
//                     image: AssetImage(homeModel.latestCategroies[index].image),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: 50,
//               width: MediaQuery.of(context).size.width * 0.48,
//               decoration: BoxDecoration(
//                 color: Colors.grey.withOpacity(0.4),
//                 borderRadius: BorderRadius.only(
//                     bottomLeft: Radius.circular(20),
//                     bottomRight: Radius.circular(20)),
//               ),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     homeModel.latestCategroies[index].name,
//                     style: TextStyle(color: Colors.white, fontSize: 15),
//                   ),
//                   Row(
//                     children: [
//                       Icon(Icons.restaurant, color: Colors.white),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Text(
//                         "Category",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   Widget _newCard(int index) {
//     return InkWell(
//       onTap: () {
//         //  Navigator.push(context, MaterialPageRoute(builder: (context) => ));
//       },
//       child: Stack(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Container(
//               height: MediaQuery.of(context).size.height * 0.45,
//               width: MediaQuery.of(context).size.width * 0.75,
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.0),
//                 color: Colors.grey,
//                 image: DecorationImage(
//                     image:
//                         AssetImage("assets/illustrations/illustration-05.png"),
//                     fit: BoxFit.cover),
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 92.0, left: 8),
//             child: Container(
//               color: Colors.white.withOpacity(0.3),
//               height: MediaQuery.of(context).size.height * 0.40,
//               width: MediaQuery.of(context).size.width * 0.75,
//               child: Padding(
//                 padding: const EdgeInsets.only(left: 8.0, top: 10),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     Text(
//                       "New RoadMaps",
//                       style: TextStyle(color: Colors.white, fontSize: 15),
//                     ),
//                     Row(
//                       children: [
//                         Icon(Icons.computer, color: Colors.white),
//                         SizedBox(
//                           width: 5,
//                         ),
//                         Text(
//                           "Your Career",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 16,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }

//   // Widget _buildList() {
//   //   if (_searchText.isNotEmpty) {
//   //     List tempList = [];
//   //     for (int i = 0; i < filteredNames.length; i++) {
//   //       if (filteredNames[i]['name']
//   //           .toLowerCase()
//   //           .contains(_searchText.toLowerCase())) {
//   //         tempList.add(filteredNames[i]);
//   //       }
//   //     }
//   //     filteredNames = tempList;
//   //   }
//   //   return ListView.builder(
//   //     itemCount: names == null ? 0 : filteredNames.length,
//   //     itemBuilder: (BuildContext context, int index) {
//   //       return ListTile(
//   //         title: Text(filteredNames[index]['name']),
//   //         onTap: () => print(filteredNames[index]['name']),
//   //       );
//   //     },
//   //   );
//   // }

//   // void _getNames() async {
//   //   //
//   //   final response = await http.get('https://swapi.co/api/people');

//   //   List tempList = [];

//   //   for (int i = 0; i < response.body.length; i++) {
//   //     tempList.add(response.body[i]);
//   //   }
//   //   names = tempList;
//   //   names.shuffle();
//   //   filteredNames = names;
//   //   setState(() {});
//   // }
// }
