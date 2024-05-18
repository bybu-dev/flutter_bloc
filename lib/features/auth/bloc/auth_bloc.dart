import 'package:bloc/bloc.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/auth.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/error.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/param.dart';
import 'package:bybuapp/features/auth/logic/domain/repository/auth.repository.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc({
    required this.authRepository,
  }) : super(AuthInitialState()) {
    on<AuthInitialEvent>(_initialize);
    on<AuthSignInEvent>(_signin);
    on<AuthSignUpEvent>(_signup);
    on<AuthSignoutEvent>(_signout);
  }

  _initialize(event, emit) async {
    emit(AuthInitialState());
    Either<CacheFailure, Auth> response = await authRepository.authenticate();

    response.fold((l) => emit(AuthStatusState(AuthStatus.unauthenticated)),
        (r) => emit(AuthStatusState(AuthStatus.authenticated)));
  }

  _signin(event, emit) async {
    emit(AuthLoadingState());
    Either<Failure<SignInError>, Auth> response = await authRepository.signin(event.logInParams);

    response.fold((l) => emit(AuthSignInErrorState(error: l.error)),
        (r) => emit(AuthStatusState(AuthStatus.authenticated)));
  }

  _signup(event, emit) async {
    emit(AuthLoadingState());
    Either<Failure<SignUpError>, Auth> response = await authRepository.signup(event.registerParams);

    response.fold((l) => emit(AuthSignUpErrorState(error: l.error)),
        (r) => emit(AuthStatusState(AuthStatus.authenticated)));
  }

  _signout(event, emit) async {
    emit(AuthLoadingState());
    Either<CacheFailure, String> response = await authRepository.signout();

    response.fold((l) => emit(AuthSignoutErrorState(error: l.error)),
        (r) => emit(AuthStatusState(AuthStatus.unauthenticated)));
  }
}
