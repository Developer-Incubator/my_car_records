import 'dart:async';
import 'dart:typed_data';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/controllers/my_extensions.dart';
import 'package:my_car_records/model/db/vehicle.dart';
import 'package:my_car_records/model/repair.dart';
import 'package:my_car_records/model/user.dart';
import 'package:my_car_records/model/vehicle.dart';
import 'package:my_car_records/views/vehicle/utils/ios/ios_vehicle_specs.dart';
import 'package:my_car_records/views/repair/repair_form/repair_form_shell.dart';
import 'package:my_car_records/views/utls/camera.dart';
import 'package:pull_down_button/pull_down_button.dart';
import 'package:carousel_slider/carousel_slider.dart';

class IOSCarDetails extends StatefulWidget {
  const IOSCarDetails({super.key, required this.user, required this.vehicle});

  final User user;
  final Vehicle vehicle;

  @override
  State<IOSCarDetails> createState() => IOSCarDetailsState();
}

class IOSCarDetailsState extends State<IOSCarDetails> {
  final Reference storageRef = FirebaseStorage.instance.ref();

  refresh() {
    setState(() {});
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
            onPressed: () async {
              await DBVehicle.delete(widget.vehicle.id!).then((value) =>
                  Navigator.popUntil(
                      context, ModalRoute.withName("/dashboard")));
              // CarDB(user: widget.user, firestore: widget.firestore)
              //     .delete(widget.vehicle.id!);

              // Navigator.popUntil(context, ModalRoute.withName("/dashboard"));
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
            vehicleID: widget.vehicle.id!,
            vin: widget.vehicle.vin,
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;

    Reference? noImagesRef = storageRef.child("General/noImageCar.jpeg");
    Reference? imagesRef =
        storageRef.child("${widget.user.id}/${widget.vehicle.id}");

    return CupertinoPageScaffold(
      backgroundColor: CupertinoColors.systemGroupedBackground,
      navigationBar: CupertinoNavigationBar(
          middle: Text(
            "${widget.vehicle.modelYear} ${capitalize(widget.vehicle.make)} ${widget.vehicle.model}",
            style: const TextStyle(color: CupertinoColors.white),
          ),
          trailing: PullDownButton(
            itemBuilder: (context) => [
              PullDownMenuItem(
                title: 'Add Repair',
                icon: CupertinoIcons.add,
                onTap: () {
                  _showAddRepairPopUp();
                },
              ),
              PullDownMenuItem(
                title: 'Edit Vehicle',
                icon: CupertinoIcons.pencil,
                onTap: () {
                  //TODO: add a way to edit the vehicle information
                  debugPrint("To Edit Vehicle Info");
                },
              ),
              const PullDownMenuDivider.large(),
              PullDownMenuItem(
                title: 'Delete Vehicle',
                icon: CupertinoIcons.trash,
                isDestructive: true,
                onTap: () {
                  _showDeleteCarDialog(context);
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
          )),
      child: FutureBuilder(
          future: Future.wait([
            widget.vehicle.getRepairs(),
            noImagesRef.getData(),
            imagesRef.listAll(),
          ]),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasError) {
              print(snapshot.error);
              return const Text("Could not retrieve vehicle repairs");
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Stack(
                children: const [
                  Align(
                      alignment: Alignment.center,
                      child: CupertinoActivityIndicator()),
                ],
              );
            }
            Uint8List noImageImageUint8List = snapshot.data[1];
            ListResult imageListResults = snapshot.data[2];
            List<Future<Uint8List?>> imageList = [];
            for (var element in imageListResults.items) {
              imageList.add(element.getData());
            }

            return SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 14.0),
                    child: Row(
                      children: [
                        FutureBuilder(
                            future: Future.wait(imageList),
                            builder: (context,
                                AsyncSnapshot<List<Uint8List?>> snapshot) {
                              if (snapshot.hasError) {
                                return Image.memory(
                                  noImageImageUint8List,
                                  width: screenWidth * .55,
                                );
                              }
                              if (snapshot.connectionState ==
                                  ConnectionState.waiting) {
                                return const Center(
                                  child: CupertinoActivityIndicator(),
                                );
                              }
                              List<Uint8List?> data = snapshot.data!;
                              return Container(
                                padding:
                                    const EdgeInsets.only(right: 8, left: 8),

                                width: screenWidth * .5,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30)),
                                child: data.isNotEmpty
                                    ? CarouselSlider.builder(
                                        itemCount: data.length,
                                        options: CarouselOptions(
                                          autoPlay:
                                              data.length > 1 ? true : false,
                                          autoPlayInterval:
                                              const Duration(seconds: 5),
                                          autoPlayAnimationDuration:
                                              const Duration(milliseconds: 800),
                                          autoPlayCurve: Curves.fastOutSlowIn,
                                          enlargeCenterPage: true,
                                          enlargeFactor: 0.3,
                                          scrollDirection: Axis.horizontal,
                                        ),
                                        itemBuilder: (BuildContext context,
                                            int itemIndex, int pageViewIndex) {
                                          return CupertinoContextMenu(
                                            actions: <Widget>[
                                              CupertinoContextMenuAction(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                isDefaultAction: true,
                                                trailingIcon: CupertinoIcons
                                                    .doc_on_clipboard_fill,
                                                child: const Text('Copy'),
                                              ),
                                              CupertinoContextMenuAction(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                trailingIcon:
                                                    CupertinoIcons.share,
                                                child: const Text('Share'),
                                              ),
                                              CupertinoContextMenuAction(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },
                                                trailingIcon:
                                                    CupertinoIcons.heart,
                                                child: const Text('Favorite'),
                                              ),
                                              CupertinoContextMenuAction(
                                                onPressed: () {
                                                  imageListResults
                                                      .items[itemIndex]
                                                      .delete()
                                                      .then(
                                                          (value) => refresh());
                                                  // refresh();
                                                  Navigator.pop(context);
                                                },
                                                isDestructiveAction: true,
                                                trailingIcon:
                                                    CupertinoIcons.delete,
                                                child: const Text('Delete'),
                                              ),
                                            ],
                                            child: Image.memory(
                                              data[itemIndex]!,
                                              fit: BoxFit.fitWidth,
                                            ),
                                          );
                                        })
                                    : Image.memory(
                                        noImageImageUint8List,
                                        width: screenWidth * .5,
                                      ),
                                // Image(
                                //     width: screenWidth * .5, image:
                                // const NetworkImage(
                                //     'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFcWLa3OBZA7nASekS1HqjnoQ9TaagdrmNjHkN9e0lceyBCHcLwBGShj4B7dqcJUZy_uc&usqp=CAU'),
                              );
                            }),
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
                                          text: widget.vehicle.vin,
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
                                          text: widget.vehicle.make,
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
                                          text: widget.vehicle.model,
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
                                          text: widget.vehicle.modelYear
                                              .toString(),
                                          style: const TextStyle(
                                              fontWeight: FontWeight.normal))
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 4.0),
                              child: SizedBox(
                                width: screenWidth * .37,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    PullDownButton(
                                      itemBuilder: (context) => [
                                        PullDownMenuItem(
                                          title: 'Take Photo',
                                          icon: Icons.camera_alt_outlined,
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              CupertinoPageRoute(
                                                builder: (context) {
                                                  return Camera(
                                                    camera: cameras[0],
                                                    vehicleID:
                                                        widget.vehicle.id!,
                                                    refresh: refresh,
                                                  );
                                                },
                                              ),
                                            );
                                          },
                                        ),
                                        PullDownMenuItem(
                                          title: 'Import Image',
                                          icon: CupertinoIcons
                                              .plus_rectangle_on_rectangle,
                                          onTap: () {
                                            ///TODO: impliment users camera roll
                                            debugPrint("To Users Camera Roll");
                                          },
                                        ),
                                        const PullDownMenuDivider.large(),
                                        PullDownMenuItem(
                                          title: 'Gallery',
                                          icon:
                                              CupertinoIcons.photo_on_rectangle,
                                          onTap: () {
                                            ///TODO: Create a photo galley for users to see all and edit photos
                                            debugPrint("To Image Gallery");
                                          },
                                        ),
                                      ],
                                      position: PullDownMenuPosition.automatic,
                                      buttonBuilder: (context, showMenu) =>
                                          SizedBox(
                                        height: 40,
                                        width: 40,
                                        child: CupertinoButton(
                                          onPressed: showMenu,
                                          color: Colors.blueGrey,
                                          padding: EdgeInsets.zero,
                                          child: const Icon(
                                            CupertinoIcons.photo_on_rectangle,
                                          ),
                                        ),
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
                                              Navigator.of(context).push(
                                                CupertinoPageRoute(
                                                  builder: (_) =>
                                                      IOSVehicleSpecs(
                                                    vin: widget.vehicle.vin,
                                                  ),
                                                ),
                                              )),
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
                    child: SafeArea(
                      child: CupertinoListSection.insetGrouped(
                        header: const Text(
                          "Repair List",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 16),
                        ),
                        children: [
                          ...List.generate(snapshot.data[0]!.length, (index) {
                            Repair repair = snapshot.data[0][index];
                            return CupertinoListTile(
                              title: Text(repair.workRequested),
                              trailing: const CupertinoListTileChevron(),
                              onTap: () {
                                Navigator.pushNamed(context, "/repairDetails",
                                    arguments: {
                                      "vehicleID": widget.vehicle.id,
                                      "repair": repair
                                    });
                              },
                            );
                          })
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          }),
    );
  }
}
