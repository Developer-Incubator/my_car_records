// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
// import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:mocktail/mocktail.dart';
// import 'package:my_car_records/model/db/car.dart';
// import 'package:my_car_records/model/vehicle.dart';

// import '../../test_data.dart';

// // import '../../test_data.dart';

// Vehicle testVehicle = Vehicle.fromJson(
// {
//   "VIN": "2CNFLEEW5A6267165",
//   "Make": "Chevrolet",
//   "Model": "Equinox",
//   "ModelYear": "2010",
//   "owner": "Kevin"
// });
// void main() {
//   late MockUser user;

//   late FakeFirebaseFirestore instance;
//   setUp(() async {
//     instance = FakeFirebaseFirestore();
//     user = MockUser(
//       isAnonymous: false,
//       uid: '1',
//       email: 'bob@somedomain.com',
//       displayName: 'Bob',
//     );
//   });
//   group("CarDB - ", () {
//     group("Add Vehicle:", () {
//       test("Success", () async {
//         expect(await CarDB(user: user, firestore: instance).add(testVehicle),
//             isA<DocumentReference>());
//         // when(() => CarDB(user: user, firestore: instance).add(testVehicle));
//       });

//       // test("Throw Exception", () async {
//       //   when(
//       //     () => CarDB(user: user, firestore: instance)
//       //         .add(testVehicle)
//       //         .then((value) => throw Exception()),
//       //   ).thenThrow(Exception("vehicle was not provided"));
//       //   expect(await CarDB(firestore: instance, user: user).add(testVehicle),
//       //       isA<Exception>());
//       // });
//     });
//     group("Get User Vehicle List:", () {
//       test("Success", () async {
//         await instance.collection(user.uid).add({
//           "VIN": "2CNFLEEW5A6267165",
//           "Make": "Chevrolet",
//           "Model": "Equinox",
//           "ModelYear": "2010",
//           "owner": "Kevin"
//         });

//         expect(await CarDB(user: user, firestore: instance).get(),
//             isA<List<Vehicle>>());
//       });
//       // test("Fail", () {
//       //   when(
//       //     () => CarDB(user: user, firestore: instance).get(),
//       //   ).thenThrow(Exception("this is an exception"));

//       //   expect(CarDB(user: user, firestore: instance).get(), isA<Exception>());
//       // });
//     });
//   });
// }
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_car_records/model/db/fb/car.dart';
import 'package:my_car_records/model/vehicle.dart';

Vehicle testVehicle = Vehicle.fromJson({
  "VIN": "2CNFLEEW5A6267165",
  "Make": "Chevrolet",
  "Model": "Equinox",
  "ModelYear": "2010",
  "owner": "Kevin"
});

void main() {
  group('CarDB', () {
    late CarDB carDB;
    late MockUser user;
    late FakeFirebaseFirestore firestore;

    setUp(() {
      firestore = FakeFirebaseFirestore();
      user = MockUser(
        isAnonymous: false,
        uid: '1',
        email: 'bob@somedomain.com',
        displayName: 'Bob',
      );
      carDB = CarDB(firestore: firestore, user: user);
    });

    test('adds a car', () async {
      final documentReference = await carDB.add(testVehicle);
      expect(documentReference.id, isNotNull);
    });

    test('throws an error', () async {
      when(() => firestore.collection('cars').add({
            "VIN": "2CNFLEEW5A6267165",
            "Make": "Chevrolet",
            "Model": "Equinox",
            "ModelYear": "2010",
            "owner": "Kevin"
          })).thenThrow(Exception('Error'));

      expect(() => carDB.add(testVehicle), throwsA(isA<Exception>()));
    });
  });
}
