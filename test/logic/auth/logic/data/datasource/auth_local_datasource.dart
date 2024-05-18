import 'dart:convert';

import 'package:bybuapp/features/auth/logic/data/datasource/local.dart';
import 'package:bybuapp/features/auth/logic/data/models/model.dart';
import 'package:bybuapp/shared/core/interface/error/exception.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../../fixtures/fixture_reader.dart';

class MockFlutterSecureStorage extends Mock implements FlutterSecureStorage {}

void main() {
  late MockFlutterSecureStorage mockStorage;
  late AuthLocalDataSourceImpl localDataSource;

  setUp(() {
    mockStorage = MockFlutterSecureStorage();
    localDataSource =
        AuthLocalDataSourceImpl(storage: mockStorage);
  });

  AuthModel authModel =
      AuthModel.fromMap(json.decode(fixture('auth/auth.json')));

  group('cacheUserInformaton', () {
    test('should pass UserModel to mockSharedPreferences.setString', () async {
      //arrange
      String stringifiedJson = json.encode(authModel.toMap());
      when(() => mockStorage.write(
              key: cacheAuthInformationKey, value: stringifiedJson))
          .thenAnswer((invocation) => Future.value());
      // act
      await localDataSource.cacheAuth(authModel);

      // assert
      verify(() => mockStorage.write(
          key: cacheAuthInformationKey, value: stringifiedJson));
    });
  });

  group('getUserInformation', () {
    test('should retrive UserModel from localDataSource.getUserInformation',
        () async {
      //arrange
      String stringifiedJson = json.encode(authModel.toMap());
      when(() => mockStorage.read(key: cacheAuthInformationKey))
          .thenAnswer((invocation) => Future.value(stringifiedJson));
      // act
      AuthModel result = await localDataSource.getAuth();

      // assert
      verify(() => mockStorage.read(key: cacheAuthInformationKey));
      expect(result, authModel);
    });

    test(
        'should retrive business UserModel from localDataSource.getUserInformation',
        () async {
      //arrange
      AuthModel userModel =
          AuthModel.fromMap(json.decode(fixture('user/business_user.json')));
      String stringifiedJson = json.encode(userModel.toMap());
      when(() => mockStorage.read(key: cacheAuthInformationKey))
          .thenAnswer((invocation) => Future.value(stringifiedJson));

      // act
      AuthModel result = await localDataSource.getAuth();

      // assert
      verify(() => mockStorage.read(key: cacheAuthInformationKey));
      expect(result, userModel);
    });

    test('should not retrive UserModel from localDataSource.getUserInformation',
        () async {
      //arrange
      when(() => mockStorage.read(key: cacheAuthInformationKey))
          .thenAnswer((invocation) => Future.value(null));
      // act
      final caller = localDataSource.getAuth;

      //assert
      expect(() => caller(), throwsA(const TypeMatcher<CacheException>()));
    });
  });
}
