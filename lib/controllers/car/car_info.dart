// import 'package:flutter/material.dart';
// import 'package:my_car_records/controllers/my_extensions.dart';
// import 'package:my_car_records/controllers/repair/all_repairs.dart';
// import 'package:my_car_records/model/db/repair_real_time.dart';
// import 'package:my_car_records/views/repair_form/repair_form_shell.dart';

// /// displays all the information about a single car
// ///
// ///  [car] holds all the car information and matinance records
// ///
// class CarInfo extends StatefulWidget {
//   // ignore: prefer_typing_uninitialized_variables
//   final car;
//   const CarInfo({Key? key, required this.car}) : super(key: key);

//   @override
//   State<CarInfo> createState() => _CarInfoState();
// }

// class _CarInfoState extends State<CarInfo> {
//   @override
//   Widget build(BuildContext context) {
//     var carInfo = widget.car.getInfo();
//     Future<List<dynamic>> repairs = getCarRepairs(carInfo["vin"]);
//     // resets state to get the latest repairs
//     Future refresh() async {
//       setState(() {
//         repairs = getCarRepairs(carInfo["vin"]);
//       });
//     }

//     return Column(
//       children: [
//         Padding(
//           padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
//           child: Row(
//             children: [
//               const Text(
//                 "VIN: ",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Text(carInfo['vin']),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
//           child: Row(
//             children: [
//               const Text(
//                 "Year: ",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8),
//                 child: Text(carInfo['year'].toString()),
//               ),
//               const Text(
//                 "Make: ",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: Text(capitalize(carInfo['make'])),
//               ),
//               const Text(
//                 "Model: ",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(right: 8.0),
//                 child: Text(eachCap(carInfo['model'])),
//               ),
//             ],
//           ),
//         ),
//         Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 16),
//           child: Row(
//             children: [
//               const Text(
//                 "Repairs:",
//                 style: TextStyle(fontWeight: FontWeight.bold),
//               ),
//               const Spacer(),
//               ElevatedButton(
//                 onPressed: () {
//                   // showDialog(
//                   //   context: context,
//                   //   builder: (BuildContext context) {
//                   //     return AlertDialog(
//                   //       scrollable: true,
//                   //       title: const Text('Add Repair'),
//                   //       content: Padding(
//                   //         padding: const EdgeInsets.all(8.0),
//                   //         child:
//                   //             RepairForm(vin: carInfo["vin"], refresh: refresh),
//                   //       ),
//                   //     );
//                   //   },
//                   // ).then(
//                   //   (value) {
//                   //     refresh();
//                   //   },
//                   // );
//                 },
//                 child: const Icon(Icons.add),
//               ),
//             ],
//           ),
//         ),
//         Expanded(
//           child: FutureBuilder(
//             future: repairs,
//             builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
//               List<Widget> children;
//               if (snapshot.hasData) {
//                 children =
//                     showAllRepairs(carInfo['vin'], snapshot, context, refresh);
//               } else if (snapshot.hasError) {
//                 children = [];
//                 debugPrint("Error populating repairs");
//               } else {
//                 children = const <Widget>[
//                   SizedBox(
//                     width: 60,
//                     height: 60,
//                     child: CircularProgressIndicator(),
//                   ),
//                 ];
//               }
//               return RefreshIndicator(
//                 onRefresh: () => refresh(),
//                 child: ListView(
//                   children: children,
//                 ),
//               );
//             },
//           ),
//         ),
//       ],
//     );
//   }
// }
