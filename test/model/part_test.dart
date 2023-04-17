import 'package:flutter_test/flutter_test.dart';
import 'package:my_car_records/model/part.dart';

void main() {
  group("Part", () {
    test("Calculate Part Price", () {
      // Arrange
      double expectedOutput = 59.88;
      // 4.99 * 12
      // Act
      Part testPart = Part(name: "Part Test", quantity: 12, unitPrice: 4.99);
      // Assert
      expect(testPart.getPartTotal(), expectedOutput);
    });
  });
}
