// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bybuapp/features/user/logic/data/datasource/user_local_datasource.dart';
import 'package:bybuapp/features/user/logic/data/datasource/user_remote_datasource.dart';
import 'package:bybuapp/features/user/logic/data/models/failures.dart';
import 'package:bybuapp/features/user/logic/data/models/response.dart';
import 'package:bybuapp/features/user/logic/data/models/user.dart';
import 'package:bybuapp/features/user/logic/domain/entities/error.dart';
import 'package:bybuapp/features/user/logic/domain/entities/param.dart';
import 'package:bybuapp/features/user/logic/domain/entities/user.dart';
import 'package:bybuapp/features/user/logic/domain/repository/user.repository.dart';
import 'package:bybuapp/shared/core/interface/error/exception.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';
import 'package:bybuapp/shared/core/repositories/network/network_info.dart';
import 'package:dartz/dartz.dart';

class UserRepositoryImpl implements UserRepository {
  final UserLocalDataSource localDataSource;
  final UserRemoteDataSource remoteDataSource;
  final NetworkInfo networkInfo;
  TokenModel? _token;

  UserRepositoryImpl({
    required this.localDataSource,
    required this.remoteDataSource,
    required this.networkInfo,
  });

  Future<TokenModel> get _getToken async {
    if (_token != null) return _token!;
    _token = await localDataSource.getAuth();
    return _token!;
  }

  @override
  Future<Either<GetMeFailure, User>> getMe() async {
    try {
      UserModel user = await remoteDataSource.getMe(await _getToken);
      return Right(user);
    } on ServerException<GetMeError> catch (exception) {
      return Left(GetMeFailure.fromException(exception));
    } catch (err) {
      return Left(GetMeFailure(true, GetMeError( err.toString())));
    }
  }

  @override
  Future<Either<UpdateMeFailure, User>> updateMe(UpdateMeParam param) async {
    try {
      UserModel user = await remoteDataSource.getMe(await _getToken);
      return Right(user);
    } on ServerException<UpdateMeError> catch (exception) {
      return Left(UpdateMeFailure.fromException(exception));
    } catch (err) {
      return Left(UpdateMeFailure(true, UpdateMeError( err.toString())));
    }
  }

  @override
  Future<Either<Failure, User>> upgrateToBusiness() async {
    try {
      UserModel user = await remoteDataSource.getMe(await _getToken);
      return Right(user);
    } on ServerException<GetMeError> catch (exception) {
      return Left(GetMeFailure.fromException(exception));
    } catch (err) {
      return Left(GetMeFailure(true, GetMeError( err.toString())));
    }
  }
}
