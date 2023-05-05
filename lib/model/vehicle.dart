import 'dart:convert';
import 'package:my_car_records/controllers/my_extensions.dart';
import 'package:my_car_records/model/db/repair.dart';
import 'package:my_car_records/model/repair.dart';

class Vehicle {
  int? id;
  String? abs;
  String? activeSafetySysNote;
  String? adaptiveCruiseControl;
  String? adaptiveDrivingBeam;
  String? adaptiveHeadlights;
  String? additionalErrorText;
  String? airBagLocCurtain;
  String? airBagLocFront;
  String? airBagLocKnee;
  String? airBagLocSeatCushion;
  String? airBagLocSide;
  String? autoReverseSystem;
  String? automaticPedestrianAlertingSound;
  String? axleConfiguration;
  String? axles;
  String? basePrice;
  String? batteryA;
  String? batteryATo;
  String? batteryCells;
  String? batteryInfo;
  String? batteryKWh;
  String? batteryKWhTo;
  String? batteryModules;
  String? batteryPacks;
  String? batteryType;
  String? batteryV;
  String? batteryVTo;
  String? bedLengthIN;
  String? bedType;
  String? blindSpotIntervention;
  String? blindSpotMon;
  String? bodyCabType;
  String? bodyClass;
  String? brakeSystemDesc;
  String? brakeSystemType;
  String? busFloorConfigType;
  String? busLength;
  String? busType;
  String? cib;
  String? cashForClunkers;
  String? chargerLevel;
  String? chargerPowerKW;
  String? coolingType;
  String? curbWeightLB;
  String? customMotorcycleType;
  String? daytimeRunningLight;
  String? destinationMarket;
  String? displacementCC;
  String? displacementCI;
  String? displacementL;
  String? doors;
  String? driveType;
  String? driverAssist;
  String? dynamicBrakeSupport;
  String? edr;
  String? esc;
  String? evDriveUnit;
  String? electrificationLevel;
  String? engineConfiguration;
  String? engineCycles;
  String? engineCylinders;
  String? engineHP;
  String? engineHPTo;
  String? engineKW;
  String? engineManufacturer;
  String? engineModel;
  String? entertainmentSystem;
  String? errorCode;
  String? errorText;
  String? forwardCollisionWarning;
  String? fuelInjectionType;
  String? fuelTypePrimary;
  String? fuelTypeSecondary;
  String? gcwr;
  String? gcwrTo;
  String? gvwr;
  String? gvwrTo;
  String? keylessIgnition;
  String? laneCenteringAssistance;
  String? laneDepartureWarning;
  String? laneKeepSystem;
  String? lowerBeamHeadlampLightSource;
  String make;
  String? makeID;
  String? manufacturer;
  String? manufacturerId;
  String model;
  String? modelID;
  int modelYear;
  String? motorcycleChassisType;
  String? motorcycleSuspensionType;
  String? ncsaBodyType;
  String? ncsaMake;
  String? ncsaMapExcApprovedBy;
  String? ncsaMapExcApprovedOn;
  String? ncsaMappingException;
  String? ncsaModel;
  String? ncsaNote;
  String? nonLandUse;
  String? note;
  String? otherBusInfo;
  String? otherEngineInfo;
  String? otherMotorcycleInfo;
  String? otherRestraintSystemInfo;
  String? otherTrailerInfo;
  String? owner;
  String? parkAssist;
  String? pedestrianAutomaticEmergencyBraking;
  String? plantCity;
  String? plantCompanyName;
  String? plantCountry;
  String? plantState;
  String? possibleValues;
  String? pretensioner;
  String? rearAutomaticEmergencyBraking;
  String? rearCrossTrafficAlert;
  String? rearVisibilitySystem;
  String? saeAutomationLevel;
  String? saeAutomationLevelTo;
  String? seatBeltsAll;
  String? seatRows;
  String? seats;
  String? semiAutomaticHeadlampBeamSwitching;
  String? series;
  String? series2;
  String? steeringLocation;
  String? suggestedVIN;
  String? tpms;
  String? topSpeedMPH;
  String? trackWidth;
  String? tractionControl;
  String? trailerBodyType;
  String? trailerLength;
  String? trailerType;
  String? transmissionSpeeds;
  String? transmissionStyle;
  String? trim;
  String? trim2;
  String? turbo;
  String? vin;
  String? valveTrainDesign;
  String? vehicleDescriptor;
  String? vehicleType;
  String? wheelBaseLong;
  String? wheelBaseShort;
  String? wheelBaseType;
  String? wheelSizeFront;
  String? wheelSizeRear;
  String? wheels;
  String? windows;
  List<Repair>? repairList;

  Vehicle({
    this.id,
    this.abs,
    this.activeSafetySysNote,
    this.adaptiveCruiseControl,
    this.adaptiveDrivingBeam,
    this.adaptiveHeadlights,
    this.additionalErrorText,
    this.airBagLocCurtain,
    this.airBagLocFront,
    this.airBagLocKnee,
    this.airBagLocSeatCushion,
    this.airBagLocSide,
    this.autoReverseSystem,
    this.automaticPedestrianAlertingSound,
    this.axleConfiguration,
    this.axles,
    this.basePrice,
    this.batteryA,
    this.batteryATo,
    this.batteryCells,
    this.batteryInfo,
    this.batteryKWh,
    this.batteryKWhTo,
    this.batteryModules,
    this.batteryPacks,
    this.batteryType,
    this.batteryV,
    this.batteryVTo,
    this.bedLengthIN,
    this.bedType,
    this.blindSpotIntervention,
    this.blindSpotMon,
    this.bodyCabType,
    this.bodyClass,
    this.brakeSystemDesc,
    this.brakeSystemType,
    this.busFloorConfigType,
    this.busLength,
    this.busType,
    this.cib,
    this.cashForClunkers,
    this.chargerLevel,
    this.chargerPowerKW,
    this.coolingType,
    this.curbWeightLB,
    this.customMotorcycleType,
    this.daytimeRunningLight,
    this.destinationMarket,
    this.displacementCC,
    this.displacementCI,
    this.displacementL,
    this.doors,
    this.driveType,
    this.driverAssist,
    this.dynamicBrakeSupport,
    this.edr,
    this.esc,
    this.evDriveUnit,
    this.electrificationLevel,
    this.engineConfiguration,
    this.engineCycles,
    this.engineCylinders,
    this.engineHP,
    this.engineHPTo,
    this.engineKW,
    this.engineManufacturer,
    this.engineModel,
    this.entertainmentSystem,
    this.errorCode,
    this.errorText,
    this.forwardCollisionWarning,
    this.fuelInjectionType,
    this.fuelTypePrimary,
    this.fuelTypeSecondary,
    this.gcwr,
    this.gcwrTo,
    this.gvwr,
    this.gvwrTo,
    this.keylessIgnition,
    this.laneCenteringAssistance,
    this.laneDepartureWarning,
    this.laneKeepSystem,
    this.lowerBeamHeadlampLightSource,
    required this.make,
    this.makeID,
    this.manufacturer,
    this.manufacturerId,
    required this.model,
    this.modelID,
    required this.modelYear,
    this.motorcycleChassisType,
    this.motorcycleSuspensionType,
    this.ncsaBodyType,
    this.ncsaMake,
    this.ncsaMapExcApprovedBy,
    this.ncsaMapExcApprovedOn,
    this.ncsaMappingException,
    this.ncsaModel,
    this.ncsaNote,
    this.nonLandUse,
    this.note,
    this.otherBusInfo,
    this.otherEngineInfo,
    this.otherMotorcycleInfo,
    this.otherRestraintSystemInfo,
    this.otherTrailerInfo,
    this.owner,
    this.parkAssist,
    this.pedestrianAutomaticEmergencyBraking,
    this.plantCity,
    this.plantCompanyName,
    this.plantCountry,
    this.plantState,
    this.possibleValues,
    this.pretensioner,
    this.rearAutomaticEmergencyBraking,
    this.rearCrossTrafficAlert,
    this.rearVisibilitySystem,
    this.saeAutomationLevel,
    this.saeAutomationLevelTo,
    this.seatBeltsAll,
    this.seatRows,
    this.seats,
    this.semiAutomaticHeadlampBeamSwitching,
    this.series,
    this.series2,
    this.steeringLocation,
    this.suggestedVIN,
    this.tpms,
    this.topSpeedMPH,
    this.trackWidth,
    this.tractionControl,
    this.trailerBodyType,
    this.trailerLength,
    this.trailerType,
    this.transmissionSpeeds,
    this.transmissionStyle,
    this.trim,
    this.trim2,
    this.turbo,
    this.vin,
    this.valveTrainDesign,
    this.vehicleDescriptor,
    this.vehicleType,
    this.wheelBaseLong,
    this.wheelBaseShort,
    this.wheelBaseType,
    this.wheelSizeFront,
    this.wheelSizeRear,
    this.wheels,
    this.windows,
    this.repairList,
  }) {
    // if (firestore != null) {
    //   getRepairs(firestore);
    // }
  }

  static Vehicle fromJson(
    Map<String, dynamic> json,
  ) {
    return Vehicle(
      id: int.tryParse(json["id"].toString()),
      abs: json["ABS"] ?? "N/A",
      activeSafetySysNote: json["ActiveSafetySysNote"] ?? "N/A",
      adaptiveCruiseControl: json["AdaptiveCruiseControl"] ?? "N/A",
      adaptiveDrivingBeam: json["AdaptiveDrivingBeam"] ?? "N/A",
      adaptiveHeadlights: json["AdaptiveHeadlights"] ?? "N/A",
      additionalErrorText: json["AdditionalErrorText"] ?? "N/A",
      airBagLocCurtain: json["AirBagLocCurtain"] ?? "N/A",
      airBagLocFront: json["AirBagLocFront"] ?? "N/A",
      airBagLocKnee: json["AirBagLocKnee"] ?? "N/A",
      airBagLocSeatCushion: json["AirBagLocSeatCushion"] ?? "N/A",
      airBagLocSide: json["AirBagLocSide"] ?? "N/A",
      autoReverseSystem: json["AutoReverseSystem"] ?? "N/A",
      automaticPedestrianAlertingSound:
          json["AutomaticPedestrianAlertingSound"] ?? "N/A",
      axleConfiguration: json["AxleConfiguration"] ?? "N/A",
      axles: json["Axles"] ?? "N/A",
      basePrice: json["BasePrice"] ?? "N/A",
      batteryA: json["BatteryA"] ?? "N/A",
      batteryATo: json["BatteryA_to"] ?? "N/A",
      batteryCells: json["BatteryCells"] ?? "N/A",
      batteryInfo: json["BatteryInfo"] ?? "N/A",
      batteryKWh: json["BatteryKWh"] ?? "N/A",
      batteryKWhTo: json["BatteryKWh_to"] ?? "N/A",
      batteryModules: json["BatteryModules"] ?? "N/A",
      batteryPacks: json["BatteryPacks"] ?? "N/A",
      batteryType: json["BatteryType"] ?? "N/A",
      batteryV: json["BatteryV"] ?? "N/A",
      batteryVTo: json["BatteryV_to"] ?? "N/A",
      bedLengthIN: json["BedLengthIN"] ?? "N/A",
      bedType: json["BedType"] ?? "N/A",
      blindSpotIntervention: json["BlindSpotIntervention"] ?? "N/A",
      blindSpotMon: json["BlindSpotMon"] ?? "N/A",
      bodyCabType: json["BodyCabType"] ?? "N/A",
      bodyClass: json["BodyClass"] ?? "N/A",
      brakeSystemDesc: json["BrakeSystemDesc"] ?? "N/A",
      brakeSystemType: json["BrakeSystemType"] ?? "N/A",
      busFloorConfigType: json["BusFloorConfigType"] ?? "N/A",
      busLength: json["BusLength"] ?? "N/A",
      busType: json["BusType"] ?? "N/A",
      cib: json["CIB"] ?? "N/A",
      cashForClunkers: json["CashForClunkers"] ?? "N/A",
      chargerLevel: json["ChargerLevel"] ?? "N/A",
      chargerPowerKW: json["ChargerPowerKW"] ?? "N/A",
      coolingType: json["CoolingType"] ?? "N/A",
      curbWeightLB: json["CurbWeightLB"] ?? "N/A",
      customMotorcycleType: json["CustomMotorcycleType"] ?? "N/A",
      daytimeRunningLight: json["DaytimeRunningLight"] ?? "N/A",
      destinationMarket: json["DestinationMarket"] ?? "N/A",
      displacementCC: json["DisplacementCC"] ?? "N/A",
      displacementCI: json["DisplacementCI"] ?? "N/A",
      displacementL: json["DisplacementL"] ?? 'N/A',
      doors: json["Doors"] ?? "N/A",
      driveType: json["DriveType"] ?? "N/A",
      driverAssist: json["DriverAssist"] ?? "N/A",
      dynamicBrakeSupport: json["DynamicBrakeSupport"] ?? "N/A",
      edr: json["EDR"] ?? "N/A",
      esc: json["ESC"] ?? "N/A",
      evDriveUnit: json["EVDriveUnit"] ?? "N/A",
      electrificationLevel: json["ElectrificationLevel"] ?? "N/A",
      engineConfiguration: json["EngineConfiguration"] ?? "N/A",
      engineCycles: json["EngineCycles"] ?? "N/A",
      engineCylinders: json["EngineCylinders"] ?? "N/A",
      engineHP: json["EngineHP"] ?? "N/A",
      engineHPTo: json["EngineHP_to"] ?? "N/A",
      engineKW: json["EngineKW"] ?? "N/A",
      engineManufacturer: json["EngineManufacturer"] ?? "N/A",
      engineModel: json["EngineModel"] ?? "N/A",
      entertainmentSystem: json["EntertainmentSystem"] ?? "N/A",
      errorCode: json["ErrorCode"] ?? "N/A",
      errorText: json["ErrorText"] ?? "N/A",
      forwardCollisionWarning: json["ForwardCollisionWarning"] ?? "N/A",
      fuelInjectionType: json["FuelInjectionType"] ?? "N/A",
      fuelTypePrimary: json["FuelTypePrimary"] ?? "N/A",
      fuelTypeSecondary: json["FuelTypeSecondary"] ?? "N/A",
      gcwr: json["GCWR"] ?? "N/A",
      gcwrTo: json["GCWR_to"] ?? "N/A",
      gvwr: json["GVWR"] ?? "N/A",
      gvwrTo: json["GVWR_to"] ?? "N/A",
      keylessIgnition: json["KeylessIgnition"] ?? "N/A",
      laneCenteringAssistance: json["LaneCenteringAssistance"] ?? "N/A",
      laneDepartureWarning: json["LaneDepartureWarning"] ?? "N/A",
      laneKeepSystem: json["LaneKeepSystem"] ?? "N/A",
      lowerBeamHeadlampLightSource:
          json["LowerBeamHeadlampLightSource"] ?? "N/A",
      make: capitalize(json["Make"]),
      makeID: json["MakeID"] ?? "N/A",
      manufacturer: json["Manufacturer"] ?? "N/A",
      manufacturerId: json["ManufacturerId"] ?? "N/A",
      model: json["Model"],
      modelID: json["ModelID"] ?? "N/A",
      modelYear: int.parse(json["ModelYear"].toString()),
      motorcycleChassisType: json["MotorcycleChassisType"] ?? "N/A",
      motorcycleSuspensionType: json["MotorcycleSuspensionType"] ?? "N/A",
      ncsaBodyType: json["NCSABodyType"] ?? "N/A",
      ncsaMake: json["NCSAMake"] ?? "N/A",
      ncsaMapExcApprovedBy: json["NCSAMapExcApprovedBy"] ?? "N/A",
      ncsaMapExcApprovedOn: json["NCSAMapExcApprovedOn"] ?? "N/A",
      ncsaMappingException: json["NCSAMappingException"] ?? "N/A",
      ncsaModel: json["NCSAModel"] ?? "N/A",
      ncsaNote: json["NCSANote"] ?? "N/A",
      nonLandUse: json["NonLandUse"] ?? "N/A",
      note: json["Note"] ?? "N/A",
      otherBusInfo: json["OtherBusInfo"] ?? "N/A",
      otherEngineInfo: json["OtherEngineInfo"] ?? "N/A",
      otherMotorcycleInfo: json["OtherMotorcycleInfo"] ?? "N/A",
      otherRestraintSystemInfo: json["OtherRestraintSystemInfo"] ?? "N/A",
      otherTrailerInfo: json["OtherTrailerInfo"] ?? "N/A",
      owner: json["owner"] ?? "N'A",
      parkAssist: json["ParkAssist"] ?? "N/A",
      pedestrianAutomaticEmergencyBraking:
          json["PedestrianAutomaticEmergencyBraking"] ?? "N/A",
      plantCity: json["PlantCity"] ?? "N/A",
      plantCompanyName: json["PlantCompanyName"] ?? "N/A",
      plantCountry: json["PlantCountry"] ?? "N/A",
      plantState: json["PlantState"] ?? "N/A",
      possibleValues: json["PossibleValues"] ?? "N/A",
      pretensioner: json["Pretensioner"] ?? "N/A",
      rearAutomaticEmergencyBraking:
          json["RearAutomaticEmergencyBraking"] ?? "N/A",
      rearCrossTrafficAlert: json["RearCrossTrafficAlert"] ?? "N/A",
      rearVisibilitySystem: json["RearVisibilitySystem"] ?? "N/A",
      saeAutomationLevel: json["SAEAutomationLevel"] ?? "N/A",
      saeAutomationLevelTo: "N/A",
      seatBeltsAll: json["SeatBeltsAll"] ?? "N/A",
      seatRows: json["SeatRows"] ?? "N/A",
      seats: json["Seats"] ?? "N/A",
      semiAutomaticHeadlampBeamSwitching:
          json["SemiautomaticHeadlampBeamSwitching"] ?? "N/A",
      series: json["Series"] ?? "N/A",
      series2: json["Series2"] ?? "N/A",
      steeringLocation: json["SteeringLocation"] ?? "N/A",
      suggestedVIN: json["SuggestedVIN"] ?? "N/A",
      tpms: json["TPMS"] ?? "N/A",
      topSpeedMPH: json["TopSpeedMPH"] ?? "N/A",
      trackWidth: json["TrackWidth"] ?? "N/A",
      tractionControl: json["TractionControl"] ?? "N/A",
      trailerBodyType: json["TrailerBodyType"] ?? "N/A",
      trailerLength: json["TrailerLength"] ?? "N/A",
      trailerType: json["TrailerType"] ?? "N/A",
      transmissionSpeeds: json["TransmissionSpeeds"] ?? "N/A",
      transmissionStyle: json["TransmissionStyle"] ?? "N/A",
      trim: json["Trim"] ?? "N/A",
      trim2: json["Trim2"] ?? "N/A",
      turbo: json["Turbo"] ?? "N/A",
      vin: json["VIN"] ?? "N/A",
      valveTrainDesign: json["ValveTrainDesign"] ?? "N/A",
      vehicleDescriptor: json["VehicleDescriptor"] ?? "N/A",
      vehicleType: json["VehicleType"] ?? "N/A",
      wheelBaseLong: json["WheelBaseLong"] ?? "N/A",
      wheelBaseShort: json["WheelBaseShort"] ?? "N/A",
      wheelBaseType: json["WheelBaseType"] ?? "N/A",
      wheelSizeFront: json["WheelSizeFront"] ?? "N/A",
      wheelSizeRear: json["WheelSizeRear"] ?? "N/A",
      wheels: json["Wheels"] ?? "N/A",
      windows: json["Windows"] ?? "N/A",
    );
  }

  Vehicle fromString(String carInfo) {
    Map<String, dynamic> info = jsonDecode(carInfo);
    return fromJson(info);
  }

  @override
  String toString() {
    return '{"ABS": $abs,"ActiveSafetySysNote": $activeSafetySysNote,"AdaptiveCruiseControl":$adaptiveCruiseControl,"AdaptiveDrivingBeam": $adaptiveDrivingBeam, "AdaptiveHeadlights": $adaptiveHeadlights, "AdditionalErrorText": $additionalErrorText, "AirBagLocCurtain": $airBagLocCurtain, "AirBagLocFront": $airBagLocFront, "AirBagLocKnee": $airBagLocKnee, "AirBagLocSeatCushion": $airBagLocSeatCushion,"AirBagLocSide": $airBagLocSide,"AutoReverseSystem": ,"AutomaticPedestrianAlertingSound": $automaticPedestrianAlertingSound, "AxleConfiguration": $axleConfiguration, "Axles": $axles,"BasePrice": $basePrice, "BatteryA": $batteryA,"BatteryA_to": $batteryATo,"BatteryCells": $batteryCells,"BatteryInfo": $batteryInfo,"BatteryKWh": $batteryKWh,"BatteryKWh_to": $batteryKWhTo,"BatteryModules": $batteryModules,"BatteryPacks": $batteryPacks,"BatteryType": $batteryType,"BatteryV": $batteryV, "BatteryV_to": $batteryV,"BedLengthIN": $bedLengthIN, "BedType": $bedType,"BlindSpotIntervention": $blindSpotIntervention,"BlindSpotMon": $blindSpotMon,"BodyCabType": $bodyCabType, "BodyClass": $bodyClass, "BrakeSystemDesc": $brakeSystemDesc,"BrakeSystemType": $brakeSystemType, "BusFloorConfigType": $busFloorConfigType,"BusLength": $busLength, "BusType": $busType, "CIB": $cib,"CashForClunkers": $cashForClunkers, "ChargerLevel": $chargerLevel,"ChargerPowerKW": $chargerPowerKW, "CoolingType": $coolingType, "CurbWeightLB": $curbWeightLB, "CustomMotorcycleType": $customMotorcycleType, "DaytimeRunningLight": $daytimeRunningLight, "DestinationMarket": $destinationMarket, "DisplacementCC": $displacementCC, "DisplacementCI": $displacementCI, "DisplacementL": $displacementL, "Doors": $doors,"DriveType": $driveType, "DriverAssist": $driverAssist,"DynamicBrakeSupport": $dynamicBrakeSupport, "EDR": $edr,"ESC": $esc, "EVDriveUnit": $evDriveUnit, "ElectrificationLevel": $electrificationLevel, "EngineConfiguration": $engineConfiguration, "EngineCycles": $engineCycles, "EngineCylinders": $engineCycles,"EngineHP": $engineHP, "EngineHP_to": $engineHPTo,"EngineKW": $engineKW, "EngineManufacturer": $engineManufacturer, "EngineModel": $engineModel, "EntertainmentSystem": $entertainmentSystem,"ErrorCode": $errorCode, "ErrorText": $errorText,"ForwardCollisionWarning": $forwardCollisionWarning, "FuelInjectionType": $fuelInjectionType,"FuelTypePrimary": $fuelTypePrimary, "FuelTypeSecondary": $fuelTypeSecondary,"GCWR": $gcwr, "GCWR_to": $gcwrTo, "GVWR": $gvwr, "GVWR_to": $gvwrTo, "KeylessIgnition": $keylessIgnition, "LaneCenteringAssistance": $laneCenteringAssistance, "LaneDepartureWarning": $laneDepartureWarning, "LaneKeepSystem": $laneKeepSystem,  "LowerBeamHeadlampLightSource": $lowerBeamHeadlampLightSource, "Make": $make, "MakeID": $makeID, "Manufacturer": $manufacturer,"ManufacturerId": $manufacturerId, "Model":$model,"ModelID": $modelID, "ModelYear": $modelYear,"MotorcycleChassisType": $motorcycleChassisType, "MotorcycleSuspensionType": $motorcycleSuspensionType,"NCSABodyType": $ncsaBodyType, "NCSAMake": $ncsaMake, "NCSAMapExcApprovedBy": $ncsaMapExcApprovedBy, "NCSAMapExcApprovedOn": $ncsaMapExcApprovedOn, "NCSAMappingException": $ncsaMappingException, "NCSAModel": "$ncsaModel,"NCSANote": $ncsaNote, "NonLandUse": $nonLandUse, "Note": $note, "OtherBusInfo": $otherBusInfo, "OtherEngineInfo": $otherEngineInfo,"OtherMotorcycleInfo": $otherMotorcycleInfo, "OtherRestraintSystemInfo": $otherRestraintSystemInfo, "OtherTrailerInfo": $otherTrailerInfo,  "ParkAssist": $parkAssist, "PedestrianAutomaticEmergencyBraking": $pedestrianAutomaticEmergencyBraking, "PlantCity": $plantCity, "PlantCompanyName": $plantCompanyName, "PlantCountry": $plantCountry, "PlantState": $plantState, "PossibleValues": $possibleValues, "Pretensioner": $pretensioner, "RearAutomaticEmergencyBraking": $rearAutomaticEmergencyBraking, "RearCrossTrafficAlert": $rearCrossTrafficAlert,"RearVisibilitySystem": $rearVisibilitySystem,"SAEAutomationLevel": $saeAutomationLevel, "SAEAutomationLevel_to": $saeAutomationLevelTo, "SeatBeltsAll": $seatBeltsAll, "SeatRows": $seatRows, "Seats":$seats, "SemiautomaticHeadlampBeamSwitching": $semiAutomaticHeadlampBeamSwitching, "Series": $series, "Series2": $series2, "SteeringLocation": $steeringLocation, "SuggestedVIN": $suggestedVIN, "TPMS": $tpms, "TopSpeedMPH": $topSpeedMPH, "TrackWidth": $trackWidth, "TractionControl":$tractionControl, "TrailerBodyType": $trailerBodyType, "TrailerLength": $trailerLength, "TrailerType": $trailerType, "TransmissionSpeeds": $transmissionSpeeds, "TransmissionStyle": $transmissionStyle, "Trim": $trim, "Trim2": $trim2, "Turbo": $turbo, "VIN": $vin, "ValveTrainDesign": $valveTrainDesign, "VehicleDescriptor": $vehicleDescriptor, "VehicleType": $vehicleType, "WheelBaseLong": $wheelBaseLong, "WheelBaseShort": $wheelBaseShort,"WheelBaseType": $wheelBaseType, "WheelSizeFront": $wheelSizeFront, "WheelSizeRear": $wheelSizeRear, "Wheels": $wheels, "Windows": $windows }';
  }

  /// TODO: convert to use my backend
  Future<List<Repair>> getRepairs() async {
    return await DBRepair.getAll(id!);
  }
}
