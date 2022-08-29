import 'package:my_car_records/controllers/my_extensions.dart';
import 'package:my_car_records/model/part.dart';

/// Create a Repair
/// 
/// [id] id of the workorder autogenerated at creation. 
/// [hours] time to complete repair.
/// [tech] the name of the tech that performed the repairs.
/// [odometer] amount of miles on the car at time of repair.
/// [workRequested] work requested by the vehicle owner.
/// [parts] a list of parts that are needed to complete the repair.
class Repair {
  final String id; 
  final double hours; 
  final String tech;
  final String odometer; 
  final String workRequested;
  final List<Part> parts;


  Repair(this.id, this.hours, this.tech, this.odometer, this.workRequested,
      this.parts);

  /// returns all information about repair
  getRepairInfo() {
    return {
      "id": id,
      "hours": hours,
      "tech": eachCap(tech),
      "odometer": odometer,
      "workRequested": capitalize(workRequested),
      "parts": parts,
    };
  }
}

