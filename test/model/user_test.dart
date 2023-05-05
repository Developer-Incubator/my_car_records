import 'package:flutter_test/flutter_test.dart';
import 'dart:convert';
import 'package:my_car_records/model/user.dart';

void main() {
  group('User', () {
    test('fromJson() should return a User object with correct properties', () {
      // Arrange
      final Map<String, dynamic> json = {
        "id": "123",
        "username": "johndoe",
        "session_token": "abcd1234",
        "first_name": "John",
        "last_name": "Doe",
        "email": "johndoe@example.com"
      };

      // Act
      final User user = User.fromJson(json);

      // Assert
      expect(user.id, 123);
      expect(user.username, 'johndoe');
      expect(user.sessionToken, 'abcd1234');
      expect(user.firstName, 'John');
      expect(user.lastName, 'Doe');
      expect(user.email, 'johndoe@example.com');
    });

    test('toString() should return a JSON string', () {
      // Arrange
      final User user = User(
          id: 123,
          username: 'johndoe',
          sessionToken: 'abcd1234',
          firstName: 'John',
          lastName: 'Doe',
          email: 'johndoe@example.com');

      // Act
      final String jsonStr = user.toString();

      // Assert
      final Map<String, dynamic> json = jsonDecode(jsonStr);
      expect(json['id'], user.id);
      expect(json['username'], user.username);
      expect(json['session_token'], user.sessionToken);
      expect(json['first_name'], user.firstName);
      expect(json['last_name'], user.lastName);
      expect(json['email'], user.email);
    });

    test('fromString() should return a User object with correct properties',
        () {
      // Arrange
      const String jsonStr =
          '{"id":123,"username":"johndoe","session_token":"abcd1234","first_name":"John","last_name":"Doe","email":"johndoe@example.com"}';

      // Act
      final User user = User.fromString(jsonStr);

      // Assert
      expect(user.id, 123);
      expect(user.username, 'johndoe');
      expect(user.sessionToken, 'abcd1234');
      expect(user.firstName, 'John');
      expect(user.lastName, 'Doe');
      expect(user.email, 'johndoe@example.com');
    });

    test('User object with null id should be considered as a new user', () {
      // Arrange
      final User user = User(
          username: 'johndoe',
          sessionToken: 'abcd1234',
          firstName: 'John',
          lastName: 'Doe',
          email: 'johndoe@example.com');

      // Act
      final bool isNewUser = user.id == null;

      // Assert
      expect(isNewUser, true);
    });
  });
}
