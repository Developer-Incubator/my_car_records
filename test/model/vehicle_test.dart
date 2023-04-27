import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_car_records/model/db/firebase/firebase_auth_manager.dart';

void main() {
  late MockUser user;

  late FakeFirebaseFirestore instance;
  setUp(() async {
    instance = FakeFirebaseFirestore();
    user = MockUser(
      isAnonymous: false,
      uid: '1',
      email: 'bob@somedomain.com',
      displayName: 'Bob',
    );

    await instance.collection(user.uid).add({
      "VIN": "2CNFLEEW5A6267165",
      "Make": "Chevrolet",
      "Model": "Equinox",
      "ModelYear": "2010",
      "owner": "Kevin"
    });
  });
  group("Vehicle - ", () {
    group("Create: ", () {
      test("Given some json create a vehicle instance", () async {});
    });
  });
}
