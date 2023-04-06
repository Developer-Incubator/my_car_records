import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/controllers/car/car_forms/car_form.dart';
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
        middle: Text(
          homePageTitle,
          style: const TextStyle(color: CupertinoColors.white),
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
              return ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (BuildContext context, int index) {
                    QueryDocumentSnapshot car = snapshot.data!.docs[index];
                    print(car.data());

                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CupertinoListTile(
                        title: Text(
                            "${car["year"]} ${car["make"]} ${car["model"]}"),
                        subtitle: car["vin"] != null ? Text(car["vin"]) : null,
                        onTap: () => Navigator.pushNamed(context, "/carDetails",
                            arguments: {
                              "carId": car.id,
                              "make": car["make"].toString(),
                              "model": car["model"].toString(),
                              "year": car["year"].toString(),
                              "vin": car["vin"].toString()
                            }),
                      ),
                    );
                  });
            }
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }),
    );
  }
}