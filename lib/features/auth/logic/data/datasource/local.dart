// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bybuapp/features/auth/logic/data/models/model.dart';
import 'package:bybuapp/shared/core/interface/error/exception.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const cacheAuthInformationKey = 'CACHE_USER_INFORMATION';
const errorUnableToRetrieveMessage = 'unable to get cached user information';

abstract class AuthLocalDataSource {
  Future<AuthModel> getAuth();
  Future<void> cacheAuth(AuthModel myInformation);
  Future<bool> clearAuth();
}

class AuthLocalDataSourceImpl implements AuthLocalDataSource {
  FlutterSecureStorage storage;

  AuthLocalDataSourceImpl({
    required this.storage,
  });

  @override
  Future<bool> cacheAuth(AuthModel myInformation) async {
    try {
      String stringifyInformation = json.encode(myInformation.toMap());
      await Future.value(storage.write(
          key: cacheAuthInformationKey, value: stringifyInformation));
      return true;
    } catch (err) {
      throw CacheException(message: err.toString());
    }
  }


  @override
  Future<AuthModel> getAuth() async {
    String? stringifyInformation =
        await storage.read(key: cacheAuthInformationKey);
    if (stringifyInformation != null) {
      Map<String, dynamic> jsonMap = json.decode(stringifyInformation);
      return AuthModel.fromMap(jsonMap);
    }
    throw CacheException(message: errorUnableToRetrieveMessage);
  }

  @override
  Future<bool> clearAuth() async {
    try {
      await Future.value(storage.delete(key: cacheAuthInformationKey));
      return true;
    } catch (err) {
      throw CacheException(message: err.toString());
    }
  }
}
