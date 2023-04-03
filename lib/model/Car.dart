import 'dart:convert';

class Car {
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
  String? eVDriveUnit;
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

  Car({
    this.abs,
    activeSafetySysNote,
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
    this.eVDriveUnit,
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

  static Car fromJson(Map<String, dynamic> json) {
    return Car(
      abs: json["ABS"],
      activeSafetySysNote: json["ActiveSafetySysNote"],
      adaptiveCruiseControl: json["AdaptiveCruiseControl"],
      adaptiveDrivingBeam: json["AdaptiveDrivingBeam"],
      adaptiveHeadlights: json["AdaptiveHeadlights"],
      additionalErrorText: json["AdditionalErrorText"],
      airBagLocCurtain: json["AirBagLocCurtain"],
      airBagLocFront: json["AirBagLocFront"],
      airBagLocKnee: json["AirBagLocKnee"],
      airBagLocSeatCushion: json["AirBagLocSeatCushion"],
      airBagLocSide: json["AirBagLocSide"],
      autoReverseSystem: json["AutoReverseSystem"],
      automaticPedestrianAlertingSound:
          json["AutomaticPedestrianAlertingSound"],
      axleConfiguration: json["AxleConfiguration"],
      axles: json["Axles"],
      basePrice: json["BasePrice"],
      batteryA: json["BatteryA"],
      batteryATo: json["BatteryA_to"],
      batteryCells: json["BatteryCells"],
      batteryInfo: json["BatteryInfo"],
      batteryKWh: json["BatteryKWh"],
      batteryKWhTo: json["BatteryKWh_to"],
      batteryModules: json["BatteryModules"],
      batteryPacks: json["BatteryPacks"],
      batteryType: json["BatteryType"],
      batteryV: json["BatteryV"],
      batteryVTo: json["BatteryV_to"],
      bedLengthIN: json["BedLengthIN"],
      bedType: json["BedType"],
      blindSpotIntervention: json["BlindSpotIntervention"],
      blindSpotMon: json["BlindSpotMon"],
      bodyCabType: json["BodyCabType"],
      bodyClass: json["BodyClass"],
      brakeSystemDesc: json["BrakeSystemDesc"],
      brakeSystemType: json["BrakeSystemType"],
      busFloorConfigType: json["BusFloorConfigType"],
      busLength: json["BusLength"],
      busType: json["BusType"],
      cib: json["CIB"],
      cashForClunkers: json["CashForClunkers"],
      chargerLevel: json["ChargerLevel"],
      chargerPowerKW: json["ChargerPowerKW"],
      coolingType: json["CoolingType"],
      curbWeightLB: json["CurbWeightLB"],
      customMotorcycleType: json["CustomMotorcycleType"],
      daytimeRunningLight: json["DaytimeRunningLight"],
      destinationMarket: json["DestinationMarket"],
      displacementCC: json["DisplacementCC"],
      displacementCI: json["DisplacementCI"],
      displacementL: json["DisplacementL"],
      doors: json["Doors"],
      driveType: json["DriveType"],
      driverAssist: json["DriverAssist"],
      dynamicBrakeSupport: json["DynamicBrakeSupport"],
      edr: json["EDR"],
      esc: json["ESC"],
      eVDriveUnit: json["EVDriveUnit"],
      electrificationLevel: json["ElectrificationLevel"],
      engineConfiguration: json["EngineConfiguration"],
      engineCycles: json["EngineCycles"],
      engineCylinders: json["EngineCylinders"],
      engineHP: json["EngineHP"],
      engineHPTo: json["EngineHP_to"],
      engineKW: json["EngineKW"],
      engineManufacturer: json["EngineManufacturer"],
      engineModel: json["EngineModel"],
      entertainmentSystem: json["EntertainmentSystem"],
      errorCode: json["ErrorCode"],
      errorText: json["ErrorText"],
      forwardCollisionWarning: json["ForwardCollisionWarning"],
      fuelInjectionType: json["FuelInjectionType"],
      fuelTypePrimary: json["FuelTypePrimary"],
      fuelTypeSecondary: json["FuelTypeSecondary"],
      gcwr: json["GCWR"],
      gcwrTo: json["GCWR_to"],
      gvwr: json["GVWR"],
      gvwrTo: json["GVWR_to"],
      keylessIgnition: json["KeylessIgnition"],
      laneCenteringAssistance: json["LaneCenteringAssistance"],
      laneDepartureWarning: json["LaneDepartureWarning"],
      laneKeepSystem: json["LaneKeepSystem"],
      lowerBeamHeadlampLightSource: json["LowerBeamHeadlampLightSource"],
      make: json["Make"],
      makeID: json["MakeID"],
      manufacturer: json["Manufacturer"],
      manufacturerId: json["ManufacturerId"],
      model: json["Model"],
      modelID: json["ModelID"],
      modelYear: json["ModelYear"],
      motorcycleChassisType: json["MotorcycleChassisType"],
      motorcycleSuspensionType: json["MotorcycleSuspensionType"],
      ncsaBodyType: json["NCSABodyType"],
      ncsaMake: json["NCSAMake"],
      ncsaMapExcApprovedBy: json["NCSAMapExcApprovedBy"],
      ncsaMapExcApprovedOn: json["NCSAMapExcApprovedOn"],
      ncsaMappingException: json["NCSAMappingException"],
      ncsaModel: json["NCSAModel"],
      ncsaNote: json["NCSANote"],
      nonLandUse: json["NonLandUse"],
      note: json["Note"],
      otherBusInfo: json["OtherBusInfo"],
      otherEngineInfo: json["OtherEngineInfo"],
      otherMotorcycleInfo: json["OtherMotorcycleInfo"],
      otherRestraintSystemInfo: json["OtherRestraintSystemInfo"],
      otherTrailerInfo: json["OtherTrailerInfo"],
      parkAssist: json["PedestrianAutomaticEmergencyBraking"],
      pedestrianAutomaticEmergencyBraking: json[""],
      plantCity: json["PlantCity"],
      plantCompanyName: json["PlantCompanyName"],
      plantCountry: json["PlantCountry"],
      plantState: json["PlantState"],
      possibleValues: json["PossibleValues"],
      pretensioner: json["Pretensioner"],
      rearAutomaticEmergencyBraking: json["RearAutomaticEmergencyBraking"],
      rearCrossTrafficAlert: json["RearCrossTrafficAlert"],
      rearVisibilitySystem: json["RearVisibilitySystem"],
      saeAutomationLevel: json["SAEAutomationLevel"],
      saeAutomationLevelTo: json["SAEAutomationLevel_to"],
      seatBeltsAll: json["SeatBeltsAll"],
      seatRows: json["SeatRows"],
      seats: json["Seats"],
      semiAutomaticHeadlampBeamSwitching:
          json["SemiautomaticHeadlampBeamSwitching"],
      series: json["Series"],
      series2: json["Series2"],
      steeringLocation: json["SteeringLocation"],
      suggestedVIN: json["SuggestedVIN"],
      tpms: json["TPMS"],
      topSpeedMPH: json["TopSpeedMPH"],
      trackWidth: json["TrackWidth"],
      tractionControl: json["TractionControl"],
      trailerBodyType: json["TrailerBodyType"],
      trailerLength: json["TrailerLength"],
      trailerType: json["TrailerType"],
      transmissionSpeeds: json["TransmissionSpeeds"],
      transmissionStyle: json["TransmissionStyle"],
      trim: json["Trim"],
      trim2: json["Trim2"],
      turbo: json["Turbo"],
      vin: json["VIN"],
      valveTrainDesign: json["ValveTrainDesign"],
      vehicleDescriptor: json["VehicleDescriptor"],
      vehicleType: json["VehicleType"],
      wheelBaseLong: json["WheelBaseLong"],
      wheelBaseShort: json["WheelBaseShort"],
      wheelBaseType: json["WheelBaseType"],
      wheelSizeFront: json["WheelSizeFront"],
      wheelSizeRear: json["WheelSizeRear"],
      wheels: json["Wheels"],
      windows: json["Windows"],
    );
  }

  Car fromString(String carInfo) {
    Map<String, dynamic> info = jsonDecode(carInfo);
    return fromJson(info);
  }
}
