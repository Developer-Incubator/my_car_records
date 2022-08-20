import 'dart:ffi';

class Repair {
  final String id; //id of the workorder
  final int hours; //hours the tech worked
  final String tech; //techs name who did repairs
  final int odometer; // odometer reading at time of the repair
  final String workRequested; // action requested by the customer
  final List<Part> parts; //

  Repair(this.id, this.hours, this.tech, this.odometer, this.workRequested,
      this.parts);

  getRepairInfo() {
    return {
      "id": id,
      "hours": hours,
    };
  }
}

class Part {
  final String name;
  final int quantity;
  final int unitPrice;
  final int total;
  Part(this.name, this.quantity, this.unitPrice, this.total);

  getPartTotal() {
    int total = unitPrice * quantity;
    return total;
  }
}
