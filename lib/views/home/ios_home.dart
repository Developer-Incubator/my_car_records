import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/views/vehicle/car_forms/car_form.dart';
import 'package:my_car_records/model/db/car.dart';

class IOSHomePage extends StatefulWidget {
  const IOSHomePage({
    super.key,
    required this.refresh,
  });

  final Function refresh;

  @override
  State<IOSHomePage> createState() => IOSHomePageState();
}

class IOSHomePageState extends State<IOSHomePage> {
  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          homePageTitle,
          style: TextStyle(color: CupertinoColors.white),
        ),
        leading: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.person_fill,
            color: CupertinoColors.white,
          ),
          onPressed: () => Navigator.pushNamed(context, '/profile'),
        ),
        trailing: CupertinoButton(
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.add,
              color: CupertinoColors.white,
            ),
            onPressed: () => showCupertinoDialog(
                context: context,
                builder: (context) {
                  return CupertinoPopupSurface(
                      child: CarForm(refresh: widget.refresh));
                })),
      ),
      child: FutureBuilder<QuerySnapshot>(
          future: CarDB().get(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (snapshot.hasError) {
              return const Center(
                child: Text("Could not get cars"),
              );
            }

            if (snapshot.hasData) {
              return CupertinoListSection.insetGrouped(
                header: const Text("Vehicle List"),
                children: [
                  ...List.generate(snapshot.data!.docs.length, (index) {
                    QueryDocumentSnapshot car = snapshot.data!.docs[index];

                    return CupertinoListTile(
                      title:
                          Text("${car["year"]} ${car["make"]} ${car["model"]}"),
                      subtitle: car["vin"] != null ? Text(car["vin"]) : null,
                      trailing: const CupertinoListTileChevron(),
                      onTap: () => Navigator.pushNamed(context, "/carDetails",
                          arguments: {
                            "carId": car.id,
                            "make": car["make"].toString(),
                            "model": car["model"].toString(),
                            "year": car["year"].toString(),
                            "vin": car["vin"].toString()
                          }),
                    );
                  })
                ],
              );
            }
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }),
    );
  }
}
