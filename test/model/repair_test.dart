import 'package:flutter_test/flutter_test.dart';
import 'package:my_car_records/model/repair.dart';

void main() {
  group("Repair Class -", () {
    group("Create", () {
      test("Given some data create a repair istance", () {
        Map<String, dynamic> testJson = {
          // "id": "1234567",
          // "vehicleID": "1234567",
          // "hours": 0.0,
          // "labor": 0.0,
          // "tech": "",
          // "odometer": 0000,
          "work_requested": "todo all the things",
        };

        expect(Repair.fromJson(testJson), isA<Repair>());
      });
    });
  });
}
