class Repair {
  final String id; //id of the workorder
  final double hours; //hours the tech worked
  final String tech; //techs name who did repairs
  final String odometer; // odometer reading at time of the repair
  final String workRequested; // action requested by the customer
  final List<Part> parts;

  // final List<Work> work; //

  Repair(this.id, this.hours, this.tech, this.odometer, this.workRequested,
      this.parts);

  /// returns all information about repair
  getRepairInfo() {
    return {
      "id": id,
      "hours": hours,
      "tech": tech,
      "odometer": odometer,
      "workRequested": workRequested,
      "parts": parts,
      
    };
  }
}

class Part {
  final String name;
  final int quantity;
  final double unitPrice;
  Part(this.name, this.quantity, this.unitPrice);

  /// gets a parts total price
  double getPartTotal() {
    double total = double.parse(unitPrice.toString()) * quantity;
    return total;
  }

  getInfo() {
    return {"name": name, "price": unitPrice, "quantity": quantity};
  }
}

// class Work {
//   final String name;
//   final int price;

//   Work(this.name, this.price);
// }
