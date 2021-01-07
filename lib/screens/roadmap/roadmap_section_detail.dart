// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:roadmap/utilities/theme.dart';

// class RoadmapSectionDetail extends StatefulWidget {
//   @override
//   _RoadmapSectionDetailState createState() => _RoadmapSectionDetailState();
// }

// class _RoadmapSectionDetailState extends State<RoadmapSectionDetail> {
  
//   @override
//   Widget build(BuildContext context) {
//         final themeProvider = Provider.of<ThemeProvider>(context);

//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Python section details"),
//         backgroundColor:
//             themeProvider.isLightTheme ? Colors.white : Color(0xFF26242e),
//       ),
//       body: _navbarCard(context),
//     );
//   }

//   Widget _navbarCard(BuildContext context) {
//     return Container(
//       height: MediaQuery.of(context).size.height * 0.30,
//       child: Stack(
//         alignment: AlignmentDirectional.bottomStart,
//         children: [
//           Container(
//             height: MediaQuery.of(context).size.height * 0.30,
//             width: MediaQuery.of(context).size.width * 1,
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.circular(10.0),
//               color: Colors.white,
//               image: DecorationImage(
//                   image: AssetImage("assets/illustrations/illustration-02.png"),
//                   fit: BoxFit.cover),
//             ),
//           ),
//           Container(
//             height: 50,
//             width: MediaQuery.of(context).size.width * 1,
//             decoration: BoxDecoration(
//               color: Colors.black.withOpacity(0.4),
//               borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(20),
//                   bottomRight: Radius.circular(20)),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   "Python RoadMap",
//                   style: TextStyle(color: Colors.white, fontSize: 15),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(left: 8.0),
//                   child: Row(
//                     children: [
//                       Icon(Icons.code, color: Colors.white),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Text(
//                         "Learn every thing About python from scratch",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ],
//                   ),
//                 ),
                
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
