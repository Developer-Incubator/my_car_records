import 'package:flutter_test/flutter_test.dart';
import 'package:my_car_records/model/part.dart';

void main() {
  group('Part', () {
    test('should create a Part object with default values', () {
      final part = Part(repairId: 1, name: 'Part 1');
      expect(part.id, null);
      expect(part.repairId, 1);
      expect(part.name, 'Part 1');
      expect(part.quantity, 1);
      expect(part.unitPrice, 0.00);
      expect(part.total, 0.00);
    });

    test('should create a Part object with given values', () {
      final part = Part(
        id: 2,
        repairId: 1,
        name: 'Part 1',
        quantity: 2,
        unitPrice: 10.00,
        total: 20.00,
      );
      expect(part.id, 2);
      expect(part.repairId, 1);
      expect(part.name, 'Part 1');
      expect(part.quantity, 2);
      expect(part.unitPrice, 10.00);
      expect(part.total, 20.00);
    });

    test('should return the correct part info in JSON format', () {
      final part = Part(
        id: 2,
        repairId: 1,
        name: 'Part 1',
        quantity: 2,
        unitPrice: 10.00,
        total: 20.00,
      );
      final partInfo = part.getPartInfo();
      expect(partInfo['id'], 2);
      expect(partInfo['repair_id'], 1);
      expect(partInfo['title'], 'Part 1');
      expect(partInfo['price'], 10.00);
      expect(partInfo['quantity'], 2);
      expect(partInfo['total'], 20.00);
    });

    test('should create a Part object from JSON', () {
      final partJson = {
        'id': 2,
        'repair_id': 1,
        'title': 'Part 1',
        'quantity': '2',
        'price': '10.00',
        'total': '20.00',
      };
      final part = Part.fromJson(partJson);
      expect(part.id, 2);
      expect(part.repairId, 1);
      expect(part.name, 'Part 1');
      expect(part.quantity, 2);
      expect(part.unitPrice, 10.00);
      expect(part.total, 20.00);
    });
  });
}
