import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:my_car_records/model/db/fb/firebase/firebase_auth_manager.dart';

import '../../../test_data.dart';

class MockUserCredential extends Mock implements UserCredential {}

class MockFirebaseAuth extends Mock implements FirebaseAuth {
  @override
  Future<MockUserCredential> createUserWithEmailAndPassword(
      {required String email, required String password}) async {
    return MockUserCredential();
  }
}

void main() {
  late FirebaseAuthManager authManager;
  late MockFirebaseAuth mockFirebaseAuth;

  setUp(() {
    mockFirebaseAuth = MockFirebaseAuth();
    authManager = FirebaseAuthManager(auth: mockFirebaseAuth);
  });
  test('signUpWithEmailPassword', () async {
    when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenAnswer((_) async => MockUserCredential());

    await authManager.signUpWithEmailPassword('test@example.com', 'password');

    verify(() => mockFirebaseAuth.createUserWithEmailAndPassword(
          email: 'test@example.com',
          password: 'password',
        )).called(1);
  });

  test('signup returns UserCredentials', () async {
    expect(
        await authManager.signup('email', 'password'), isA<UserCredential>());
  });

  test('signup throws exception', () async {
    when(() => mockFirebaseAuth.createUserWithEmailAndPassword(
          email: testUser['email']!,
          password: testUser["password"]!,
        )).thenThrow(FirebaseAuthException(code: 'code'));

    expect(
        await authManager.signup(
          testUser['email']!,
          testUser['password']!,
        ),
        throwsA(isA<Exception>()));
  });

  test('signin returns success', () async {
    await authManager.signup(testUser["email"]!, testUser["password"]!);
    final credential = await authManager.signinWithEmailAndPassword(
      testUser['email']!,
      testUser['password']!,
    );
    expect(credential, isA<UserCredential>());
  });

  test('signin throws exception', () {
    when(() => mockFirebaseAuth.signInWithEmailAndPassword(
          email: any(named: 'email'),
          password: any(named: 'password'),
        )).thenThrow(FirebaseAuthException(code: 'code'));

    expect(() => authManager.signinWithEmailAndPassword('email', 'password'),
        throwsA(isA<Exception>()));
  });

  test('signout returns success', () async {
    when(() => mockFirebaseAuth.signOut()).thenAnswer((_) => Future.value());

    expect(await authManager.signout(), 'success');
  });

  test('signout throws exception', () async {
    when(() => mockFirebaseAuth.signOut()).thenThrow(Exception());

    expect(() async => await authManager.signout(), throwsA(isA<Exception>()));
  });
}
