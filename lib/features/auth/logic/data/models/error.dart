import 'package:bybuapp/features/auth/logic/domain/entities/error.dart';
import 'package:bybuapp/shared/core/interface/error/exception.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';

class SignInFailure extends Failure<SignInError> {
  const SignInFailure(super.isError, super.error);

  factory SignInFailure.fromException(ServerException<List<Error>> exception) {
    bool isError = false;
    SignInError loginError = SignInError();
    return SignInFailure(isError, loginError);
  }
}

class SignUpFailure extends Failure<SignUpError> {
  const SignUpFailure(super.isError, super.error);

  factory SignUpFailure.fromException(ServerException exception) {
    bool isError = false;
    SignUpError registerError = SignUpError();
    return SignUpFailure(isError, registerError);
  }
}
