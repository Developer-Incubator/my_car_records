import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/controllers/part/part_form.dart';
import 'package:my_car_records/model/db/repair.dart';
import 'package:my_car_records/model/part.dart';
import 'package:my_car_records/model/repair.dart';
import 'package:my_car_records/model/user.dart';
import 'package:my_car_records/utils/sharedprefs.dart';
import 'package:my_car_records/views/repair/utils/sliverdelegate.dart';
import 'package:pull_down_button/pull_down_button.dart';

class IOSRepairInfo extends StatefulWidget {
  const IOSRepairInfo({
    super.key,
    required this.vehicleID,
    required this.repair,
    // required this.refresh
  });
  final int vehicleID;
  final Repair repair;
  // final Function refresh;

  @override
  State<IOSRepairInfo> createState() => _IOSRepairInfoState();
}

class _IOSRepairInfoState extends State<IOSRepairInfo> {
  User? user = SharedPrefs.getUser();

  final Reference storageRef = FirebaseStorage.instance.ref();

  double partTotal = 0;

  void _showDeleteRepairDialog(BuildContext context, String type) {
    showCupertinoModalPopup<void>(
      context: context,
      builder: (BuildContext context) => CupertinoAlertDialog(
        title: Text(type == "repair" ? 'Delete Repair' : "Delete Part"),
        content: Text(type == "repair"
            ? 'Are you sure you would like to delete this repair'
            : 'Are you sure you would like to delete this part'),
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
            onPressed: () async {
              if (type == "repair") {
                await DBRepair.delete(widget.repair.id!).then(
                  (value) {
                    Navigator.popUntil(
                        context, ModalRoute.withName('/carDetails'));

                    iosVehicleViewKey.currentState!.setState(() {});
                  },
                );
              } else {
                ///TODO: impliment deleting part here
              }

              // widget.refresh();
            },
            child: const Text('Delete'),
          ),
        ],
      ),
    );
  }

  void _showAddPartPopUp() {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoPopupSurface(
          child: PartForm(
            vehicleID: widget.vehicleID,
            repairId: widget.repair.id!,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Reference? noImagesRef = storageRef.child("General/noImageAvailable.jpeg");
    Reference? imagesRef = storageRef
        .child("${user!.id}/${widget.vehicleID}/repairs/${widget.repair.id}");
    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
        middle: const Text(
          "Repair Info",
          style: TextStyle(color: CupertinoColors.white),
        ),
        trailing: PullDownButton(
          itemBuilder: (context) => [
            PullDownMenuItem(
              title: 'Add Part',
              icon: CupertinoIcons.add,
              onTap: () {
                _showAddPartPopUp();
              },
            ),
            PullDownMenuItem(
              title: 'Edit Repair',
              icon: CupertinoIcons.pencil,
              onTap: () {
                //TODO: add a way to edit the vehicle information
                debugPrint("To Edit Repair Info");
              },
            ),
            const PullDownMenuDivider.large(),
            PullDownMenuItem(
              title: 'Delete Repair',
              icon: CupertinoIcons.trash,
              isDestructive: true,
              onTap: () {
                _showDeleteRepairDialog(context, "repair");
              },
            ),
          ],
          position: PullDownMenuPosition.automatic,
          buttonBuilder: (context, showMenu) => CupertinoButton(
            onPressed: showMenu,
            padding: EdgeInsets.zero,
            child: const Icon(
              CupertinoIcons.ellipsis,
              color: CupertinoColors.white,
            ),
          ),
        ),
      ),
      child: FutureBuilder(
        future: Future.wait(
          [
            widget.repair.getParts(),
            noImagesRef.getData(),
            imagesRef.listAll(),
            widget.repair.getTotal()
          ],
        ),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.hasError) {
            log(snapshot.error.toString());
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: const [Text("Couldn't retrieve repair data")],
            );
          }
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [CupertinoActivityIndicator()],
              ),
            );
          }
          Uint8List noImageImageUint8List = snapshot.data[1];
          ListResult imageListResults = snapshot.data[2];
          double repairTotal = snapshot.data[3];
          List<Future<Uint8List?>> imageList = [];
          for (var element in imageListResults.items) {
            imageList.add(element.getData());
          }
          return NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverPersistentHeader(
                  delegate: SliverAppBarDelegate(
                    futureImageList: imageList,
                    noImageImage: Image.memory(
                      noImageImageUint8List,
                    ),
                  ),
                )
              ];
            },
            body: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CupertinoListSection.insetGrouped(
                    header: const Text("Labor"),
                    children: [
                      CupertinoListTile(
                        title: const Text("Work Requested"),
                        subtitle: Text(widget.repair.workRequested),
                        trailing: const CupertinoListTileChevron(),
                      ),
                      CupertinoListTile(
                        title: Text(
                          widget.repair.tech ?? "N/A",
                        ),
                        subtitle: Row(
                          children: [
                            Text("Labor: \$${widget.repair.labor} / hr "),
                            Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Text("Hours: ${widget.repair.hours}"),
                            )
                          ],
                        ),
                        trailing:
                            Text(widget.repair.laborTotal().toStringAsFixed(2)),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12.0),
                        child: CupertinoListSection.insetGrouped(
                          header: const Text(
                            "Parts",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          children: [
                            ...List.generate(
                              snapshot.data?[0].length ?? 0,
                              (index) {
                                Part part = snapshot.data?[0][index];

                                return CupertinoListTile(
                                  title: Text(part.name),
                                  subtitle: Row(
                                    children: [
                                      Text(
                                          "Price: \$${part.unitPrice?.toStringAsFixed(2)} "),
                                      Text(" Quantity: ${part.quantity}"),
                                    ],
                                  ),
                                  trailing: Row(
                                    children: [
                                      Text("\$${part.total}"),
                                      SizedBox(
                                        height: 25,
                                        width: 25,
                                        child: PullDownButton(
                                          itemBuilder: (context) => [
                                            PullDownMenuItem(
                                              title: 'Edit Part',
                                              icon: CupertinoIcons.pencil,
                                              onTap: () {
                                                //TODO: add a way to edit the part information
                                                debugPrint("To Edit part Info");
                                              },
                                            ),
                                            const PullDownMenuDivider.large(),
                                            PullDownMenuItem(
                                              title: 'Delete Part',
                                              icon: CupertinoIcons.trash,
                                              isDestructive: true,
                                              onTap: () {
                                                _showDeleteRepairDialog(
                                                    context, "part");
                                              },
                                            ),
                                          ],
                                          position:
                                              PullDownMenuPosition.automatic,
                                          buttonBuilder: (context, showMenu) =>
                                              CupertinoButton(
                                            onPressed: showMenu,
                                            padding: EdgeInsets.zero,
                                            child: const Icon(
                                              CupertinoIcons.ellipsis_vertical,
                                              color: CupertinoColors.white,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  onTap: () {
                                    // Navigator.pushNamed(context, "/repairDetails",
                                    //     arguments: {
                                    //       "vehicleID": widget.vehicleID,
                                    //       "repair": repair
                                    //     });
                                  },
                                );
                              },
                            )
                          ],
                        ),
                      ),
                      CupertinoListSection.insetGrouped(
                        header: const Text("Totals"),
                        children: [
                          CupertinoListTile(
                            title: const Text("Parts:"),
                            trailing: Text(
                              "\$${repairTotal.toStringAsFixed(2)}",
                            ),
                          ),
                          CupertinoListTile(
                            title: const Text("Labor:"),
                            trailing: Text(
                              "\$${widget.repair.labor}",
                            ),
                          ),
                          CupertinoListTile(
                            title: const Text("Subtotal:"),
                            trailing: Text(
                              "\$${double.parse(repairTotal.toStringAsFixed(2)) + (widget.repair.labor ?? 0)}",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
