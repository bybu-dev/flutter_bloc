import 'dart:convert';

import 'package:bybuapp/features/auth/logic/data/models/model.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/auth.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../fixtures/fixture_reader.dart';

void main() {
  AuthModel tUserModel = const AuthModel(
    userID: '123456',
    accessToken: "accessToken",
    refreshToken: "refreshToken"
  );

  test('check if UserModel is a sub type of User', () async {
    expect(tUserModel, isA<Auth>());
  });

  group('test fromMap in UserModel', () {
    test("check if regular auth map passes through fromMap method", () async {
      Map<String, dynamic> jsonMap =
          json.decode(fixture('user/auth.json'));
      AuthModel result = AuthModel.fromMap(jsonMap);
      expect(result, tUserModel);
    });
  });

  group('test toMap in UserModel', () {
    test("check if regular user map passes through fromMap method", () async {
      Map<String, dynamic> jsonMap =
          json.decode(fixture('user/auth.json'));
      Map<String, dynamic> result = tUserModel.toMap();
      expect(result, jsonMap);
    });
  });
}
