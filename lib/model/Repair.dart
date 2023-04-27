import 'package:my_car_records/model/db/part.dart';
import 'package:my_car_records/model/part.dart';

/// Create a Repair
///
/// [hours] time to complete repair.
/// [labor] total cost of the Technition
/// [tech] the name of the tech that performed the repairs.
/// [odometer] amount of miles on the car at time of repair.
/// [workRequested] work requested by the vehicle owner.

class Repair {
  final String? id;
  final String? vehicleID;
  final double? hours;
  final double? labor;
  final String? tech;
  final int? odometer;
  final String workRequested;
  List<Part>? partList = [];

  Repair(
      {this.id,
      this.vehicleID,
      required this.workRequested,
      this.hours = 0,
      this.labor = 0,
      this.tech,
      this.odometer,
      this.partList}) {
    getParts();
  }

  static Repair fromJson(Map<String, dynamic> json) {
    return Repair(
      id: json["id"],
      vehicleID: json["vehicleID"],
      hours: json["hours"],
      labor: json["labor"],
      tech: json["tech"],
      odometer: json["odometer"],
      workRequested: json["work_requested"],
    );
  }

  /// returns all information about repair in json form
  Map<String, dynamic> getRepairInfo() {
    return {
      "hours": hours,
      "labor": labor,
      "tech": tech,
      "odometer": odometer,
      "workRequested": workRequested,
      "partList": partList,
    };
  }

  double laborTotal() {
    return (labor! * hours!);
  }

  Future<List<Part?>> getParts() async {
    List<Part> partsList =
        await PartDB().get(vehicleID: vehicleID, repairID: id);
    partList = partsList;
    return partsList;
  }

  /// TODO: Get total cost of parts
}
