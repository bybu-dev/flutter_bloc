import 'package:bybuapp/shared/core/interface/error/failures.dart';
import 'package:equatable/equatable.dart';

abstract class Response<Data> extends Equatable {
  final bool status;
  final List<IError>? error;
  final String? message;
  final Data? data;

  const Response({required this.status, this.data, this.message, this.error});

  @override
  List<Object?> get props => [data, error, message, status];
}

