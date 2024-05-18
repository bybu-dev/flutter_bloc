// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bybuapp/features/user/logic/domain/entities/error.dart';
import 'package:bybuapp/features/user/logic/domain/entities/param.dart';
import 'package:bybuapp/features/user/logic/domain/entities/user.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';
import 'package:dartz/dartz.dart';

abstract class UserRepository {
  Future<Either<Failure<GetMeError>, User>> getMe();
  Future<Either<Failure<UpdateMeError>, User>> updateMe(UpdateMeParam param);
  Future<Either<Failure, User>> upgrateToBusiness();
}