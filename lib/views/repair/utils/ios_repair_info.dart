import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:my_car_records/controllers/part/part_form.dart';
import 'package:my_car_records/model/part.dart';
import 'package:my_car_records/model/repair.dart';
import 'package:my_car_records/views/repair/utils/sliverdelegate.dart';

class IOSRepairInfo extends StatefulWidget {
  const IOSRepairInfo(
      {super.key,
      required this.vehicleID,
      required this.repair,
      required this.refresh});
  final String vehicleID;
  final Repair repair;
  final Function refresh;

  @override
  State<IOSRepairInfo> createState() => _IOSRepairInfoState();
}

class _IOSRepairInfoState extends State<IOSRepairInfo> {
  final User? user = FirebaseAuth.instance.currentUser;

  final Reference storageRef = FirebaseStorage.instance.ref();

  double partTotal = 0;
  void updatePartTotal(List<QueryDocumentSnapshot> snapshot) {
    partTotal = 0;
    for (var element in snapshot) {
      Part part = Part.fromJson(
          element.data() as Map<String, dynamic>, widget.repair.id!);

      partTotal += part.getPartTotal();
    }
  }

  @override
  Widget build(BuildContext context) {
    Reference? noImagesRef = storageRef.child("General/noImageAvailable.jpeg");
    Reference? imagesRef = storageRef
        .child("${user!.uid}/${widget.vehicleID}/repairs/${widget.repair.id}");
    return CupertinoPageScaffold(
        backgroundColor: CupertinoColors.systemGroupedBackground,
        navigationBar: CupertinoNavigationBar(
          middle: const Text(
            "Repair Info",
            style: TextStyle(color: CupertinoColors.white),
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
                  //PartForm
                  return CupertinoPopupSurface(
                      child: PartForm(
                          vehicleID: widget.vehicleID,
                          repairId: widget.repair.id!,
                          refresh: widget.refresh));
                }),
          ),
        ),
        child: FutureBuilder(
            future: Future.wait([
              widget.repair.getParts(),
              noImagesRef.getData(),
              imagesRef.listAll(),
            ]),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              widget.repair.getParts();
              if (snapshot.hasError) {
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
                      ))
                    ];
                  },
                  body: Column(
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
                                Text("  Hours: ${widget.repair.hours}")
                              ],
                            ),
                            trailing: Text(
                                widget.repair.laborTotal().toStringAsFixed(2)),
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
                                    snapshot.data?[0].docs.length ?? 0,
                                    (index) {
                                  Part part = Part.fromJson(
                                      snapshot.data![0].docs[index].data()
                                          as Map<String, dynamic>,
                                      snapshot.data![0].docs[index].id);

                                  return CupertinoListTile(
                                    title: Text(part.name),
                                    subtitle: Row(
                                      children: [
                                        Text(
                                            "Price: \$${part.unitPrice?.toStringAsFixed(2)} "),
                                        Text(" Quantity: ${part.quantity}"),
                                      ],
                                    ),
                                    trailing: Text(
                                        part.getPartTotal().toStringAsFixed(2)),
                                    onTap: () {
                                      // Navigator.pushNamed(context, "/repairDetails",
                                      //     arguments: {
                                      //       "vehicleID": widget.vehicleID,
                                      //       "repair": repair
                                      //     });
                                    },
                                  );
                                })
                              ],
                            ),
                          ),
                          CupertinoListSection.insetGrouped(
                            header: const Text("Total"),
                            children: [
                              CupertinoListTile(
                                title: const Text("Grand Total:"),
                                trailing: Text(
                                  partTotal.toStringAsFixed(2),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ));
            }));
  }
}
