import 'package:bybuapp/shared/core/interface/error/exception.dart';
import 'package:equatable/equatable.dart';

abstract class IError extends Equatable {
  final String? field;
  final String message;

  const IError({
    this.field,
    required this.message,
  });

  @override
  List<Object?> get props => [field, message];
}

abstract class Failure<ErrorType> extends Equatable {
  final bool isError;
  final ErrorType error;
  const Failure(this.isError, this.error);

  @override
  List<Object?> get props => [];
}

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
