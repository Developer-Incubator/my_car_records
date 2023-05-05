import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:my_car_records/model/user.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:my_car_records/utils/sharedprefs.dart';

class MockSharedPreferences extends Mock implements SharedPreferences {}

class MockUser extends Mock implements User {}

void main() {
  group('SharedPrefs', () {
    late MockSharedPreferences mockSharedPreferences;

    setUp(() {
      mockSharedPreferences = MockSharedPreferences();
      SharedPrefs.prefs = mockSharedPreferences;
    });

    test('should return null if no user is saved', () {
      when(mockSharedPreferences.getString('user')).thenReturn(null);

      final user = SharedPrefs.getUser();

      expect(user, null);
    });

    test('should return the saved user if one exists', () {
      final mockUser = MockUser();
      mockSharedPreferences.setString('user', mockUser.toString());
      when(mockSharedPreferences.getString('user'))
          .thenReturn(mockUser.toString());
      // when(MockUser.fromString(mockUser.toString())).thenReturn(mockUser);

      final user = SharedPrefs.getUser();

      expect(user, mockUser);
    });

    test('should save the new user to shared preferences', () {
      final mockUser = MockUser();

      SharedPrefs.saveUser(mockUser);

      verify(mockSharedPreferences.setString('user', mockUser.toString()))
          .called(1);
    });
  });
}
