import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/controllers/my_extensions.dart';
import 'package:my_car_records/model/db/repair.dart';
import 'package:my_car_records/model/repair.dart';
import 'package:my_car_records/views/repair_form/repair_form_shell.dart';
import 'package:my_car_records/model/db/car.dart';
import 'package:my_car_records/model/vin_decoder.dart';

import '../../model/car.dart';

class IOSCarDetails extends StatefulWidget {
  const IOSCarDetails(
      {super.key,
      required this.carId,
      required this.make,
      required this.model,
      required this.year,
      this.vin});
  final String carId;
  final String make;
  final String model;
  final String year;
  final String? vin;

  @override
  State<IOSCarDetails> createState() => _IOSCarDetailsState();
}

class _IOSCarDetailsState extends State<IOSCarDetails> {
  refresh() {
    setState(() {});
  }

  void _showVehicleDetailsDialog(BuildContext context, double screenWidth) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return CupertinoPopupSurface(
            child: widget.vin != null
                ? FutureBuilder(
                    future: VinDecoder().decodeVin(widget.vin),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.hasError) {
                        return const SizedBox(
                          height: 400,
                          child: Center(
                              child:
                                  Text("Could not get vehicles information")),
                        );
                      }
                      if (snapshot.hasData) {
                        return SizedBox(
                          height: 400,
                          width: screenWidth,
                          child: Column(
                            children: const [
                              Text("Info will go here"),
                            ],
                          ),
                        );
                      }
                      return const SizedBox(
                        height: 400,
                        child: Center(child: CupertinoActivityIndicator()),
                      );
                    })
                : const SizedBox(
                    height: 400,
                    child: Center(
                      child: Text(
                          "Please enter vin to get more information about your vehicle"),
                    ),
                  ),
          );
        });
  }

  void _showDeleteCarDialog(BuildContext context) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: const Text('Delete Vehicle'),
        content:
            const Text('Are you sure you would like to delete this vehicle'),
        actions: <CupertinoDialogAction>[
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancel'),
          ),
          CupertinoDialogAction(
            /// This parameter indicates the action would perform
            /// a destructive action such as deletion, and turns
            /// the action's text color to red.
            isDestructiveAction: true,
            onPressed: () {
              CarDB().delete(widget.carId);

              Navigator.popUntil(context, ModalRoute.withName("/dashboard"));
              iosHomeKey.currentState!.setState(() {});
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showAddRepairPopUp() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return CupertinoPopupSurface(
              child: RepairForm(
            refresh: refresh,
            carID: widget.carId,
            vin: widget.vin,
          ));
        });
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          "${widget.year} ${capitalize(widget.make)} ${widget.model}",
          style: const TextStyle(color: CupertinoColors.white),
        ),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            CupertinoIcons.add,
            color: CupertinoColors.white,
          ),
          onPressed: () {
            _showAddRepairPopUp();
          },
        ),
      ),
      child: SingleChildScrollView(
        child: FutureBuilder(
            future: RepairDB().get(widget.carId),
            builder:
                (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CupertinoActivityIndicator();
              }
              if (snapshot.hasError) {
                return const Text("Could not retrieve vehicle repairs");
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(right: 8, left: 8),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30)),
                          child: Image(
                            width: screenWidth * .5,
                            image: const NetworkImage(
                                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFcWLa3OBZA7nASekS1HqjnoQ9TaagdrmNjHkN9e0lceyBCHcLwBGShj4B7dqcJUZy_uc&usqp=CAU'),
                          ),
                        ),
                        Column(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                RichText(
                                  text: TextSpan(
                                    text: 'Vin ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: widget.vin,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal))
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Make ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: widget.make,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal))
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Model ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: widget.model,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal))
                                    ],
                                  ),
                                ),
                                RichText(
                                  text: TextSpan(
                                    text: 'Year ',
                                    style: const TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.blueGrey),
                                    children: <TextSpan>[
                                      TextSpan(
                                          text: widget.year,
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: SizedBox(
                                width: screenWidth * .37,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        color: Colors.blueGrey,
                                        child: const Icon(
                                            Icons.camera_alt_outlined),
                                        onPressed: () {},
                                      ),
                                    ),
                                    SizedBox(
                                      height: 40,
                                      width: 60,
                                      child: CupertinoButton(
                                        padding: EdgeInsets.zero,
                                        color: Colors.blueGrey,
                                        child: const Text("Specs"),
                                        onPressed: () =>
                                            _showVehicleDetailsDialog(
                                                context, screenWidth),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 12.0),
                    child: Column(
                      children: [
                        const Text(
                          "Repair List",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        SizedBox(
                          height: screenHeight * .7,
                          width: screenWidth * .95,
                          child: ListView.separated(
                            itemCount: snapshot.data!.docs.length,
                            itemBuilder: (BuildContext context, int index) {
                              Repair repair = Repair.fromJson(
                                  snapshot.data!.docs[index].data()
                                      as Map<String, dynamic>);

                              return CupertinoListTile(
                                title: Text(repair.workRequested),
                                onTap: () {
                                  print("Repair Details");
                                },
                              );
                            },
                            separatorBuilder:
                                (BuildContext context, int index) {
                              return const Divider(
                                color: Colors.blueGrey,
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  SafeArea(
                    child: CupertinoButton(
                        color: CupertinoColors.destructiveRed,
                        child: const Text(
                          "Delete Car",
                          style: TextStyle(color: CupertinoColors.white),
                        ),
                        onPressed: () => _showDeleteCarDialog(context)),
                  )
                ],
              );
            }),
      ),
    );
  }
}
