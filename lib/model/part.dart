/// Create a part
///
/// [id] gets randomly generated at creation,
/// [name] of the part itsself
/// [quantity] the amount of the item needed
/// [unitPrice] the price of an individual item
class Part {
  final int? id;
  final int repairId;
  final String name;
  final double quantity;
  final double? unitPrice;
  final double? total;
  Part({
    this.id,
    required this.repairId,
    required this.name,
    this.quantity = 1,
    this.unitPrice = 0.00,
    this.total = 0.00,
  });

  /// returns the information about the part in json format
  Map<String, dynamic> getPartInfo() {
    return {
      "id": id,
      "repair_id": repairId,
      "title": name,
      "price": unitPrice,
      "quantity": quantity,
      "total": total
    };
  }

  static Part fromJson(Map<String, dynamic> json) {
    return Part(
        id: json["id"] ?? 0,
        repairId: json["repair_id"],
        name: json["title"],
        quantity: double.parse(json["quantity"].toString()),
        unitPrice: double.parse(json["price"].toString()),
        total: double.parse(json['total']));
  }
}
