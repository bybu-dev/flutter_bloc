import 'package:bybuapp/features/auth/logic/data/datasource/local.dart';
import 'package:bybuapp/features/auth/logic/data/datasource/remote.dart';
import 'package:bybuapp/features/auth/logic/data/models/error.dart';
import 'package:bybuapp/features/auth/logic/data/models/model.dart';
import 'package:bybuapp/features/auth/logic/data/validator/auth.validator.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/error.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/param.dart';
import 'package:bybuapp/features/auth/logic/domain/repository/auth.repository.dart';
import 'package:bybuapp/shared/core/interface/error/exception.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';
import 'package:bybuapp/shared/core/repositories/network/network_info.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthLocalDataSource localDataSource;
  final AuthRemoteDataSource remoteDataSource;
  final AuthValidator authValidator;
  final NetworkInfo networkInfo;

  AuthRepositoryImpl(
      {required this.localDataSource,
      required this.remoteDataSource,
      required this.networkInfo,
      required this.authValidator});

  @override
  Future<Either<CacheFailure, AuthModel>> authenticate() async {
    try {
      AuthModel auth = await localDataSource.getAuth();
      return Right(auth);
    } catch (err) {
      return const Left(CacheFailure(true, ''));
    }
  }

  @override
  Future<Either<SignInFailure, AuthModel>> signin(SignInParam params) async {
    try {
      SignInFailure failure = authValidator.signin(params);
      if (failure.isError) return Left(failure);

      AuthModel authResponse = await remoteDataSource.signin(params);
      await localDataSource.cacheAuth(authResponse);

      return Right(authResponse);
    } on ServerException<List<Error>> catch (exception) {
      return Left(SignInFailure.fromException(exception));
    } catch (err) {
      return Left(SignInFailure(true, SignInError()));
    }
  }

  @override
  Future<Either<SignUpFailure, AuthModel>> signup(SignUpParam params) async {
    try {
      SignUpFailure failure = authValidator.signup(params);
      if (failure.isError) Left(failure);

      AuthModel authResponse = await remoteDataSource.signup(params);
      await localDataSource.cacheAuth(authResponse);

      return Right(authResponse);
    } on ServerException catch (exception) {
      return Left(SignUpFailure.fromException(exception));
    } catch (err) {
      return Left(SignUpFailure(true, SignUpError()));
    }
  }

  @override
  Future<Either<CacheFailure, String>> signout() async {
    try {
      await localDataSource.clearAuth();
      return const Right('successfully logged out');
    } catch (err) {
      return const Left(CacheFailure(true, 'unable to logout this user'));
    }
  }
}
