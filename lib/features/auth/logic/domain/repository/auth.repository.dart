import 'package:bybuapp/features/auth/logic/data/models/error.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/auth.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/param.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<CacheFailure, Auth>> authenticate();
  Future<Either<SignUpFailure, Auth>> signup(SignUpParam params);
  Future<Either<SignInFailure, Auth>> signin(SignInParam params);
  Future<Either<CacheFailure, String>> signout();
}