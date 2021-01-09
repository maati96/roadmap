// import 'package:flutter/material.dart';

// class Stepper extends StatelessWidget {
//   int currentStep = 0;
//   List<Step> steps = [
//     Step(
//       isActive: true,
//       title: Text(
//         "Python Basics",
//       ),
//       subtitle: Text("python Track"),
//       content: Container(
//         child: Text("python Track"),
//       ),
//     ),
//     Step(
//       isActive: true,
//       title: Text("Python Basics"),
//       subtitle: Text("python Track"),
//       content: Container(
//         child: Text("python Track"),
//       ),
//     ),
//     Step(
//       isActive: true,
//       title: Text("Python Basics"),
//       subtitle: Text("python Track"),
//       content: Text("more detail"),
//     ),
//     Step(
//       isActive: true,
//       state: StepState.complete,
//       title: Text("Python Basics"),
//       content: Container(
//         child: Text("python Track"),
//       ),
//     ),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return _trackSteps();
//   }

//   Widget _trackSteps() {
//     return Container(
//       child: Theme(
//         data: ThemeData(
//           primaryColor: Color(0xFFFD7E77),
//         ),
//         child: Stepper(
//           controlsBuilder: (BuildContext context,
//               {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
//             return Row(
//               children: [
//                 FlatButton(
//                   color: ThemeData().primaryColor,
//                   onPressed: onStepContinue,
//                   child: Text(
//                     "التالي",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 FlatButton(
//                   onPressed: onStepCancel,
//                   child: Text(
//                     "عودة",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 RaisedButton(
//                   shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(10.0),
//                       side: BorderSide(color: Colors.white)),
//                   color: Color(0xFFFD7E77),
//                   onPressed: () {},
//                   child: Text(
//                     "تفاصيل اكتر",
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//               ],
//             );
//           },
//           currentStep: this.currentStep,
//           steps: steps,
//           type: StepperType.vertical,
//           onStepTapped: (step) {
//             setState(() {
//               currentStep = step;
//             });
//           },
//           onStepContinue: () {
//             setState(() {
//               if (currentStep < steps.length - 1) {
//                 currentStep++;
//               } else {
//                 currentStep = 0;
//               }
//             });
//           },
//           onStepCancel: () {
//             setState(() {
//               if (currentStep > 0) {
//                 currentStep--;
//               } else {
//                 currentStep = 0;
//               }
//             });
//           },
//         ),
//       ),
//     );
//   }
// }
