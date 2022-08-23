import 'package:flutter/material.dart';

List<Widget> showAllParts(partsList, context) {
  List<Widget> parts = [];
// creates a card for each repair entry
  for (var part in partsList.data) {
    var partData = part.getPartInfo();
    print(partData);
    parts.add(
      const Card(
        child: ListTile(
          leading: Icon(
            Icons.settings,
            size: 56.0,
          ),
          title: Text("Parts Page"),
          // subtitle: Text("\$$total"),
          trailing: Icon(Icons.more_vert),
          // onTap: () {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(builder: (_) => RepairInfo(vin:vin, id:repairData['id'])),
          //   );
          // },
        ),
      ),
    );
  }
  return parts;
}
