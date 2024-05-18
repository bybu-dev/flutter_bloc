import 'package:bybuapp/features/auth/auth_dependencies.dart';
import 'package:bybuapp/features/user/user_dependencies.dart';
import 'package:bybuapp/shared/core/repositories/network/network_info.dart';
import 'package:data_connection_checker_nulls/data_connection_checker_nulls.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

final getIt = GetIt.instance;

initializeDependencies() {
  //! FEATURES
  //? AUTH
  authDependencies(getIt);
  //? USER
  userDependencies(getIt);

  //! SHARED
  getIt.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(getIt()));

  //! EXTERNAL
  getIt.registerLazySingleton<DataConnectionChecker>(
      () => DataConnectionChecker());
  getIt.registerLazySingleton<http.Client>(() => http.Client());

  getIt.registerLazySingleton<FlutterSecureStorage>(() => const FlutterSecureStorage());
}
