import 'package:flutter/material.dart';
import 'package:my_car_records/controllers/my_extensions.dart';
import 'package:my_car_records/controllers/part/update_part_form.dart';
import 'package:my_car_records/model/db/part_real_time.dart';
import 'package:my_car_records/model/part.dart';

/// showAllParts
///
/// Loops throught the [partsList], uses the [context] to know what the last screen was, [refresh] is a function that changes the state of the parent widget. Creates a card widget with the cars information and adds it to the cars array.
///
List<Widget> showAllParts(partsList, BuildContext context, Function refresh,
    String vin, String repairId) {
  List<Widget> parts = [];
// creates a card for each repair entry
  for (Part part in partsList.data) {
    Map<String, dynamic> partData = part.getPartInfo();

    parts.add(
      Card(
        child: ListTile(
          leading: const Icon(
            Icons.settings,
            size: 56.0,
          ),
          title: Text(eachCap(partData["name"])),
          subtitle: Row(
            children: [
              const Text("Quantity: "),
              Text("${partData['quantity']}"),
              const Spacer(),
              const Text("Total: "),
              Text(part.getPartTotal().toStringAsFixed(2))
            ],
          ),
          trailing: PopupMenuButton(
            itemBuilder: (BuildContext ctx) => [
              PopupMenuItem(
                  child: TextButton(
                      onPressed: (() {
                        deletePart(vin, repairId, partData["id"]);
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
                              title: const Text('Update Part'),
                              content: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: UpdatePartForm(
                                  refresh: refresh,
                                  vin: vin,
                                  partId: partData['id'],
                                  name: partData["name"],
                                  quantity: partData['quantity'],
                                  repairId: repairId,
                                  unitPrice: partData['price'],
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
        ),
      ),
    );
  }
  return parts;
}

// PopupMenuButton(
//             onSelected: (String value) {
//               // check to either delete or edit car
//               if (value == "edit") {
//                 debugPrint("to edit car page");
//               } else {

//                  deletePart(vin,repairId,partData["id"]);

//                 refresh();
//                 // displays message to user about deleted
//                 const snackBar = SnackBar(content: Text('Part Deleted'));
//                 ScaffoldMessenger.of(context).showSnackBar(snackBar);
//               }
//             },
//             itemBuilder: (BuildContext ctx) => [
//               const PopupMenuItem(value: 'edit', child: Text('Edit')),
//               PopupMenuItem(
//                 value: 'delete',
//                 child: const Text('Delete'),
//                 onTap: () {},
//               ),
//             ],
//           )

//  UpdatePartForm(
//                                   refresh: refresh, vin: vin,partId: partData['id'], name: partData["name"], quantity: partData['quantity'], repairId: repairId, unitPrice: partData['unitPrice'],
//
