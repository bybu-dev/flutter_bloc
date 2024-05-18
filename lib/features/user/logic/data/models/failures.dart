

import 'package:bybuapp/features/user/logic/domain/entities/error.dart';
import 'package:bybuapp/shared/core/interface/error/exception.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';

class ErrorModel extends IError {
  const ErrorModel({super.field, required super.message});
  
  factory ErrorModel.fromMap(Map<String, dynamic> jsonMap) {
    return ErrorModel(field: jsonMap['field'], message: jsonMap['message']);
  }

  @override
  List<Object?> get props => [field, message];
}

class CacheFailure extends Failure<String> {
  const CacheFailure(super.isError, super.error);

  factory CacheFailure.fromException(CacheException exception) {
    return CacheFailure(true, exception.message);
  }
}

class GetMeFailure extends Failure<GetMeError> {
  const GetMeFailure(super.isError, super.errors);

  factory GetMeFailure.fromException(ServerException<GetMeError> exception) {
    return GetMeFailure(false, exception.error);
  }
}

class UpdateMeFailure extends Failure<UpdateMeError> {
  const UpdateMeFailure(super.isError, super.errors);

  factory UpdateMeFailure.fromException(ServerException<UpdateMeError> exception) {
    return UpdateMeFailure(false, exception.error);
  }
}