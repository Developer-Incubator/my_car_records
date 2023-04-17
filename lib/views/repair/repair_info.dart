import 'dart:io';
import 'package:flutter/material.dart';
import 'package:my_car_records/model/repair.dart';
import 'package:my_car_records/views/repair/utils/ios_repair_info.dart';

/// displays all the information about a single Repair including parts
///
/// [repair] holds all the repair information.
/// [vin] vehicle id
/// [pageRefresh] updates the whole pageto display the current information.
///
// ignore: must_be_immutable
class RepairInfo extends StatefulWidget {
  const RepairInfo({Key? key, required this.vehicleID, required this.repair})
      : super(key: key);
  final String vehicleID;
  final Repair repair;
  @override
  State<RepairInfo> createState() => _RepairInfoState();
}

class _RepairInfoState extends State<RepairInfo> {
  @override
  Widget build(BuildContext context) {
    // var repairInfo = widget.repair.getRepairInfo();
    // gets app the parts associated with selected repair
    // Future<List<dynamic>> parts = getParts(widget.vin, repairInfo['id']);

    // double repairTotal =
    //     double.parse(widget.repair.getRepairTotal()) + widget.repair.labor;

    // refreshes the list of parts to keep it accurate when a part is deleted.
    refresh() {
      setState(() {
        // parts = getParts(widget.vin, repairInfo['id']);
        // widget.pageRefresh();
      });
    }

    return Platform.isIOS
        ? IOSRepairInfo(
            vehicleID: widget.vehicleID,
            repair: widget.repair,
            refresh: refresh,
          )
        : Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  children: const [
                    Text(
                      "ID: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // Text(repairInfo['id']),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                child: Row(
                  children: const [
                    Text(
                      "hours: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 8),
                    //   child: Text(repairInfo['hours'].toString()),
                    // ),
                    Text(
                      "Odometer: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 8.0),
                    //   child: Text(repairInfo['odometer']),
                    // ),
                    Text(
                      "Technition: ",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    // Padding(
                    //   padding: const EdgeInsets.only(right: 8.0),
                    //   child: Text(eachCap(repairInfo['tech'])),
                    // ),
                    //
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  children: [
                    const Text(
                      "Parts:",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    const Spacer(),
                    ElevatedButton(
                        onPressed: () {
                          // showDialog(
                          //   context: context,
                          //   builder: (BuildContext context) {
                          //     return AlertDialog(
                          //       scrollable: true,
                          //       title: const Text('Add Part'),
                          //       content: Padding(
                          //         padding: const EdgeInsets.all(8.0),
                          //         child: PartForm(
                          //             vin: widget.vin,
                          //             repairId: repairInfo['id'],
                          //             refresh: refresh),
                          //       ),
                          //     );
                          //   },
                          // ).then(
                          //   (value) {
                          //     widget.refresh();
                          //     refresh();
                          //   },
                          // );
                        },
                        child: const Icon(Icons.add)),
                  ],
                ),
              ),
              // Expanded(
              //   child: FutureBuilder(
              //     // future: parts,
              //     builder:
              //         (BuildContext context, AsyncSnapshot<List> snapshot) {
              //       // List<Widget> children;
              //       if (snapshot.hasData) {
              //         // children = showAllParts(snapshot, context, refresh,
              //         //     widget.vin, repairInfo['id']);
              //       } else if (snapshot.hasError) {
              //         children = [];
              //         debugPrint("Error populating repairs");
              //       } else {
              //         children = const <Widget>[
              //           SizedBox(
              //             width: 60,
              //             height: 60,
              //             child: CircularProgressIndicator(),
              //           ),
              //         ];
              //       }
              //       return RefreshIndicator(
              //         onRefresh: () {
              //           return Future.delayed(Duration.zero);
              //           // swipeRefresh();
              //         },
              //         child: ListView(
              //             // children: children,
              //             ),
              //       );
              //     },
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    const Spacer(),
                    Column(
                      children: const [
                        Text("Cost:"),
                        // Text("Parts: \$${widget.repair.getRepairTotal()}"),
                        // Text(
                        //     "Labor: \$${widget.repair.labor.toStringAsFixed(2)}"),
                        // Text("Total: \$${repairTotal.toStringAsFixed(2)}"),
                      ],
                    )
                  ],
                ),
              ),
            ],
          );
  }
}
