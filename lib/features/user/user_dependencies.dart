import 'package:bybuapp/features/user/bloc/user_bloc.dart';
import 'package:bybuapp/features/user/logic/data/datasource/user_local_datasource.dart';
import 'package:bybuapp/features/user/logic/data/datasource/user_remote_datasource.dart';
import 'package:bybuapp/features/user/logic/data/repository/user.repository.dart';
import 'package:bybuapp/features/user/logic/domain/repository/user.repository.dart';
import 'package:get_it/get_it.dart';

userDependencies(GetIt getIt) {
  //bloc
  getIt.registerFactory<UserBloc>(() => UserBloc(userRepository: getIt()));

  //repository
  getIt.registerLazySingleton<UserRepository>(() => UserRepositoryImpl(
      localDataSource: getIt(),
      remoteDataSource: getIt(),
      networkInfo: getIt(),));

  // datasources
  getIt.registerLazySingleton<UserRemoteDataSource>(
      () => UserRemoteDataSourceImpl(httpClient: getIt()));
  getIt.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImpl(storage: getIt()));
}
