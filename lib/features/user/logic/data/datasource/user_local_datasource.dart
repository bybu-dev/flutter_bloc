// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:bybuapp/features/user/logic/data/models/response.dart';
import 'package:bybuapp/features/user/logic/data/models/user.dart';
import 'package:bybuapp/shared/core/interface/error/exception.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

const cacheAuthInformationKey = 'CACHE_USER_INFORMATION';
const cacheUserInformation = 'CACHE_USER_INFORMATION';
const errorUnableToRetrieveMessage = 'unable to get cached user information';

abstract class UserLocalDataSource {
  Future<void> cacheMe(UserModel myInformation);
  Future<UserModel> getMe();
  Future<TokenModel> getAuth();
}

class UserLocalDataSourceImpl implements UserLocalDataSource {
  FlutterSecureStorage storage;

  UserLocalDataSourceImpl({
    required this.storage,
  });

  @override
  Future<bool> cacheMe(UserModel myInformation) async {
    try {
      String stringifyInformation = json.encode(myInformation.toMap());
      await Future.value(
          storage.write(key: cacheUserInformation, value: stringifyInformation));
      return true;
    } catch (err) {
      throw CacheException(message: err.toString());
    }
  }

  @override
  Future<UserModel> getMe() async {
    String? stringifyInformation = await storage.read(key: cacheUserInformation);
    if (stringifyInformation != null) {
      Map<String, dynamic> jsonMap = json.decode(stringifyInformation);
      return UserModel.fromMap(jsonMap);
    }
    throw CacheException(message: errorUnableToRetrieveMessage);
  }

  @override
  Future<TokenModel> getAuth() async {
    String? stringifyInformation = 
      await storage.read(key: cacheAuthInformationKey);
    if (stringifyInformation != null) {
      Map<String, dynamic> jsonMap = json.decode(stringifyInformation);
      return TokenModel.fromMap(jsonMap);
    }
    throw CacheException(message: errorUnableToRetrieveMessage);
  }
}
