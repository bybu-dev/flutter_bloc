part of 'user_bloc.dart';

@immutable
abstract class UserEvent extends Equatable {}

class GetUserEvent extends UserEvent {
  @override
  List<Object?> get props => [];
}

class UpdateUserEvent extends UserEvent {
  final UpdateMeParam params;

  UpdateUserEvent({required this.params});
  @override
  List<Object?> get props => [];
}
