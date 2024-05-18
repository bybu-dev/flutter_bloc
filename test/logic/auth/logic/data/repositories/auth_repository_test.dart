import 'package:bybuapp/features/auth/logic/data/datasource/local.dart';
import 'package:bybuapp/features/auth/logic/data/datasource/remote.dart';
import 'package:bybuapp/features/auth/logic/data/models/model.dart';
import 'package:bybuapp/features/auth/logic/data/repositories/auth.repository.dart';
import 'package:bybuapp/features/auth/logic/data/validator/auth.validator.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/auth.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/param.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';
import 'package:bybuapp/shared/core/repositories/network/network_info.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthLocalDataSource extends Mock implements AuthLocalDataSource {}
class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}
class MockAuthValidator extends Mock implements AuthValidator {}
class MockNetworkInfo extends Mock implements NetworkInfo {}

main() {
  late AuthLocalDataSource localDataSource;
  late AuthRemoteDataSource remoteDataSource;
  late MockAuthValidator authValidator;
  late NetworkInfo networkInfo;

  late AuthRepositoryImpl authRepository;

  setUp(() {
    localDataSource = MockAuthLocalDataSource();
    remoteDataSource = MockAuthRemoteDataSource();
    authValidator = MockAuthValidator();
    networkInfo = MockNetworkInfo();

    authRepository = AuthRepositoryImpl(
        localDataSource: localDataSource,
        remoteDataSource: remoteDataSource,
        networkInfo: networkInfo,
        authValidator: authValidator
    );
  });

  group('this is to check the implementation of the authrepository in data',
      () {
    test('this should work', () async {
      SignInParam signInParam = SignInParam(email: 'email@mail.com', password: '123');
      AuthModel authModelResponse = const AuthModel(
          userID: 'id',
          accessToken: 'accessToken',
          refreshToken: 'refreshToken'
        );

      // arrange
      when(() => remoteDataSource.signin(signInParam))
          .thenAnswer((_) async => authModelResponse);

      // act
      Either<Failure, Auth> authResult =
          await authRepository.signin(signInParam);

      // assert
      if (authResult.isRight()) {
      }
    });
  });
}
