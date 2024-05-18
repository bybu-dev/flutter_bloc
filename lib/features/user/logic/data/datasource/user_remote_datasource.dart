import 'dart:convert';

import 'package:bybuapp/features/user/logic/data/models/response.dart';
import 'package:bybuapp/features/user/logic/data/models/user.dart';
import 'package:bybuapp/shared/core/interface/error/exception.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';
import 'package:http/http.dart' as http;

abstract class UserRemoteDataSource {
  Future<UserModel> getMe(TokenModel token);
  Future<UserModel> updateMe(TokenModel token,
      { String? email, String? name, String? profileImage });
  Future<UserModel> upgrateToBusiness(TokenModel token);
}

class UserApiRoutes {
  static const String _host = 'http://10.0.0.2:3000';
  static const String getMeRoute = '$_host/user/';
  static const String updateMeRoute = '$_host/user/';
  static const String upgrateToBusinessRoute = '$_host/user/';
}

class UserRemoteDataSourceImpl implements UserRemoteDataSource {
  final http.Client httpClient;

  UserRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<UserModel> getMe(TokenModel token) async {
    try {
      http.Response httpResponse = await httpClient
          .get(Uri.parse(UserApiRoutes.getMeRoute), headers: {
        'Content-Type': 'application/json',
        'authentication': 'Bearer ${token.accessToken}',
      });
      UserResponseModel responseModel =
          UserResponseModel.fromMap(json.decode(httpResponse.body));
      if (responseModel.status) {
        return responseModel.data!;
      }
      throw ServerException(responseModel.error);
    } catch (err) {
      throw ServerException([ ErrorModel(message: err.toString()) ]);
    }
  }

  @override
  Future<UserModel> updateMe(TokenModel token,
      {String? email, String? name, String? profileImage}) async {
    try {
      http.Response httpResponse = await httpClient
          .put(Uri.parse(UserApiRoutes.updateMeRoute), headers: {
        'Content-Type': 'application/json',
        'authentication': 'Bearer ${token.accessToken}',
      });
      UserResponseModel responseModel =
          UserResponseModel.fromMap(json.decode(httpResponse.body));
      if (responseModel.status) {
        return responseModel.data!;
      }
      throw ServerException(responseModel.error);
    } catch (err) {
      throw ServerException([ ErrorModel(message: err.toString()) ]);
    }
  }

  @override
  Future<UserModel> upgrateToBusiness(TokenModel token) async {
    try {
      http.Response httpResponse = await httpClient
          .post(Uri.parse(UserApiRoutes.upgrateToBusinessRoute), headers: {
        'Content-Type': 'application/json',
        'authentication': 'Bearer ${token.accessToken}',
      });
      UserResponseModel responseModel =
          UserResponseModel.fromMap(json.decode(httpResponse.body));
      if (responseModel.status) {
        return responseModel.data!;
      }
      throw ServerException(responseModel.error);
    } catch (err) {
      throw ServerException([ ErrorModel(message: err.toString()) ]);
    }
  }
}
