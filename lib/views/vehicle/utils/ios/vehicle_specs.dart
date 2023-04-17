import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_car_records/model/vehicle.dart';
import 'package:my_car_records/views/utls/info_item.dart';

class VehicleSpecs extends StatelessWidget {
  const VehicleSpecs({super.key, required this.vehicle});
  final Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    List<String> bodyClassList = [];
    String bodyClass = "";

    vehicle.bodyClass!.contains("(SUV)") ? bodyClassList.add("SUV") : null;
    vehicle.bodyClass!.contains("(MPV)") ? bodyClassList.add("MPV") : null;
    bodyClass = vehicle.bodyClass!;
    if (bodyClassList.isNotEmpty) {
      bodyClass = bodyClassList.join(" / ");
    }
    // vehicle.bodyClass
    return Scrollbar(
      child: Container(
        color: CupertinoColors.systemGroupedBackground,
        child: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoListSection.insetGrouped(
                  dividerMargin: -10,
                  header: const Text(
                    "General",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  children: [
                    InfoItem(name: "Base Price", info: vehicle.basePrice),
                    InfoItem(name: "Body Cab Type", info: vehicle.bodyCabType),
                    InfoItem(name: "Body Class", info: bodyClass),
                    InfoItem(
                        name: "Curb Weight (lbs)", info: vehicle.curbWeightLB),
                    InfoItem(
                        name: "Destination Market",
                        info: vehicle.destinationMarket),
                    InfoItem(name: "Doors", info: vehicle.doors),
                    InfoItem(name: "Drive Type", info: vehicle.driveType),
                    InfoItem(
                        name: "Electrification Level",
                        info: vehicle.electrificationLevel),
                    InfoItem(
                        name: "Entertainment System",
                        info: vehicle.entertainmentSystem),
                    InfoItem(
                        name: "Fuel Type (Primary)",
                        info: vehicle.fuelTypePrimary),
                    InfoItem(
                        name: "Fuel Type (Secondary)",
                        info: vehicle.fuelTypeSecondary),
                    InfoItem(name: "GCWR", info: vehicle.gcwr),
                    InfoItem(name: "GVWR", info: vehicle.gvwr),
                    InfoItem(name: "Horsepower", info: vehicle.engineHP),
                    InfoItem(
                        name: "Keyless Ignition",
                        info: vehicle.keylessIgnition),
                    InfoItem(name: "Make", info: vehicle.make),
                    InfoItem(name: "Make ID", info: vehicle.makeID),
                    InfoItem(name: "Manufacturer", info: vehicle.manufacturer),
                    InfoItem(
                        name: "Manufacturer ID", info: vehicle.manufacturerId),
                    InfoItem(
                        name: "Model Year", info: vehicle.modelYear.toString()),
                    InfoItem(name: "Plant City", info: vehicle.plantCity),
                    InfoItem(
                        name: "Plant Company Name",
                        info: vehicle.plantCompanyName),
                    InfoItem(name: "Plant Country", info: vehicle.plantCountry),
                    InfoItem(name: "Park State", info: vehicle.plantState),
                    InfoItem(name: "Trim", info: vehicle.trim),
                    InfoItem(name: "Trim 2", info: vehicle.trim2),
                    InfoItem(
                        name: "Top Speed (MPH)", info: vehicle.topSpeedMPH),
                    InfoItem(name: "Series", info: vehicle.series),
                    InfoItem(name: "Series 2", info: vehicle.series2),
                    InfoItem(name: "TPMS", info: vehicle.tpms),
                    InfoItem(
                        name: "Valve Train Design",
                        info: vehicle.valveTrainDesign),
                    InfoItem(
                        name: "Vehicle Descriptor",
                        info: vehicle.vehicleDescriptor),
                    InfoItem(
                        name: "Wheel Size Front", info: vehicle.wheelSizeFront),
                    InfoItem(
                        name: "Wheel Size Rear", info: vehicle.wheelSizeRear),
                    InfoItem(name: "Wheels", info: vehicle.wheels),
                    InfoItem(name: "Windows", info: vehicle.windows),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  dividerMargin: -10,
                  header: const Text(
                    "Engine",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  children: [
                    InfoItem(name: "Cooling Type", info: vehicle.coolingType),
                    InfoItem(
                        name: "Displacement (CC)",
                        info: vehicle.displacementCC),
                    InfoItem(
                        name: "Displacement (CI)",
                        info: vehicle.displacementCI),
                    InfoItem(
                        name: "Displacement (L)", info: vehicle.displacementL),
                    InfoItem(
                        name: "Configuration",
                        info: vehicle.engineConfiguration),
                    InfoItem(name: "Cycles", info: vehicle.engineConfiguration),
                    InfoItem(name: "Cylinders", info: vehicle.engineCylinders),
                    InfoItem(name: "KW", info: vehicle.engineKW),
                    InfoItem(
                        name: "Manufacturer", info: vehicle.engineManufacturer),
                    InfoItem(name: "Model", info: vehicle.engineModel),
                    InfoItem(name: "Turbo", info: vehicle.turbo),
                    InfoItem(
                        name: "Fuel Injection Type",
                        info: vehicle.fuelInjectionType),
                    InfoItem(
                        name: "Other Engine Info",
                        info: vehicle.otherEngineInfo),
                    InfoItem(
                        name: "Trainsmission Speeds",
                        info: vehicle.transmissionSpeeds),
                    InfoItem(
                        name: "Transmission Style",
                        info: vehicle.transmissionStyle),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  dividerMargin: -10,
                  header: const Text(
                    "Battery",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  children: [
                    InfoItem(name: "Battery Amps", info: vehicle.batteryA),
                    InfoItem(name: "Battery Cells", info: vehicle.batteryCells),
                    InfoItem(name: "Battery Info", info: vehicle.batteryInfo),
                    InfoItem(name: "Battery KWh", info: vehicle.batteryKWh),
                    InfoItem(
                        name: "Battery Modules", info: vehicle.batteryModules),
                    InfoItem(name: "Battery Packs", info: vehicle.batteryPacks),
                    InfoItem(name: "Battery Type", info: vehicle.batteryType),
                    InfoItem(name: "Battery Volts", info: vehicle.batteryV),
                    InfoItem(name: "Charger Level", info: vehicle.chargerLevel),
                    InfoItem(
                        name: "Charger Power (KW)",
                        info: vehicle.chargerPowerKW),
                    InfoItem(name: "EV Drive Unit", info: vehicle.evDriveUnit),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  dividerMargin: -10,
                  header: const Text(
                    "Safety",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  children: [
                    InfoItem(
                      name: "ABS",
                      info: vehicle.abs,
                    ),
                    InfoItem(
                      name: "Active Safety System Notes",
                      info: vehicle.activeSafetySysNote,
                    ),
                    InfoItem(
                      name: "Adaptive Cruise Control",
                      info: vehicle.adaptiveCruiseControl,
                    ),
                    InfoItem(
                      name: "Adaptive Driving Beam",
                      info: vehicle.adaptiveDrivingBeam,
                    ),
                    InfoItem(
                        name: "Curtain Airbag Location",
                        info: vehicle.airBagLocCurtain),
                    InfoItem(
                        name: "Airbag Location Front",
                        info: vehicle.airBagLocFront),
                    InfoItem(
                        name: "Airbag Location Knee",
                        info: vehicle.airBagLocKnee),
                    InfoItem(
                        name: "Airbag Location Cushion",
                        info: vehicle.airBagLocSeatCushion),
                    InfoItem(
                        name: "Airbag Location Side",
                        info: vehicle.airBagLocSide),
                    InfoItem(
                        name: "Auto Reverse System",
                        info: vehicle.autoReverseSystem),
                    InfoItem(
                        name: "Auto Reverse System",
                        info: vehicle.autoReverseSystem),
                    InfoItem(
                        name: "Automatic Padestrian Alerting Sound",
                        info: vehicle.automaticPedestrianAlertingSound),
                    InfoItem(
                        name: "Blind Spot Intervention",
                        info: vehicle.blindSpotIntervention),
                    InfoItem(
                        name: "Blind Spot Monitoring",
                        info: vehicle.blindSpotMon),
                    InfoItem(
                        name: "Rear Automatic Emergency Braking",
                        info: vehicle.rearAutomaticEmergencyBraking),
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
                        name: "Seat Belts All", info: vehicle.pretensioner),
                    InfoItem(
                        name: "Rear Automatic Emergency Braking",
                        info: vehicle.pretensioner),
                    InfoItem(name: "Seat Rows", info: vehicle.seatRows),
                    InfoItem(name: "Seats", info: vehicle.seats),
                    InfoItem(
                        name: "Semi-Automatic Headlamp Beam Switching",
                        info: vehicle.semiAutomaticHeadlampBeamSwitching),
                    InfoItem(
                        name: "Daytime Running Light",
                        info: vehicle.daytimeRunningLight),
                    InfoItem(name: "Driver Assist", info: vehicle.driverAssist),
                    InfoItem(
                        name: "Dynamic Brake Support",
                        info: vehicle.dynamicBrakeSupport),
                    InfoItem(
                        name: "Forward Collision Warning",
                        info: vehicle.forwardCollisionWarning),
                    InfoItem(
                        name: "Lane Centering Assist",
                        info: vehicle.laneCenteringAssistance),
                    InfoItem(
                        name: "Lane Departure Warning",
                        info: vehicle.laneDepartureWarning),
                    InfoItem(
                        name: "Lane Keep System", info: vehicle.laneKeepSystem),
                    InfoItem(
                        name: "Lower Beam Headlight Source",
                        info: vehicle.lowerBeamHeadlampLightSource),
                    InfoItem(name: "Park Assist", info: vehicle.parkAssist),
                    InfoItem(
                        name: "Pedestrian Automatic Emergency Braking",
                        info: vehicle.pedestrianAutomaticEmergencyBraking),
                    InfoItem(name: "Pretensioner", info: vehicle.pretensioner),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  dividerMargin: -10,
                  header: const Text(
                    "Brakes",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  children: [
                    InfoItem(
                        name: "Brake System Description",
                        info: vehicle.brakeSystemDesc),
                    InfoItem(
                        name: "Brake System Type",
                        info: vehicle.brakeSystemType),
                  ],
                ),
                CupertinoListSection.insetGrouped(
                  dividerMargin: -10,
                  header: const Text(
                    "Other",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueGrey),
                  ),
                  children: [
                    InfoItem(
                        name: "Axle Configuration",
                        info: vehicle.axleConfiguration),
                    InfoItem(name: "Axle", info: vehicle.axles),
                    InfoItem(
                        name: "Bed Length (in)", info: vehicle.bedLengthIN),
                    InfoItem(name: "Bed Type", info: vehicle.bedType),
                    InfoItem(
                        name: "Bus Floor Configuration Type",
                        info: vehicle.busFloorConfigType),
                    InfoItem(name: "Bus Length (ft)", info: vehicle.busLength),
                    InfoItem(name: "Bus Type", info: vehicle.busType),
                    InfoItem(name: "CIB", info: vehicle.cib),
                    InfoItem(
                        name: "Cach for Clunkers",
                        info: vehicle.cashForClunkers),
                    InfoItem(
                        name: "Custom Motorcycle Type",
                        info: vehicle.customMotorcycleType),
                    InfoItem(name: "EDR", info: vehicle.edr),
                    InfoItem(name: "ECS", info: vehicle.esc),
                    InfoItem(name: "Error Code", info: vehicle.errorCode),
                    InfoItem(name: "Error Text", info: vehicle.errorCode),
                    InfoItem(
                        name: "Motorcycle Chassis Type",
                        info: vehicle.motorcycleChassisType),
                    InfoItem(
                        name: "Motorcycle Suspension Type",
                        info: vehicle.motorcycleSuspensionType),
                    InfoItem(
                        name: "NCSA Body Type", info: vehicle.ncsaBodyType),
                    InfoItem(name: "NCSA Make", info: vehicle.ncsaMake),
                    InfoItem(name: "NCSA Model", info: vehicle.ncsaModel),
                    InfoItem(name: "NCSA Note", info: vehicle.ncsaNote),
                    InfoItem(name: "Non Land Use", info: vehicle.nonLandUse),
                    InfoItem(name: "Note", info: vehicle.note),
                    InfoItem(
                        name: "Other Bus Info", info: vehicle.otherBusInfo),
                    InfoItem(
                        name: "Other Motorcycle Info",
                        info: vehicle.otherMotorcycleInfo),
                    InfoItem(
                        name: "Other Restraint System",
                        info: vehicle.otherRestraintSystemInfo),
                    InfoItem(
                        name: "Other Trailer Info",
                        info: vehicle.otherTrailerInfo),
                    InfoItem(
                        name: "Wheel Base Long", info: vehicle.wheelBaseLong),
                    InfoItem(
                        name: "Wheel Base Short", info: vehicle.wheelBaseShort),

                    InfoItem(
                        name: "Possible Value", info: vehicle.possibleValues),

                    //
                    InfoItem(name: "Track Width", info: vehicle.trackWidth),
                    InfoItem(
                        name: "Traction Control",
                        info: vehicle.tractionControl),
                    InfoItem(
                        name: "Trailer Body Type",
                        info: vehicle.trailerBodyType),
                    InfoItem(
                        name: "Trailer Length", info: vehicle.trailerLength),
                    InfoItem(name: "Trailer Type", info: vehicle.trailerType),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
