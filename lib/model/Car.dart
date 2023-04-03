/// Creates car instance
///
/// [year] yeat the vehicle was made
/// [vin] vehicle id number.
/// [make] vehicle manucafturer.
/// [model] manufactutrer product.
/// [owner] owner of the vehicle
class Car {
  String fbDocumentId;
  int year;
  String make;
  String model;
  String? vin;
  String? owner;
  String? batteryInfo;
  String? batteryV;
  String? bedLengthIN;
  String? bedType;
  String? bodyCabType;
  String? bodyClass;
  String? brakeSystemDesc;
  String? brakeSystemType;
  String? busFloorConfigType;
  String? busLength;
  String? busType;
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
  String? eDR;
  String? eSC;
  String? eVDriveUnit;
  String? electrificationLevel;
  String? engineConfiguration;
  String? engineCycles;
  String? engineCylinders;
  String? engineHP;
  String? engineHP_to;
  String? engineKW;
  String? engineManufacturer;
  String? engineModel;
  String? entertainmentSystem;
  String? errorCode;
  String? errorText;
//       "ForwardCollisionWarning;
//       "FuelInjectionType;
//       "FuelTypePrimary;
//       "FuelTypeSecondary;
//       "GVWR;
//       "KeylessIgnition;
//       "LaneCenteringAssistance;
//       "LaneDepartureWarning;
//       "LaneKeepSystem;
//       "LowerBeamHeadlampLightSource;
//       "Make;,
//       "MakeID;
//       "Manufacturer;
//       "ManufacturerId;
//       "Model;
//       "ModelID;
//       "ModelYear;
//       "MotorcycleChassisType;
//       "MotorcycleSuspensionType;
//       "NCSABodyType;
//       "NCSAMake;
//       "NCSAMapExcApprovedBy;
//       "NCSAMapExcApprovedOn;
//       "NCSAMappingException;
//       "NCSAModel;
//       "NCSANote;
//       "NonLandUse;
//       "Note;
//       "OtherBusInfo;
//       "OtherEngineInfo;
//       "OtherMotorcycleInfo;
//       "OtherRestraintSystemInfo;
//       "OtherTrailerInfo;

  Car({
    required this.fbDocumentId,
    required this.year,
    required this.make,
    required this.model,
    this.vin,
    this.owner,
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
    this.batteryCells,
    this.batteryInfo,
    this.batteryKWh,
    this.batteryModules,
    this.batteryPacks,
    this.batteryType,
    this.batteryV,
    this.bedLengthIN,
    this.bedType,
    this.blindSpotIntervention,
    this.blindSpotMon,
  });

// takes all the cars information and returns it in json format
  getInfo() {
    return {
      "fbDocument ": fbDocumentId,
      "vin": vin,
      "year": year,
      "make": make,
      "model": model,
      "owner": owner
    };
  }
}



//       "ParkAssist": "",
//       "PedestrianAutomaticEmergencyBraking": "",
//       "PlantCity": "MUNICH",
//       "PlantCompanyName": "",
//       "PlantCountry": "GERMANY",
//       "PlantState": "",
//       "PossibleValues": "",
//       "Pretensioner": "Yes",
//       "RearAutomaticEmergencyBraking": "",
//       "RearCrossTrafficAlert": "",
//       "RearVisibilitySystem": "",
//       "SAEAutomationLevel": "",
//       "SAEAutomationLevel_to": "",
//       "SeatBeltsAll": "Manual",
//       "SeatRows": "",
//       "Seats": "",
//       "SemiautomaticHeadlampBeamSwitching": "",
//       "Series": "",
//       "Series2": "",
//       "SteeringLocation": "",
//       "SuggestedVIN": "",
//       "TPMS": "Direct",
//       "TopSpeedMPH": "",
//       "TrackWidth": "",
//       "TractionControl": "",
//       "TrailerBodyType": "Not Applicable",
//       "TrailerLength": "",
//       "TrailerType": "Not Applicable",
//       "TransmissionSpeeds": "",
//       "TransmissionStyle": "",
//       "Trim": "xDrive35i",
//       "Trim2": "SAV",
//       "Turbo": "",
//       "VIN": "5UXWX7C5*BA",
//       "ValveTrainDesign": "",
//       "VehicleDescriptor": "5UXWX7C5*BA",
//       "VehicleType": "MULTIPURPOSE PASSENGER VEHICLE (MPV)",
//       "WheelBaseLong": "",
//       "WheelBaseShort": "",
//       "WheelBaseType": "",
//       "WheelSizeFront": "",
//       "WheelSizeRear": "",
//       "Wheels": "",
//       "Windows": ""
