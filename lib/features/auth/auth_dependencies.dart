import 'package:bybuapp/features/auth/bloc/auth_bloc.dart';
import 'package:bybuapp/features/auth/logic/data/datasource/remote.dart';
import 'package:bybuapp/features/auth/logic/data/datasource/local.dart';
import 'package:bybuapp/features/auth/logic/data/repositories/auth.repository.dart';
import 'package:bybuapp/features/auth/logic/data/validator/auth.validator.dart';
import 'package:bybuapp/features/auth/logic/domain/repository/auth.repository.dart';
import 'package:get_it/get_it.dart';

authDependencies(GetIt getIt) {
  //bloc
  getIt.registerFactory<AuthBloc>(() => AuthBloc(authRepository: getIt()));

  //repository
  getIt.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(
      localDataSource: getIt(),
      remoteDataSource: getIt(),
      networkInfo: getIt(),
      authValidator: getIt()));

  //validators
  getIt.registerLazySingleton<AuthValidator>(() => AuthValidatorImpl());

  // datasources
  getIt.registerLazySingleton<AuthRemoteDataSource>(
      () => AuthRemoteDataSourceImpl(httpClient: getIt()));
  getIt.registerLazySingleton<AuthLocalDataSource>(
      () => AuthLocalDataSourceImpl(storage: getIt()));
}
