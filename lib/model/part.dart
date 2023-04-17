/// Create a part
///
/// [id] gets randomly generated at creation,
/// [name] of the part itsself
/// [quantity] the amount of the item needed
/// [unitPrice] the price of an individual item
class Part {
  final String? id;
  final String name;
  final double? quantity;
  final double? unitPrice;
  Part({this.id, required this.name, this.quantity = 1, this.unitPrice = 0.00});

  /// multiplies the price of the item by the quantityto get the toal price of the part
  double getPartTotal() {
    double total = (unitPrice ?? 0) * (quantity ?? 1);

    return total;
  }

  /// returns the information about the part in json format
  Map<String, dynamic> getPartInfo() {
    return {"id": id, "name": name, "price": unitPrice, "quantity": quantity};
  }

  static Part fromJson(Map<String, dynamic> json, String id) {
    return Part(
      id: id,
      name: json["name"],
      quantity: json["quantity"],
      unitPrice: json["unit_price"],
    );
  }

  static Future<Part> fromID(
      {required String vehicleID, required String repairID}) async {
    // await ;
    return Future.delayed(Duration.zero, () {
      return Part(name: 'blas');
    });
  }
}
