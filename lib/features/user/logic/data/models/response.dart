import 'package:bybuapp/features/user/logic/data/models/user.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';
import 'package:bybuapp/shared/core/interface/response/response_handler.dart';

class UserResponseModel extends Response<UserModel> {
  const UserResponseModel({required super.status, super.data, super.error});

  factory UserResponseModel.fromMap(Map<String, dynamic> jsonMap) {
    UserModel? userModel =
        jsonMap['data'] == null ? null : UserModel.fromMap(jsonMap['data']);

    List<ErrorModel>? error;
    if (jsonMap['error'] != null) {
      error = [];
      jsonMap['error'].forEach((err) {
        error!.add(ErrorModel.fromMap(err));
      });
    }

    return UserResponseModel(
        status: jsonMap['status'], data: userModel, error: error);
  }
}

class TokenModel {
  final String? accessToken;
  final String? refreshToken;

  const TokenModel({ this.accessToken, this.refreshToken });

  factory TokenModel.fromMap(Map<String, dynamic> jsonMap) {
    return TokenModel(
      accessToken: jsonMap['access_token'],
      refreshToken: jsonMap['refresh_token'],
    );
  }
}
