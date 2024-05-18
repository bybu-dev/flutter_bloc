import 'dart:convert';
import 'package:bybuapp/features/auth/logic/data/models/model.dart';
import 'package:bybuapp/features/auth/logic/data/models/response.dart';
import 'package:bybuapp/features/user/logic/data/models/failures.dart';
import 'package:bybuapp/shared/core/interface/response/response_handler.dart';
import '../../../../../fixtures/fixture_reader.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  Map<String, dynamic> jsonMap =
      json.decode(fixture('auth/business_auth.json'));
  AuthModel businessUserModel = AuthModel.fromMap(jsonMap);
  AuthResponseModel tUserResponseModel =
      AuthResponseModel(status: true, data: businessUserModel);
  AuthResponseModel tErrorResponseModel =
      const AuthResponseModel(status: false, error: [ErrorModel(message: "authorization token is missing")]);

  test("check if UserResonseModel is a subtype of Response", () {
    expect(tUserResponseModel, isA<Response<AuthModel>>());
    expect(tErrorResponseModel, isA<Response<AuthModel>>());
  });

  group('fromMap', () {
    Map<String, dynamic> jsonMap =
        json.decode(fixture('user/remote_business_user_response.json'));

    test("testing to see if it will be successfull in handling response success json",
        () async {
      // act
      AuthResponseModel result = AuthResponseModel.fromMap(jsonMap);

      // assert
      expect(result, tUserResponseModel);
    });

    Map<String, dynamic> errorJsonMap =
        json.decode(fixture('user/remote_error_response.json'));

    test("testing to see if it will be successfull in handling response error json",
        () async {
      // act
      AuthResponseModel result = AuthResponseModel.fromMap(errorJsonMap);

      // assert
      expect(result, tErrorResponseModel);
    });
  });
}
