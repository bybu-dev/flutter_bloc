part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent extends Equatable {}

class AuthInitialEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}

class AuthSignInEvent extends AuthEvent {
  final SignInParam signInParam;

  AuthSignInEvent(this.signInParam);

  @override
  List<Object?> get props => [signInParam];
}

class AuthSignUpEvent extends AuthEvent {
  final SignUpParam registerParams;

  AuthSignUpEvent(this.registerParams);

  @override
  List<Object?> get props => [registerParams];
}

class AuthSignoutEvent extends AuthEvent {
  @override
  List<Object?> get props => [];
}
