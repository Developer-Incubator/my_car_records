import 'package:cloud_firestore/cloud_firestore.dart';
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
      this.partList});

  static Repair fromJson(
      Map<String, dynamic> json, String id, String vehicleID) {
    return Repair(
      id: id,
      vehicleID: vehicleID,
      hours: json["hours"],
      labor: json["labor"],
      tech: json["tech"],
      odometer: json["odometer"],
      workRequested: json["work_requested"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "hours": hours,
      "labor": labor,
      "tech": tech,
      "odometer": odometer,
      "workRequested": workRequested,
    };
  }

  /// returns all information about repair
  getRepairInfo() {
    return {
      "hours": hours,
      "labor": labor,
      "tech": tech,
      "odometer": odometer,
      "workRequested": workRequested,
    };
  }

  double laborTotal() {
    return (labor! * hours!);
  }

  Future<QuerySnapshot<Map<String, dynamic>>> getParts() async {
    dynamic parts =
        await PartDB().get(vehicleID: vehicleID ?? "", repairID: id);
    return parts;
  }

  void addPart(Part part) {
    partList ??= [];

    return partList?.add(part);
  }

  ///get the total value of all the parts
}
