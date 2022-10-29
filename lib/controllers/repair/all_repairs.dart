import 'package:flutter/material.dart';
import 'package:my_car_records/controllers/my_extensions.dart';

import 'package:my_car_records/controllers/repair/update_repair_form.dart';
import 'package:my_car_records/model/db/car.dart';
import 'package:my_car_records/model/repair.dart';

import 'package:my_car_records/views/repair_details.dart';

/// Creates a list of card widgets to populate the repairs list
///
/// [vin] vehicle id that is getting the repair.
/// [repairId] id of the repair.
/// [context] info about the previous page.
///
List<Widget> showAllRepairs(vin, repairList, context, refresh) {
  List<Widget> repairs = [];
// creates a card for each repair entry
  for (Repair repair in repairList.data) {
    Map<String,dynamic> repairData = repair.getRepairInfo();
    String workRequested = capitalize(repairData['workRequested']);
    repairs.add(
      Card(
        child: ListTile(
          leading: const Icon(
            Icons.car_repair_rounded,
            size: 56.0,
          ),
          title: Text(workRequested),
          // subtitle: Text("\$$total"),
          trailing: PopupMenuButton(
            itemBuilder: (BuildContext ctx) => [
              PopupMenuItem(
                  child: TextButton(
                      onPressed: (() {
                        DbCar().deleteCar(vin);
                        refresh();
                      }),
                      child: const Text("Delete"))),
              PopupMenuItem(
                  child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              scrollable: true,
                              title: const Text('Update Repair'),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: RepairUpdateForm(
                                  refresh: refresh,
                                hours: repairData['hours'],labor:repairData['labor'], tech: repairData['tech'], odometer: repairData['odometer'], workRequested: repairData['workRequested'], vin: vin, repairId: repairData['id'],
                                ),
                              ),
                            );
                          },
                        ).then(
                          (value) {
                            refresh();
                          },
                        );
                      },
                      child: const Text("Edit"))),
            ],
          ),

          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (_) => RepairDetails(
                        vin: vin,
                        repair: repair,
                      )),
            );
          },
        ),
      ),
    );
  }
  return repairs;
}
