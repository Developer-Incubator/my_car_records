import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/controllers/my_extensions.dart';
import 'package:my_car_records/model/car.dart';
import 'package:my_car_records/model/db/repair.dart';
import 'package:my_car_records/model/repair.dart';
import 'package:my_car_records/views/repair_form/repair_form_shell.dart';
import 'package:my_car_records/model/db/car.dart';
import 'package:my_car_records/model/vin_decoder.dart';
import 'package:my_car_records/views/utls/info_item.dart';

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

  void _showVehicleDetailsDialog(
      BuildContext context, double screenWidth, double screenHeight) {
    showCupertinoModalPopup(
        context: context,
        builder: (BuildContext builder) {
          return CupertinoPopupSurface(
            child: widget.vin != null
                ? FutureBuilder(
                    future: VinDecoder().decodeVin(widget.vin),
                    builder: (BuildContext context,
                        AsyncSnapshot<Vehicle?> snapshot) {
                      if (snapshot.hasError) {
                        return const SizedBox(
                          height: 400,
                          child: Center(
                              child:
                                  Text("Could not get vehicles information")),
                        );
                      }
                      if (snapshot.hasData) {
                        Vehicle? vehicle = snapshot.data;
                        return SizedBox(
                          height: screenHeight * .87,
                          width: screenWidth,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InfoItem(name: "ABS", info: vehicle!.abs),
                                InfoItem(
                                    name: "Active Safety System Notes",
                                    info: vehicle.activeSafetySysNote),
                                InfoItem(
                                    name: "Adaptive Cruise Control",
                                    info: vehicle.adaptiveCruiseControl),
                                InfoItem(
                                    name: "Adaptive Driving Beam",
                                    info: vehicle.adaptiveDrivingBeam),
                                InfoItem(
                                    name: "Curtain Airbag Location",
                                    info: vehicle.airBagLocCurtain),
                                InfoItem(
                                    name: "Front Airbag Location",
                                    info: vehicle.airBagLocFront),
                                InfoItem(
                                    name: "Knee Airbag Location",
                                    info: vehicle.airBagLocKnee),
                                InfoItem(
                                    name: "Cushion Airbag Location",
                                    info: vehicle.airBagLocSeatCushion),
                                InfoItem(
                                    name: "Side Airbag Location",
                                    info: vehicle.airBagLocSide),
                                InfoItem(
                                    name: "Auto Reverse System",
                                    info: vehicle.autoReverseSystem),
                                InfoItem(
                                    name: "Auto Reverse System",
                                    info: vehicle.autoReverseSystem),
                                InfoItem(
                                    name: "Automatic Padestrian Alerting Sound",
                                    info: vehicle
                                        .automaticPedestrianAlertingSound),
                                InfoItem(
                                    name: "Axle Configuration",
                                    info: vehicle.axleConfiguration),
                                InfoItem(name: "Axle", info: vehicle.axles),
                                InfoItem(
                                    name: "Base Price",
                                    info: vehicle.basePrice),
                                InfoItem(
                                    name: "Battery Amps",
                                    info: vehicle.batteryA),
                                InfoItem(
                                    name: "Battery Cells",
                                    info: vehicle.batteryCells),
                                InfoItem(
                                    name: "Battery Info",
                                    info: vehicle.batteryInfo),
                                InfoItem(
                                    name: "Battery KWh",
                                    info: vehicle.batteryKWh),
                                InfoItem(
                                    name: "Battery Modules",
                                    info: vehicle.batteryModules),
                                InfoItem(
                                    name: "Battery Packs",
                                    info: vehicle.batteryPacks),
                                InfoItem(
                                    name: "Battery Type",
                                    info: vehicle.batteryType),
                                InfoItem(
                                    name: "Battery Volts",
                                    info: vehicle.batteryV),
                                InfoItem(
                                    name: "Bed Length (in)",
                                    info: vehicle.bedLengthIN),
                                InfoItem(
                                    name: "Bed Type", info: vehicle.bedType),
                                InfoItem(
                                    name: "Blind Spot Intervention",
                                    info: vehicle.blindSpotIntervention),
                                InfoItem(
                                    name: "Blind Spot Monitoring",
                                    info: vehicle.blindSpotMon),
                                InfoItem(
                                    name: "Body Cab Type",
                                    info: vehicle.bodyCabType),
                                InfoItem(
                                    name: "Body Class",
                                    info: vehicle.bodyClass),
                                InfoItem(
                                    name: "Break System Description",
                                    info: vehicle.brakeSystemDesc),
                                InfoItem(
                                    name: "Break System Type",
                                    info: vehicle.brakeSystemType),
                                InfoItem(
                                    name: "Bus Floor Configuration Type",
                                    info: vehicle.busFloorConfigType),
                                InfoItem(
                                    name: "Bus Length (ft)",
                                    info: vehicle.busLength),
                                InfoItem(
                                    name: "Bus Type", info: vehicle.busType),
                                InfoItem(name: "CIB", info: vehicle.cib),
                                InfoItem(
                                    name: "Cach for Clunkers",
                                    info: vehicle.cashForClunkers),
                                InfoItem(
                                    name: "Charger Level",
                                    info: vehicle.chargerLevel),
                                InfoItem(
                                    name: "Charger Power (KW)",
                                    info: vehicle.chargerPowerKW),
                                InfoItem(
                                    name: "Cooling Type",
                                    info: vehicle.coolingType),
                                InfoItem(
                                    name: "Curb Weight (lbs)",
                                    info: vehicle.curbWeightLB),
                                InfoItem(
                                    name: "Custom Motorcycle Type",
                                    info: vehicle.customMotorcycleType),
                                InfoItem(
                                    name: "Daytime Running Light",
                                    info: vehicle.daytimeRunningLight),
                                InfoItem(
                                    name: "Destination Market",
                                    info: vehicle.destinationMarket),
                                InfoItem(
                                    name: "Displacement (CC)",
                                    info: vehicle.displacementCC),
                                InfoItem(
                                    name: "Displacement (CI)",
                                    info: vehicle.displacementCI),
                                InfoItem(
                                    name: "Displacement (L)",
                                    info: vehicle.displacementL),
                                InfoItem(name: "Doors", info: vehicle.doors),
                                InfoItem(
                                    name: "Drive Type",
                                    info: vehicle.driveType),
                                InfoItem(
                                    name: "Driver Assist",
                                    info: vehicle.driverAssist),
                                InfoItem(
                                    name: "Dynamic Brake Support",
                                    info: vehicle.dynamicBrakeSupport),
                                InfoItem(name: "EDR", info: vehicle.edr),
                                InfoItem(name: "ECS", info: vehicle.esc),
                                InfoItem(
                                    name: "EV Drive Unit",
                                    info: vehicle.evDriveUnit),
                                InfoItem(
                                    name: "Electrification Level",
                                    info: vehicle.electrificationLevel),
                                InfoItem(
                                    name: "Engine Configuration",
                                    info: vehicle.engineConfiguration),
                                InfoItem(
                                    name: "Engine Cycles",
                                    info: vehicle.engineConfiguration),
                                InfoItem(
                                    name: "Engine Cylinders",
                                    info: vehicle.engineCylinders),
                                InfoItem(
                                    name: "Engine Horsepower",
                                    info: vehicle.engineHP),
                                InfoItem(
                                    name: "Engine KW", info: vehicle.engineKW),
                                InfoItem(
                                    name: "Engine Manufacturer",
                                    info: vehicle.engineManufacturer),
                                InfoItem(
                                    name: "Engine Model",
                                    info: vehicle.engineModel),
                                InfoItem(
                                    name: "Entertainment System",
                                    info: vehicle.entertainmentSystem),
                                InfoItem(
                                    name: "Error Code",
                                    info: vehicle.errorCode),
                                InfoItem(
                                    name: "Error Text",
                                    info: vehicle.errorCode),
                                InfoItem(
                                    name: "Forward Collision Warning",
                                    info: vehicle.forwardCollisionWarning),
                                InfoItem(
                                    name: "Fuel Injection Type",
                                    info: vehicle.fuelInjectionType),
                                InfoItem(
                                    name: "Fuel Type (Primary)",
                                    info: vehicle.fuelTypePrimary),
                                InfoItem(
                                    name: "Fuel Type (Secondary)",
                                    info: vehicle.fuelTypeSecondary),
                                InfoItem(name: "GCWR", info: vehicle.gcwr),
                                InfoItem(name: "GVWR", info: vehicle.gvwr),
                                InfoItem(
                                    name: "Keyless Ignition",
                                    info: vehicle.keylessIgnition),
                                InfoItem(
                                    name: "Lane Centering Assist",
                                    info: vehicle.laneCenteringAssistance),
                                InfoItem(
                                    name: "Lane Departure Warning",
                                    info: vehicle.laneDepartureWarning),
                                InfoItem(
                                    name: "Lane Keep System",
                                    info: vehicle.laneKeepSystem),
                                InfoItem(
                                    name: "Lower Beam Headlight Source",
                                    info: vehicle.lowerBeamHeadlampLightSource),
                                InfoItem(name: "Make", info: vehicle.make),
                                InfoItem(name: "Make ID", info: vehicle.makeID),
                                InfoItem(
                                    name: "Manufacturer",
                                    info: vehicle.manufacturer),
                                InfoItem(
                                    name: "Manufacturer ID",
                                    info: vehicle.manufacturerId),
                                InfoItem(
                                    name: "Model Year",
                                    info: vehicle.modelYear),
                                InfoItem(
                                    name: "Motorcycle Chassis Type",
                                    info: vehicle.motorcycleChassisType),
                                InfoItem(
                                    name: "Motorcycle Suspension Type",
                                    info: vehicle.motorcycleSuspensionType),
                                InfoItem(
                                    name: "NCSA Body Type",
                                    info: vehicle.ncsaBodyType),
                                InfoItem(
                                    name: "NCSA Make", info: vehicle.ncsaMake),
                                InfoItem(
                                    name: "NCSA Model",
                                    info: vehicle.ncsaModel),
                                InfoItem(
                                    name: "NCSA Note", info: vehicle.ncsaNote),
                                InfoItem(
                                    name: "Non Land Use",
                                    info: vehicle.nonLandUse),
                                InfoItem(name: "Note", info: vehicle.note),
                                InfoItem(
                                    name: "Other Bus Info",
                                    info: vehicle.otherBusInfo),
                                InfoItem(
                                    name: "Other Engine Info",
                                    info: vehicle.otherEngineInfo),
                                InfoItem(
                                    name: "Other Motorcycle Info",
                                    info: vehicle.otherMotorcycleInfo),
                                InfoItem(
                                    name: "Other Restraint System Info",
                                    info: vehicle.otherRestraintSystemInfo),
                                InfoItem(
                                    name: "Other Trailer Info",
                                    info: vehicle.otherTrailerInfo),
                                InfoItem(
                                    name: "Park Assist",
                                    info: vehicle.parkAssist),
                                InfoItem(
                                    name:
                                        "Pedestrian Automatic Emergency Braking",
                                    info: vehicle
                                        .pedestrianAutomaticEmergencyBraking),
                                InfoItem(
                                    name: "Plant City",
                                    info: vehicle.plantCity),
                                InfoItem(
                                    name: "Plant Company Name",
                                    info: vehicle.plantCompanyName),
                                InfoItem(
                                    name: "Plant Country",
                                    info: vehicle.plantCountry),
                                InfoItem(
                                    name: "Park State",
                                    info: vehicle.plantState),
                                InfoItem(
                                    name: "Possible Value",
                                    info: vehicle.possibleValues),
                                InfoItem(
                                    name: "Pretensioner",
                                    info: vehicle.pretensioner),
                                InfoItem(
                                    name: "Rear Automatic Emergency Braking",
                                    info:
                                        vehicle.rearAutomaticEmergencyBraking),
                                InfoItem(
                                    name: "Rear Cross Traffic Alert",
                                    info: vehicle.rearCrossTrafficAlert),
                                InfoItem(
                                    name: "Rear Visability System",
                                    info: vehicle.rearVisibilitySystem),
                                InfoItem(
                                    name: "SAE Automation Level",
                                    info: vehicle.saeAutomationLevel),
                                InfoItem(
                                    name: "Seat Belts All",
                                    info: vehicle.pretensioner),
                                InfoItem(
                                    name: "Rear Automatic Emergency Breaking",
                                    info: vehicle.pretensioner),
                                InfoItem(
                                    name: "Seat Rows", info: vehicle.seatRows),
                                InfoItem(name: "Seats", info: vehicle.seats),
                                InfoItem(
                                    name:
                                        "Semi-Automatic Headlamp Beam Switching",
                                    info: vehicle
                                        .semiAutomaticHeadlampBeamSwitching),
                                InfoItem(name: "Series", info: vehicle.series),
                                InfoItem(
                                    name: "Series 2", info: vehicle.series2),
                                InfoItem(
                                    name: "Stearing Location",
                                    info: vehicle.steeringLocation),
                                InfoItem(name: "TPMS", info: vehicle.tpms),
                                InfoItem(
                                    name: "Top Speed (MPH)",
                                    info: vehicle.topSpeedMPH),
                                InfoItem(
                                    name: "Track Width",
                                    info: vehicle.trackWidth),
                                InfoItem(
                                    name: "Traction Control",
                                    info: vehicle.tractionControl),
                                InfoItem(
                                    name: "Trailer Body Type",
                                    info: vehicle.trailerBodyType),
                                InfoItem(
                                    name: "Trailer Length",
                                    info: vehicle.trailerLength),
                                InfoItem(
                                    name: "Trailer Type",
                                    info: vehicle.trailerType),
                                InfoItem(
                                    name: "Trainsmission Speeds",
                                    info: vehicle.transmissionSpeeds),
                                InfoItem(
                                    name: "Transmission Style",
                                    info: vehicle.transmissionStyle),
                                InfoItem(name: "Trim", info: vehicle.trim),
                                InfoItem(name: "Trim 2", info: vehicle.trim2),
                                InfoItem(name: "Turbo", info: vehicle.turbo),
                                InfoItem(
                                    name: "Valve Train Design",
                                    info: vehicle.valveTrainDesign),
                                InfoItem(
                                    name: "Vehicle Descriptor",
                                    info: vehicle.vehicleDescriptor),
                                InfoItem(
                                    name: "Vehicle Type",
                                    info: vehicle.vehicleType),
                                InfoItem(
                                    name: "Wheel Base Long",
                                    info: vehicle.wheelBaseLong),
                                InfoItem(
                                    name: "Wheel Base Short",
                                    info: vehicle.wheelBaseShort),
                                InfoItem(
                                    name: "Wheel Size Front",
                                    info: vehicle.wheelSizeFront),
                                InfoItem(
                                    name: "Wheel Size Rear",
                                    info: vehicle.wheelSizeRear),
                                InfoItem(name: "Wheels", info: vehicle.wheels),
                                InfoItem(
                                    name: "Windows", info: vehicle.windows),
                              ],
                            ),
                          ),
                        );
                      }
                      return SizedBox(
                        height: screenHeight * .87,
                        child:
                            const Center(child: CupertinoActivityIndicator()),
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
                                            _showVehicleDetailsDialog(context,
                                                screenWidth, screenHeight),
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
                                      as Map<String, dynamic>,
                                  snapshot.data!.docs[index].id);

                              return CupertinoListTile(
                                title: Text(repair.workRequested),
                                onTap: () {
                                  Navigator.pushNamed(context, "/repairDetails",
                                      arguments: {"repair": repair});
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
                          "Delete Vehicle",
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
