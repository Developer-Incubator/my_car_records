import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';
import 'package:my_car_records/constance/constance.dart';
import 'package:my_car_records/model/db/user.dart';
import 'package:my_car_records/model/user.dart';

class MockHTTPClient extends Mock implements http.Client {}

void main() {
  late DBUser dbUser;
  late MockHTTPClient mockHTTPClient;
  setUp(() {
    mockHTTPClient = MockHTTPClient();
    dbUser = DBUser(mockHTTPClient);
  });
  group("DBUser -", () {
    group("register()", () {
      test('should register a new user', () async {
        // Given
        const email = 'test@example.com';
        const password = 'password';
        const username = 'testuser';
        const firstName = 'Test';
        const lastName = 'User';

        final expectedUser = User(
            id: 123,
            email: email,
            username: username,
            firstName: firstName,
            lastName: lastName,
            sessionToken: "testsessiontoken");
        print(expectedUser.toJson());

        final responseBody =
            jsonEncode({'error': null, 'message': expectedUser.toJson()});
        final response = http.Response(responseBody, 200);
        print(response);

        when(() => mockHTTPClient.post(
              Uri.parse('$urlfront/user/signup'),
              body: jsonEncode(
                {
                  'userInfo': {
                    'email': email,
                    'password': password,
                    'username': username,
                    'firstName': firstName,
                    'lastName': lastName,
                  }
                },
              ),
            )).thenAnswer((_) async => response);

        // When
        final user = await dbUser.register(
          email,
          password,
          username: username,
          firstName: firstName,
          lastName: lastName,
        );
        print(user);
        // Then
        expect(user, isA<User>());
      });

      test("should throw an Exception object on status code not 200", () async {
        //arrange
        final user = await dbUser.register("test1@mail.com", "test");
        expect(user, throwsException);
      });
    });
  });
}
