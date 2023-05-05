import 'package:flutter_test/flutter_test.dart';
import 'package:my_car_records/model/vehicle.dart';

void main() {
  group("Vehicle", () {
    test('fromJson() should return a Vehicle object', () {
      final json = {
        'id': 123,
        'ABS': "true",
        'ActiveSafetySysNote': 'N/A',
        'Make': "Chevrolet",
        'Model': "Bolt",
        'ModelYear': "2020"
        // add more properties as needed
      };
      final vehicle = Vehicle.fromJson(json);
      expect(vehicle, isA<Vehicle>());
    });

    test('should parse all properties correctly', () {
      final json = {
        'id': 123,
        'ABS': "true",
        'ActiveSafetySysNote': 'N/A',
        'Make': "Chevrolet",
        'Model': "Bolt",
        'ModelYear': "2020"
      };
      final vehicle = Vehicle.fromJson(json);
      expect(vehicle.id, equals(123));
      expect(vehicle.abs, equals("true"));
      expect(vehicle.activeSafetySysNote, equals('N/A'));
      // add more assertions for all properties
    });
  });
}
