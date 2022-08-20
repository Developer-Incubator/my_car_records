class Car {
  final int year;
  final String vin;
  final String make;
  final String model;
  final String owner;

  Car(this.vin, this.year, this.make, this.model, this.owner);

  getInfo() {
    return {
      "vin":vin,
      "year": year,
      "make": make,
      "model":model,
      "owner": owner
    };
  }
}