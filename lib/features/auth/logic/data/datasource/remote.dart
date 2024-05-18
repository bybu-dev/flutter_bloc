import 'dart:convert';
import 'package:bybuapp/features/auth/logic/data/models/model.dart';
import 'package:bybuapp/features/auth/logic/data/models/response.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/param.dart';
import 'package:bybuapp/shared/core/interface/error/exception.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';
import 'package:http/http.dart' as http;

abstract class AuthRemoteDataSource {
  Future<AuthModel> signin(SignInParam params);
  Future<AuthModel> signup(SignUpParam params);
}

class UserApiRoutes {
  static const String _host = 'http://10.0.0.2:8080';
  static const String loginRoutes = '$_host/v1/auth/';
  static const String signUpRoutes = '$_host/v1/auth/';
}

class TokenHolder {
  String accessToken = '';
}

class AuthRemoteDataSourceImpl implements AuthRemoteDataSource {
  final http.Client httpClient;
  final TokenHolder token = TokenHolder();

  AuthRemoteDataSourceImpl({required this.httpClient});

  @override
  Future<AuthModel> signin(SignInParam params) async {
    http.Response httpResponse = await httpClient
        .get(Uri.parse(UserApiRoutes.loginRoutes), headers: {
      'Content-Type': 'application/json',
    });
    AuthResponseModel authResponse =
        AuthResponseModel.fromMap(json.decode(httpResponse.body));
    if (authResponse.data != null) {
      return authResponse.data!;
    }
    throw ServerException<List<IError>>(authResponse.error ?? [const ErrorModel(message: 'error pasting data on signin')]);
  }

  @override
  Future<AuthModel> signup(SignUpParam params) async {
    http.Response httpResponse = await httpClient
        .get(Uri.parse(UserApiRoutes.signUpRoutes), headers: {
      'Content-Type': 'application/json',
    });
    AuthResponseModel authResponse =
        AuthResponseModel.fromMap(json.decode(httpResponse.body));
    if (authResponse.status) {
      return authResponse.data!;
    }
    throw ServerException<List<IError>>(authResponse.error ?? [const ErrorModel(message: 'error pasting data on signin')]);
  }
}
