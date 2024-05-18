import 'package:bybuapp/shared/core/interface/error/failures.dart';

class SignUpError {
  IError? first;
  IError? last;
  IError? email;
  IError? password;

  SignUpError({ this.first, this.last, this.email, this.password });
}

class SignInError {
  IError? email;
  IError? password;

  SignInError({ this.email,this.password });
}