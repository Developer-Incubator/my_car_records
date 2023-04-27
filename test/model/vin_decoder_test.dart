import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_car_records/model/vehicle.dart';
import 'package:my_car_records/model/vin_decoder.dart';

import '../test_data.dart';

class MockHTTPClient extends Mock implements Client {}

void main() {
  late VinDecoder vinDecoder;
  late MockHTTPClient mockHTTPClient;

  /// 2010 Chevrolet Equinox
  String vin = "2CNFLEEW5A6267165";
  setUp(() {
    mockHTTPClient = MockHTTPClient();
    vinDecoder = VinDecoder(mockHTTPClient);
  });

  group("Vin Decoder - ", () {
    group("decodeVin function", () {
      test("When status code is 200 then a Vehicle sould be returned",
          () async {
        when(
          () => mockHTTPClient.get(
            Uri.parse("${vinDecoder.urlFront}$vin${vinDecoder.urlRear}"),
          ),
        ).thenAnswer((invocation) async {
          return Response(nhtsaTestData, 200);
        });
        final vehicle = await vinDecoder.decodeVin(vin);
        expect(vehicle, isA<Vehicle>());
      });
      test("When status code is not 200 then a exception should be thrown",
          () async {
        when(
          () => mockHTTPClient.get(
            Uri.parse("${vinDecoder.urlFront}$vin${vinDecoder.urlRear}"),
          ),
        ).thenAnswer((invocation) async {
          return Response("", 500);
        });
        final vehicle = vinDecoder.decodeVin(vin);
        expect(vehicle, throwsException);
      });
    });
  });
}
