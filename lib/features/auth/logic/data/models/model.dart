
import 'package:bybuapp/features/auth/logic/domain/entities/auth.dart';

class AuthModel extends Auth {
  const AuthModel({
    required super.userID,
    required super.accessToken,
    required super.refreshToken
  });

  factory AuthModel.fromMap(Map<String, dynamic> jsonMap) {
    return AuthModel(
      userID: jsonMap['id'],
      accessToken: jsonMap['access_token'],
      refreshToken: jsonMap['refresh_token'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': userID,
      'access_token': accessToken,
      'refresh_token': refreshToken,
    }..removeWhere((key, value) => value == null);
  }
}
