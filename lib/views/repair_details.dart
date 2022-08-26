import 'package:flutter/material.dart';
import 'package:my_car_records/controllers/repair/repair_info.dart';
import 'package:my_car_records/model/db/repair.dart';

import 'package:my_car_records/model/repair.dart';

class RepairDetails extends StatefulWidget {
  const RepairDetails({Key? key, required this.vin, required this.repair})
      : super(key: key);

  final Repair repair;
  final String vin;

  @override
  State<RepairDetails> createState() => _RepairDetailsState();
}

class _RepairDetailsState extends State<RepairDetails> {
  @override
  Widget build(BuildContext context) {
    
    Map<String, dynamic> repairInfo = widget.repair.getRepairInfo();
    Future<List<dynamic>> repair = getARepair(vin: widget.vin, repairId: repairInfo["id"]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Repair Info"),
      ),
      body: FutureBuilder(
          future: repair,
          builder: (BuildContext context, AsyncSnapshot<List> snapshot) {
            Widget child;
            if (snapshot.hasData) {
              child = RepairInfo(repair: snapshot.data, vin: widget.vin);
            } else if (snapshot.hasError) {
              child = const Text("Error populating list");
              debugPrint("Error populating list");
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
          }),
    );
  }
}
