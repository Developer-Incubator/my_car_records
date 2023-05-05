import 'package:my_car_records/model/db/part.dart';
import 'package:my_car_records/model/db/repair.dart';
import 'package:my_car_records/model/part.dart';

/// Create a Repair
///
/// [hours] time to complete repair.
/// [labor] total cost of the Technition
/// [tech] the name of the tech that performed the repairs.
/// [odometer] amount of miles on the car at time of repair.
/// [workRequested] work requested by the vehicle owner.

class Repair {
  final int? id;
  final int? vehicleID;
  final double? hours;
  final double? labor;
  final String? tech;
  final int? odometer;
  final String workRequested;
  double total = 0.00;
  // List<Part>? partList = [];

  Repair({
    this.id,
    this.vehicleID,
    required this.workRequested,
    this.hours = 0,
    this.labor = 0,
    this.tech,
    this.odometer,
    // this.partList
  }) {
    getTotal();
    print(total);
    // getParts();
  }

  static Repair fromJson(Map<String, dynamic> json) {
    return Repair(
      id: json["id"],
      vehicleID: json["vehicle_id"],
      hours: double.parse(json["hours"].toString()),
      labor: double.parse(json["labor"].toString()),
      tech: json["technition"],
      odometer: json["odometer"],
      workRequested: json["work_requested"],
    );
  }

  /// returns all information about repair in json form
  Map<String, dynamic> getRepairInfo() {
    return {
      "vehicleId": vehicleID,
      "hours": hours,
      "labor": labor,
      "technition": tech,
      "odometer": odometer,
      "workRequested": workRequested,
      // "partList": partList,
    };
  }

  double laborTotal() {
    return (labor! * hours!);
  }

  Future<List<Part?>> getParts() async {
    return await DBPart.getAll(id!);
  }

  Future<double> getTotal() async {
    return await DBRepair.getTotal(id!);
    // total = await DBRepair.getTotal(id!) ?? 0.00;
  }
}
