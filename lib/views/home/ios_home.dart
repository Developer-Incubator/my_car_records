import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/vehicle.dart';
import 'package:my_car_records/views/vehicle/car_forms/car_form.dart';
import 'package:my_car_records/model/db/car.dart';

class IOSHomePage extends StatefulWidget {
  const IOSHomePage({
    super.key,
    required this.user,
    required this.firestore,
    required this.refresh,
  });
  final User user;
  final FirebaseFirestore firestore;
  final Function refresh;

  @override
  State<IOSHomePage> createState() => IOSHomePageState();
}

class IOSHomePageState extends State<IOSHomePage> {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

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
                      child: CarForm(
                          user: widget.user,
                          firestore: widget.firestore,
                          refresh: widget.refresh));
                })),
      ),
      child: FutureBuilder<List<Vehicle>>(
          future: CarDB(firestore: firestore, user: widget.user).get(),
          builder: (context, AsyncSnapshot<List<Vehicle>> snapshot) {
            if (snapshot.hasError) {
              log(snapshot.error.toString());
              return const Center(
                child: Text("Could not get cars"),
              );
            }

            if (snapshot.hasData) {
              return CupertinoListSection.insetGrouped(
                header: const Text("Vehicle List"),
                children: [
                  ...List.generate(snapshot.data!.length, (index) {
                    Vehicle vehicle = snapshot.data![index];

                    return CupertinoListTile(
                      title: Text(
                          "${vehicle.modelYear} ${vehicle.make} ${vehicle.model}"),
                      subtitle: vehicle.vin != null ? Text(vehicle.vin!) : null,
                      trailing: const CupertinoListTileChevron(),
                      onTap: () => Navigator.pushNamed(context, "/carDetails",
                          arguments: {
                            "vehicle": vehicle,
                            "user": widget.user,
                            "firestore": widget.firestore,
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
