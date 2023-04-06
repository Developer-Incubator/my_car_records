import 'dart:convert';

class Vehicle {
  String? id;
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
  String? make;
  String? makeID;
  String? manufacturer;
  String? manufacturerId;
  String? model;
  String? modelID;
  String? modelYear;
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
    this.make,
    this.makeID,
    this.manufacturer,
    this.manufacturerId,
    this.model,
    this.modelID,
    this.modelYear,
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
  });

// // takes all the cars information and returns it in json format
//   getInfo() {
//     return {
//       "fbDocument ": fbDocumentId,
//       "vin": vin,
//       "year": modelYear,
//       "make": make,
//       "model": model,
//       "owner": owner
//     };
//   }

  static Vehicle fromJson(Map<String, dynamic> json) {
    return Vehicle(
      id: json["id"],
      abs: json["ABS"].toString().isNotEmpty ? json["ABS"] : "N/A",
      activeSafetySysNote: json["ActiveSafetySysNote"].toString().isNotEmpty
          ? json["ActiveSafetySysNote"]
          : "N/A",
      adaptiveCruiseControl: json["AdaptiveCruiseControl"].toString().isNotEmpty
          ? json["AdaptiveCruiseControl"]
          : "N/A",
      adaptiveDrivingBeam: json["AdaptiveDrivingBeam"].toString().isNotEmpty
          ? json["AdaptiveDrivingBeam"]
          : "N/A",
      adaptiveHeadlights: json["AdaptiveHeadlights"].toString().isNotEmpty
          ? json["AdaptiveHeadlights"]
          : "N/A",
      additionalErrorText: json["AdditionalErrorText"].toString().isNotEmpty
          ? json["AdditionalErrorText"]
          : "N/A",
      airBagLocCurtain: json["AirBagLocCurtain"].toString().isNotEmpty
          ? json["AirBagLocCurtain"]
          : "N/A",
      airBagLocFront: json["AirBagLocFront"].toString().isNotEmpty
          ? json["AirBagLocFront"]
          : "N/A",
      airBagLocKnee: json["AirBagLocKnee"].toString().isNotEmpty
          ? json["AirBagLocKnee"]
          : "N/A",
      airBagLocSeatCushion: json["AirBagLocSeatCushion"].toString().isNotEmpty
          ? json["AirBagLocSeatCushion"]
          : "N/A",
      airBagLocSide: json["AirBagLocSide"].toString().isNotEmpty
          ? json["AirBagLocSide"]
          : "N/A",
      autoReverseSystem: json["AutoReverseSystem"].toString().isNotEmpty
          ? json["AutoReverseSystem"]
          : "N/A",
      automaticPedestrianAlertingSound:
          json["AutomaticPedestrianAlertingSound"].toString().isNotEmpty
              ? json["AutomaticPedestrianAlertingSound"]
              : "N/A",
      axleConfiguration: json["AxleConfiguration"].toString().isNotEmpty
          ? json["AxleConfiguration"]
          : "N/A",
      axles: json["Axles"].toString().isNotEmpty ? json["Axles"] : "N/A",
      basePrice:
          json["BasePrice"].toString().isNotEmpty ? json["BasePrice"] : "N/A",
      batteryA:
          json["BatteryA"].toString().isNotEmpty ? json["BatteryA"] : "N/A",
      batteryATo: json["BatteryA_to"].toString().isNotEmpty
          ? json["BatteryA_to"]
          : "N/A",
      batteryCells: json["BatteryCells"].toString().isNotEmpty
          ? json["BatteryCells"]
          : "N/A",
      batteryInfo: json["BatteryInfo"].toString().isNotEmpty
          ? json["BatteryInfo"]
          : "N/A",
      batteryKWh:
          json["BatteryKWh"].toString().isNotEmpty ? json["BatteryKWh"] : "N/A",
      batteryKWhTo: json["BatteryKWh_to"].toString().isNotEmpty
          ? json["BatteryKWh_to"]
          : "N/A",
      batteryModules: json["BatteryModules"].toString().isNotEmpty
          ? json["BatteryModules"]
          : "N/A",
      batteryPacks: json["BatteryPacks"].toString().isNotEmpty
          ? json["BatteryPacks"]
          : "N/A",
      batteryType: json["BatteryType"].toString().isNotEmpty
          ? json["BatteryType"]
          : "N/A",
      batteryV:
          json["BatteryV"].toString().isNotEmpty ? json["BatteryV"] : "N/A",
      batteryVTo: json["BatteryV_to"].toString().isNotEmpty
          ? json["BatteryV_to"]
          : "N/A",
      bedLengthIN: json["BedLengthIN"].toString().isNotEmpty
          ? json["BedLengthIN"]
          : "N/A",
      bedType: json["BedType"].toString().isNotEmpty ? json["BedType"] : "N/A",
      blindSpotIntervention: json["BlindSpotIntervention"].toString().isNotEmpty
          ? json["BlindSpotIntervention"]
          : "N/A",
      blindSpotMon: json["BlindSpotMon"].toString().isNotEmpty
          ? json["BlindSpotMon"]
          : "N/A",
      bodyCabType: json["BodyCabType"].toString().isNotEmpty
          ? json["BodyCabType"]
          : "N/A",
      bodyClass:
          json["BodyClass"].toString().isNotEmpty ? json["BodyClass"] : "N/A",
      brakeSystemDesc: json["BrakeSystemDesc"].toString().isNotEmpty
          ? json["BrakeSystemDesc"]
          : "N/A",
      brakeSystemType: json["BrakeSystemType"].toString().isNotEmpty
          ? json["BrakeSystemType"]
          : "N/A",
      busFloorConfigType: json["BusFloorConfigType"].toString().isNotEmpty
          ? json["BusFloorConfigType"]
          : "N/A",
      busLength:
          json["BusLength"].toString().isNotEmpty ? json["BusLength"] : "N/A",
      busType: json["BusType"].toString().isNotEmpty ? json["BusType"] : "N/A",
      cib: json["CIB"].toString().isNotEmpty ? json["CIB"] : "N/A",
      cashForClunkers: json["CashForClunkers"].toString().isNotEmpty
          ? json["CashForClunkers"]
          : "N/A",
      chargerLevel: json["ChargerLevel"].toString().isNotEmpty
          ? json["ChargerLevel"]
          : "N/A",
      chargerPowerKW: json["ChargerPowerKW"].toString().isNotEmpty
          ? json["ChargerPowerKW"]
          : "N/A",
      coolingType: json["CoolingType"].toString().isNotEmpty
          ? json["CoolingType"]
          : "N/A",
      curbWeightLB: json["CurbWeightLB"].toString().isNotEmpty
          ? json["CurbWeightLB"]
          : "N/A",
      customMotorcycleType: json["CustomMotorcycleType"].toString().isNotEmpty
          ? json["CustomMotorcycleType"]
          : "N/A",
      daytimeRunningLight: json["DaytimeRunningLight"].toString().isNotEmpty
          ? json["DaytimeRunningLight"]
          : "N/A",
      destinationMarket: json["DestinationMarket"].toString().isNotEmpty
          ? json["DestinationMarket"]
          : "N/A",
      displacementCC:
          double.tryParse(json["DisplacementCC"])?.toStringAsFixed(2),
      displacementCI:
          double.tryParse(json["DisplacementCI"])?.toStringAsFixed(2),
      displacementL: double.tryParse(json["DisplacementL"])?.toStringAsFixed(1),
      doors: json["Doors"].toString().isNotEmpty
          ? json["AxleConfiguration"]
          : "N/A",
      driveType:
          json["DriveType"].toString().isNotEmpty ? json["DriveType"] : "N/A",
      driverAssist: json["DriverAssist"].toString().isNotEmpty
          ? json["DriverAssist"]
          : "N/A",
      dynamicBrakeSupport: json["DynamicBrakeSupport"].toString().isNotEmpty
          ? json["DynamicBrakeSupport"]
          : "N/A",
      edr: json["EDR"].toString().isNotEmpty ? json["EDR"] : "N/A",
      esc: json["ESC"].toString().isNotEmpty ? json["ESC"] : "N/A",
      evDriveUnit: json["EVDriveUnit"].toString().isNotEmpty
          ? json["EVDriveUnit"]
          : "N/A",
      electrificationLevel: json["ElectrificationLevel"].toString().isNotEmpty
          ? json["ElectrificationLevel"]
          : "N/A",
      engineConfiguration: json["EngineConfiguration"].toString().isNotEmpty
          ? json["EngineConfiguration"]
          : "N/A",
      engineCycles: json["EngineCycles"].toString().isNotEmpty
          ? json["EngineCycles"]
          : "N/A",
      engineCylinders: json["EngineCylinders"].toString().isNotEmpty
          ? json["EngineCylinders"]
          : "N/A",
      engineHP:
          json["EngineHP"].toString().isNotEmpty ? json["EngineHP"] : "N/A",
      engineHPTo: json["EngineHP_to"].toString().isNotEmpty
          ? json["EngineHP_to"]
          : "N/A",
      engineKW:
          json["EngineKW"].toString().isNotEmpty ? json["EngineKW"] : "N/A",
      engineManufacturer: json["EngineManufacturer"].toString().isNotEmpty
          ? json["EngineManufacturer"]
          : "N/A",
      engineModel: json["EngineModel"].toString().isNotEmpty
          ? json["EngineModel"]
          : "N/A",
      entertainmentSystem: json["EntertainmentSystem"].toString().isNotEmpty
          ? json["EntertainmentSystem"]
          : "N/A",
      errorCode:
          json["ErrorCode"].toString().isNotEmpty ? json["ErrorCode"] : "N/A",
      errorText:
          json["ErrorText"].toString().isNotEmpty ? json["ErrorText"] : "N/A",
      forwardCollisionWarning:
          json["ForwardCollisionWarning"].toString().isNotEmpty
              ? json["ForwardCollisionWarning"]
              : "N/A",
      fuelInjectionType: json["FuelInjectionType"].toString().isNotEmpty
          ? json["FuelInjectionType"]
          : "N/A",
      fuelTypePrimary: json["FuelTypePrimary"].toString().isNotEmpty
          ? json["FuelTypePrimary"]
          : "N/A",
      fuelTypeSecondary: json["FuelTypeSecondary"].toString().isNotEmpty
          ? json["FuelTypeSecondary"]
          : "N/A",
      gcwr: json["GCWR"].toString().isNotEmpty ? json["GCWR"] : "N/A",
      gcwrTo: json["GCWR_to"].toString().isNotEmpty ? json["GCWR_to"] : "N/A",
      gvwr: json["GVWR"].toString().isNotEmpty ? json["GVWR"] : "N/A",
      gvwrTo: json["GVWR_to"].toString().isNotEmpty ? json["GVWR_to"] : "N/A",
      keylessIgnition: json["KeylessIgnition"].toString().isNotEmpty
          ? json["KeylessIgnition"]
          : "N/A",
      laneCenteringAssistance:
          json["LaneCenteringAssistance"].toString().isNotEmpty
              ? json["LaneCenteringAssistance"]
              : "N/A",
      laneDepartureWarning: json["LaneDepartureWarning"].toString().isNotEmpty
          ? json["LaneDepartureWarning"]
          : "N/A",
      laneKeepSystem: json["LaneKeepSystem"].toString().isNotEmpty
          ? json["LaneKeepSystem"]
          : "N/A",
      lowerBeamHeadlampLightSource:
          json["LowerBeamHeadlampLightSource"].toString().isNotEmpty
              ? json["LowerBeamHeadlampLightSource"]
              : "N/A",
      make: json["Make"].toString().isNotEmpty ? json["Make"] : "N/A",
      makeID: json["MakeID"].toString().isNotEmpty ? json["MakeID"] : "N/A",
      manufacturer: json["Manufacturer"].toString().isNotEmpty
          ? json["Manufacturer"]
          : "N/A",
      manufacturerId: json["ManufacturerId"].toString().isNotEmpty
          ? json["ManufacturerId"]
          : "N/A",
      model: json["Model"].toString().isNotEmpty ? json["Model"] : "N/A",
      modelID: json["ModelID"].toString().isNotEmpty ? json["ModelID"] : "N/A",
      modelYear:
          json["ModelYear"].toString().isNotEmpty ? json["ModelYear"] : "N/A",
      motorcycleChassisType: json["MotorcycleChassisType"].toString().isNotEmpty
          ? json["MotorcycleChassisType"]
          : "N/A",
      motorcycleSuspensionType:
          json["MotorcycleSuspensionType"].toString().isNotEmpty
              ? json["MotorcycleSuspensionType"]
              : "N/A",
      ncsaBodyType: json["NCSABodyType"].toString().isNotEmpty
          ? json["NCSABodyType"]
          : "N/A",
      ncsaMake:
          json["NCSAMake"].toString().isNotEmpty ? json["NCSAMake"] : "N/A",
      ncsaMapExcApprovedBy: json["NCSAMapExcApprovedBy"].toString().isNotEmpty
          ? json["NCSAMapExcApprovedBy"]
          : "N/A",
      ncsaMapExcApprovedOn: json["NCSAMapExcApprovedOn"].toString().isNotEmpty
          ? json["NCSAMapExcApprovedOn"]
          : "N/A",
      ncsaMappingException: json["NCSAMappingException"].toString().isNotEmpty
          ? json["NCSAMappingException"]
          : "N/A",
      ncsaModel:
          json["NCSAModel"].toString().isNotEmpty ? json["NCSAModel"] : "N/A",
      ncsaNote:
          json["NCSANote"].toString().isNotEmpty ? json["NCSANote"] : "N/A",
      nonLandUse:
          json["NonLandUse"].toString().isNotEmpty ? json["NonLandUse"] : "N/A",
      note: json["Note"].toString().isNotEmpty ? json["Note"] : "N/A",
      otherBusInfo: json["OtherBusInfo"].toString().isNotEmpty
          ? json["OtherBusInfo"]
          : "N/A",
      otherEngineInfo: json["OtherEngineInfo"].toString().isNotEmpty
          ? json["OtherEngineInfo"]
          : "N/A",
      otherMotorcycleInfo: json["OtherMotorcycleInfo"].toString().isNotEmpty
          ? json["OtherMotorcycleInfo"]
          : "N/A",
      otherRestraintSystemInfo:
          json["OtherRestraintSystemInfo"].toString().isNotEmpty
              ? json["OtherRestraintSystemInfo"]
              : "N/A",
      otherTrailerInfo: json["OtherTrailerInfo"].toString().isNotEmpty
          ? json["OtherTrailerInfo"]
          : "N/A",
      parkAssist:
          json["ParkAssist"].toString().isNotEmpty ? json["ParkAssist"] : "N/A",
      pedestrianAutomaticEmergencyBraking:
          json["PedestrianAutomaticEmergencyBraking"].toString().isNotEmpty
              ? json["PedestrianAutomaticEmergencyBraking"]
              : "N/A",
      plantCity:
          json["PlantCity"].toString().isNotEmpty ? json["PlantCity"] : "N/A",
      plantCompanyName: json["PlantCompanyName"].toString().isNotEmpty
          ? json["PlantCompanyName"]
          : "N/A",
      plantCountry: json["PlantCountry"].toString().isNotEmpty
          ? json["PlantCountry"]
          : "N/A",
      plantState:
          json["PlantState"].toString().isNotEmpty ? json["PlantState"] : "N/A",
      possibleValues: json["PossibleValues"].toString().isNotEmpty
          ? json["PossibleValues"]
          : "N/A",
      pretensioner: json["Pretensioner"].toString().isNotEmpty
          ? json["Pretensioner"]
          : "N/A",
      rearAutomaticEmergencyBraking:
          json["RearAutomaticEmergencyBraking"].toString().isNotEmpty
              ? json["RearAutomaticEmergencyBraking"]
              : "N/A",
      rearCrossTrafficAlert: json["RearCrossTrafficAlert"].toString().isNotEmpty
          ? json["RearCrossTrafficAlert"]
          : "N/A",
      rearVisibilitySystem: json["RearVisibilitySystem"].toString().isNotEmpty
          ? json["RearVisibilitySystem"]
          : "N/A",
      saeAutomationLevel: json["SAEAutomationLevel"].toString().isNotEmpty
          ? json["SAEAutomationLevel"]
          : "N/A",
      saeAutomationLevelTo: json["SAEAutomationLevel_to"].toString().isNotEmpty
          ? json["SAEAutomationLevel_to"]
          : "N/A",
      seatBeltsAll: json["SeatBeltsAll"].toString().isNotEmpty
          ? json["SeatBeltsAll"]
          : "N/A",
      seatRows:
          json["SeatRows"].toString().isNotEmpty ? json["SeatRows"] : "N/A",
      seats: json["Seats"].toString().isNotEmpty ? json["Seats"] : "N/A",
      semiAutomaticHeadlampBeamSwitching:
          json["SemiautomaticHeadlampBeamSwitching"].toString().isNotEmpty
              ? json["SemiautomaticHeadlampBeamSwitching"]
              : "N/A",
      series: json["Series"].toString().isNotEmpty ? json["Series"] : "N/A",
      series2: json["Series2"].toString().isNotEmpty ? json["Series2"] : "N/A",
      steeringLocation: json["SteeringLocation"].toString().isNotEmpty
          ? json["SteeringLocation"]
          : "N/A",
      suggestedVIN: json["SuggestedVIN"].toString().isNotEmpty
          ? json["SuggestedVIN"]
          : "N/A",
      tpms: json["TPMS"].toString().isNotEmpty ? json["TPMS"] : "N/A",
      topSpeedMPH: json["TopSpeedMPH"].toString().isNotEmpty
          ? json["TopSpeedMPH"]
          : "N/A",
      trackWidth:
          json["TrackWidth"].toString().isNotEmpty ? json["TrackWidth"] : "N/A",
      tractionControl: json["TractionControl"].toString().isNotEmpty
          ? json["TractionControl"]
          : "N/A",
      trailerBodyType: json["TrailerBodyType"].toString().isNotEmpty
          ? json["TrailerBodyType"]
          : "N/A",
      trailerLength: json["TrailerLength"].toString().isNotEmpty
          ? json["TrailerLength"]
          : "N/A",
      trailerType: json["TrailerType"].toString().isNotEmpty
          ? json["TrailerType"]
          : "N/A",
      transmissionSpeeds: json["TransmissionSpeeds"].toString().isNotEmpty
          ? json["TransmissionSpeeds"]
          : "N/A",
      transmissionStyle: json["TransmissionStyle"].toString().isNotEmpty
          ? json["TransmissionStyle"]
          : "N/A",
      trim: json["Trim"].toString().isNotEmpty ? json["Trim"] : "N/A",
      trim2: json["Trim2"].toString().isNotEmpty ? json["Trim2"] : "N/A",
      turbo: json["Turbo"].toString().isNotEmpty ? json["Turbo"] : "N/A",
      vin: json["VIN"].toString().isNotEmpty ? json["VIN"] : "N/A",
      valveTrainDesign: json["ValveTrainDesign"].toString().isNotEmpty
          ? json["ValveTrainDesign"]
          : "N/A",
      vehicleDescriptor: json["VehicleDescriptor"].toString().isNotEmpty
          ? json["VehicleDescriptor"]
          : "N/A",
      vehicleType: json["VehicleType"].toString().isNotEmpty
          ? json["VehicleType"]
          : "N/A",
      wheelBaseLong: json["WheelBaseLong"].toString().isNotEmpty
          ? json["WheelBaseLong"]
          : "N/A",
      wheelBaseShort: json["WheelBaseShort"].toString().isNotEmpty
          ? json["WheelBaseShort"]
          : "N/A",
      wheelBaseType: json["WheelBaseType"].toString().isNotEmpty
          ? json["WheelBaseType"]
          : "N/A",
      wheelSizeFront: json["WheelSizeFront"].toString().isNotEmpty
          ? json["WheelSizeFront"]
          : "N/A",
      wheelSizeRear: json["WheelSizeRear"].toString().isNotEmpty
          ? json["WheelSizeRear"]
          : "N/A",
      wheels: json["Wheels"].toString().isNotEmpty ? json["Wheels"] : "N/A",
      windows: json["Windows"].toString().isNotEmpty ? json["Windows"] : "N/A",
    );
  }

  Vehicle fromString(String carInfo) {
    Map<String, dynamic> info = jsonDecode(carInfo);
    return fromJson(info);
  }

  @override
  String toString() {
    return '{"ABS": $abs,"ActiveSafetySysNote": $activeSafetySysNote,"AdaptiveCruiseControl":$adaptiveCruiseControl,"AdaptiveDrivingBeam": $adaptiveDrivingBeam, "AdaptiveHeadlights": $adaptiveHeadlights, "AdditionalErrorText": $additionalErrorText, "AirBagLocCurtain": $airBagLocCurtain, "AirBagLocFront": $airBagLocFront, "AirBagLocKnee": $airBagLocKnee, "AirBagLocSeatCushion": $airBagLocSeatCushion,"AirBagLocSide": $airBagLocSide,"AutoReverseSystem": ,"AutomaticPedestrianAlertingSound": $automaticPedestrianAlertingSound, "AxleConfiguration": $axleConfiguration, "Axles": $axles,"BasePrice": $basePrice, "BatteryA": $batteryA,"BatteryA_to": $batteryATo,"BatteryCells": $batteryCells,"BatteryInfo": $batteryInfo,"BatteryKWh": $batteryKWh,"BatteryKWh_to": $batteryKWhTo,"BatteryModules": $batteryModules,"BatteryPacks": $batteryPacks,"BatteryType": $batteryType,"BatteryV": $batteryV, "BatteryV_to": $batteryV,"BedLengthIN": $bedLengthIN, "BedType": $bedType,"BlindSpotIntervention": $blindSpotIntervention,"BlindSpotMon": $blindSpotMon,"BodyCabType": $bodyCabType, "BodyClass": $bodyClass, "BrakeSystemDesc": $brakeSystemDesc,"BrakeSystemType": $brakeSystemType, "BusFloorConfigType": $busFloorConfigType,"BusLength": $busLength, "BusType": $busType, "CIB": $cib,"CashForClunkers": $cashForClunkers, "ChargerLevel": $chargerLevel,"ChargerPowerKW": $chargerPowerKW, "CoolingType": $coolingType, "CurbWeightLB": $curbWeightLB, "CustomMotorcycleType": $customMotorcycleType, "DaytimeRunningLight": $daytimeRunningLight, "DestinationMarket": $destinationMarket, "DisplacementCC": $displacementCC, "DisplacementCI": $displacementCI, "DisplacementL": $displacementL, "Doors": $doors,"DriveType": $driveType, "DriverAssist": $driverAssist,"DynamicBrakeSupport": $dynamicBrakeSupport, "EDR": $edr,"ESC": $esc, "EVDriveUnit": $evDriveUnit, "ElectrificationLevel": $electrificationLevel, "EngineConfiguration": $engineConfiguration, "EngineCycles": $engineCycles, "EngineCylinders": $engineCycles,"EngineHP": $engineHP, "EngineHP_to": $engineHPTo,"EngineKW": $engineKW, "EngineManufacturer": $engineManufacturer, "EngineModel": $engineModel, "EntertainmentSystem": $entertainmentSystem,"ErrorCode": $errorCode, "ErrorText": $errorText,"ForwardCollisionWarning": $forwardCollisionWarning, "FuelInjectionType": $fuelInjectionType,"FuelTypePrimary": $fuelTypePrimary, "FuelTypeSecondary": $fuelTypeSecondary,"GCWR": $gcwr, "GCWR_to": $gcwrTo, "GVWR": $gvwr, "GVWR_to": $gvwrTo, "KeylessIgnition": $keylessIgnition, "LaneCenteringAssistance": $laneCenteringAssistance, "LaneDepartureWarning": $laneDepartureWarning, "LaneKeepSystem": $laneKeepSystem,  "LowerBeamHeadlampLightSource": $lowerBeamHeadlampLightSource, "Make": $make, "MakeID": $makeID, "Manufacturer": $manufacturer,"ManufacturerId": $manufacturerId, "Model":$model,"ModelID": $modelID, "ModelYear": $modelYear,"MotorcycleChassisType": $motorcycleChassisType, "MotorcycleSuspensionType": $motorcycleSuspensionType,"NCSABodyType": $ncsaBodyType, "NCSAMake": $ncsaMake, "NCSAMapExcApprovedBy": $ncsaMapExcApprovedBy, "NCSAMapExcApprovedOn": $ncsaMapExcApprovedOn, "NCSAMappingException": $ncsaMappingException, "NCSAModel": "$ncsaModel,"NCSANote": $ncsaNote, "NonLandUse": $nonLandUse, "Note": $note, "OtherBusInfo": $otherBusInfo, "OtherEngineInfo": $otherEngineInfo,"OtherMotorcycleInfo": $otherMotorcycleInfo, "OtherRestraintSystemInfo": $otherRestraintSystemInfo, "OtherTrailerInfo": $otherTrailerInfo, "ParkAssist": $parkAssist, "PedestrianAutomaticEmergencyBraking": $pedestrianAutomaticEmergencyBraking, "PlantCity": $plantCity, "PlantCompanyName": $plantCompanyName, "PlantCountry": $plantCountry, "PlantState": $plantState, "PossibleValues": $possibleValues, "Pretensioner": $pretensioner, "RearAutomaticEmergencyBraking": $rearAutomaticEmergencyBraking, "RearCrossTrafficAlert": $rearCrossTrafficAlert,"RearVisibilitySystem": $rearVisibilitySystem,"SAEAutomationLevel": $saeAutomationLevel, "SAEAutomationLevel_to": $saeAutomationLevelTo, "SeatBeltsAll": $seatBeltsAll, "SeatRows": $seatRows, "Seats":$seats, "SemiautomaticHeadlampBeamSwitching": $semiAutomaticHeadlampBeamSwitching, "Series": $series, "Series2": $series2, "SteeringLocation": $steeringLocation, "SuggestedVIN": $suggestedVIN, "TPMS": $tpms, "TopSpeedMPH": $topSpeedMPH, "TrackWidth": $trackWidth, "TractionControl":$tractionControl, "TrailerBodyType": $trailerBodyType, "TrailerLength": $trailerLength, "TrailerType": $trailerType, "TransmissionSpeeds": $transmissionSpeeds, "TransmissionStyle": $transmissionStyle, "Trim": $trim, "Trim2": $trim2, "Turbo": $turbo, "VIN": $vin, "ValveTrainDesign": $valveTrainDesign, "VehicleDescriptor": $vehicleDescriptor, "VehicleType": $vehicleType, "WheelBaseLong": $wheelBaseLong, "WheelBaseShort": $wheelBaseShort,"WheelBaseType": $wheelBaseType, "WheelSizeFront": $wheelSizeFront, "WheelSizeRear": $wheelSizeRear, "Wheels": $wheels, "Windows": $windows }';
  }
}
