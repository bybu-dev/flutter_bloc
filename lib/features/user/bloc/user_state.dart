part of 'user_bloc.dart';

@immutable
abstract class UserState extends Equatable {}

class UserInitial extends UserState {
  List<Object?> get props => [];
}

class GetUserState extends UserState {
  final User user;

  GetUserState({required this.user});
  @override
  List<Object?> get props => [user];
}

class UserLoadingState extends UserState {
  @override
  List<Object?> get props => [];
}

class UnauthorizeState extends UserState {
  final GetMeError error;

  UnauthorizeState(this.error);
  @override
  List<Object?> get props => [error];
}

class UpdateUserErrorState extends UserState {
  final UpdateMeError error;

  UpdateUserErrorState(this.error);
  @override
  List<Object?> get props => [error];
}
