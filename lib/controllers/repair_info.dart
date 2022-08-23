import 'package:flutter/material.dart';
import 'package:my_car_records/controllers/car_info.dart';
import 'package:my_car_records/model/database.dart';
// import 'package:my_car_records/controllers/all_parts.dart';
// import 'package:my_car_records/model/database.dart';
import 'package:my_car_records/model/repair.dart';

// class RepairInfo extends StatelessWidget {
//   const RepairInfo({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(),
//     );
//   }
// }
class RepairInfo extends StatefulWidget {
  final Repair repair;
  final String vin;
  const RepairInfo({Key? key, required this.vin, required this.repair})
      : super(key: key);

  @override
  State<RepairInfo> createState() => _RepairInfoState();
}

class _RepairInfoState extends State<RepairInfo> {
  @override
  Widget build(BuildContext context) {
    var repairInfo = widget.repair.getRepairInfo();

    var repair = getARepair(vin: widget.vin, repairId: repairInfo["id"]);

    // print(repair);
    //  var carInfo = widget.car[0].getInfo();
    // var parts = getRepairParts(repairInfo["parts"]);
    return FutureBuilder(
      future: repair,
        builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
           Widget child;
              if (snapshot.hasData) {
               
                child = CarInfo(car: snapshot.data);
              } else if (snapshot.hasError) {
                child = const Text("Error populating list");
                print("Error populating list");
              } else {
                child = const SizedBox(
                  width: 60,
                  height: 60,
                  child: CircularProgressIndicator(),
                );
                
              }
              return Container(
                child: child,
              );
        });
    // Scaffold(
    //   appBar: AppBar(),
    //   body: Column(children: [
    //     Padding(
    //       padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
    //       child: Row(
    //         children: [
    //           const Text(
    //             "ID: ",
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //           Text(repairInfo['id']),
    //           const Spacer(),
    //           const Text(
    //             "Technition: ",
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(right: 8),
    //             child: Text(repairInfo["tech"]),
    //           ),
    //           const Spacer(),
    //           const Text(
    //             "Requsted: ",
    //             style: TextStyle(fontWeight: FontWeight.bold),
    //           ),
    //           Padding(
    //             padding: const EdgeInsets.only(right: 8.0),
    //             child: Text(repairInfo["workRequested"]),
    //           ),
    //         ],
    //       ),
    //     ),
    //     Padding(
    //       padding: const EdgeInsets.symmetric(horizontal: 10),
    //       child: Row(
    //         children: [
    //           const Text("Parts"),
    //           const Spacer(),
    //           ElevatedButton(
    //               onPressed: () {
    //                 print("Hehe pressed me");
    //                 // Navigator.of(context).push(
    //                 //     MaterialPageRoute(builder: (_) =>  RepairForm(vin: carInfo['vin'],))).then((value) => setState((){}));
    //               },
    //               child: const Icon(Icons.add))
    //         ],
    //       ),
    //     ),
    //     Expanded(
    //       child: FutureBuilder(
    //         future: parts,
    //         builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
    //           List<Widget> children;
    //           if (snapshot.hasData) {
    //             children = showAllParts(snapshot, context);
    //           } else if (snapshot.hasError) {
    //             children = [];
    //             debugPrint("Error populating repairs");
    //           } else {
    //             children = const <Widget>[
    //               SizedBox(
    //                 width: 60,
    //                 height: 60,
    //                 child: CircularProgressIndicator(),
    //               ),
    //             ];
    //           }
    //           return ListView(
    //             children: children,
    //           );
    //         },
    //       ),
    //     )
    //   ]),
    // );
  }
}
