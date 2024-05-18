import 'package:bybuapp/features/auth/logic/data/models/error.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/error.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/param.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';
import 'package:string_validator/string_validator.dart' as validator;

abstract class AuthValidator {
  SignInFailure signin(SignInParam params);
  SignUpFailure signup(SignUpParam params);
}

class AuthValidatorImpl implements AuthValidator {
  @override
  SignInFailure signin(SignInParam params) {
    SignInError error = SignInError();
    bool isError = false;

    if (!validator.isEmail(params.email ?? "")) {
      error.email = const ErrorModel(message: "email address is invalid");
      isError = true;
    }

    if (!validator.isMultibyte(params.password ?? "")) {
      error.password = const ErrorModel(message: "password is invalid");
      isError = true;
    }

    return SignInFailure(isError, error);
  }

  @override
  SignUpFailure signup(SignUpParam params) {
    SignUpError error = SignUpError();
    bool isError = false;

    if (!validator.isLength(params.firstName ?? "", 3)) {
      error.first = const ErrorModel(message: "First name is invalid");
      isError = true;
    }

    if (!validator.isLength(params.lastName ?? "", 3)) {
      error.last = const ErrorModel(message: "Last name is invalid");
      isError = true;
    }

    if (!validator.isEmail(params.emailAddress ?? "")) {
      error.email = const ErrorModel(message: "Email is invalid");
      isError = true;
    }

    if (!validator.isLength(params.password ?? "", 6)) {
      error.password = const ErrorModel(message: "Password is invalid");
      isError = true;
    }

    return SignUpFailure(isError, error);
  }
}
