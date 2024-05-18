import 'package:bloc/bloc.dart';
import 'package:bybuapp/features/user/logic/domain/entities/error.dart';
import 'package:bybuapp/features/user/logic/domain/entities/param.dart';
import 'package:bybuapp/features/user/logic/domain/entities/user.dart';
import 'package:bybuapp/features/user/logic/domain/repository/user.repository.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';
import 'package:equatable/equatable.dart';
import 'package:dartz/dartz.dart';
import 'package:meta/meta.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final UserRepository userRepository;

  UserBloc({required this.userRepository}) : super(UserInitial()) {
    on<GetUserEvent>(_getUser);
    on<UpdateUserEvent>(_updateProfile);
  }

  _getUser(GetUserEvent event, Emitter<UserState> emit) async {
    Either<Failure<GetMeError>, User> response = await userRepository.getMe();

    response.fold((l) => emit(UnauthorizeState(l.error)),
      (r) => emit(GetUserState(user: r)));
  }

  _updateProfile(UpdateUserEvent event, Emitter<UserState> emit) async {
    Either<Failure<UpdateMeError>, User> response = await userRepository.updateMe(event.params);

    response.fold((l) => emit(UpdateUserErrorState(l.error)),
      (r) => emit(GetUserState(user: r)));
  }
}
