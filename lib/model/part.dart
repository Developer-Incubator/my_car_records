/// Create a part
/// 
/// [id] gets randomly generated at creation,
/// [name] of the part itsself
/// [quantity] the amount of the item needed
/// [unitPrice] the price of an individual item
class Part {
  final String id;
  final String name;
  final int quantity;
  final double unitPrice;
  Part(this.id, this.name, this.quantity, this.unitPrice);

  /// multiplies the price of the item by the quantityto get the toal price of the part
  double getPartTotal() {
    double total = double.parse(unitPrice.toString()) * quantity;
    return total;
  }

  /// returns the information about the part in json format
  Map<String, dynamic> getPartInfo() {
    return {"id": id, "name": name, "price": unitPrice, "quantity": quantity};
  }
}
