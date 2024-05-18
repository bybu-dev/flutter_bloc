part of 'auth_bloc.dart';

@immutable
abstract class AuthState extends Equatable {}

class AuthInitialState extends AuthState {
  @override
  List<Object?> get props => [];
}

enum AuthStatus {
  authenticated,
  unauthenticated,
}

class AuthStatusState extends AuthState {
  final AuthStatus authStatus;

  AuthStatusState(this.authStatus);
  @override
  List<Object?> get props => [];
}

class AuthLoadingState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthLoginState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthRegisterState extends AuthState {
  @override
  List<Object?> get props => [];
}

class AuthSignInErrorState extends AuthState {
  final SignInError? error;
  AuthSignInErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}

class AuthSignUpErrorState extends AuthState {
  final SignUpError? error;
  AuthSignUpErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}

class AuthSignoutErrorState extends AuthState {
  final String error;
  AuthSignoutErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
