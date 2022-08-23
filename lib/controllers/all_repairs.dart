import 'package:flutter/material.dart';
import 'package:my_car_records/controllers/repair_info.dart';

/// Creates a list of card widgets to populate the repairs list
// @param vin String vehicle id
// @param repairlist Array list of all the repairs in a Repair class format
// @param context info about previous page
List<Widget> showAllRepairs(vin,repairList, context) {
  List<Widget> repairs = [];
// creates a card for each repair entry
  for (var repair in repairList.data) {
    var repairData = repair.getRepairInfo();
    String workRequested = repairData['workRequested'];
    repairs.add(
      Card(
        child: ListTile(
          leading: const Icon(
            Icons.car_repair_rounded,
            size: 56.0,
          ),
          title: Text(workRequested),
          // subtitle: Text("\$$total"),
          trailing: const Icon(Icons.more_vert),
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(builder: (_) => RepairInfo(vin:vin, repair: repair,)),
            );
          },
        ),
      ),
    );
  }
  return repairs;
}
