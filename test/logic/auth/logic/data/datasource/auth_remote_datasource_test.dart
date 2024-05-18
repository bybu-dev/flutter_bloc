import 'package:bybuapp/features/auth/logic/data/datasource/remote.dart';
import 'package:bybuapp/features/auth/logic/domain/entities/param.dart';
import 'package:bybuapp/shared/core/interface/error/exception.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mocktail/mocktail.dart';

import '../../../../../fixtures/fixture_reader.dart';

class MockHttpClient extends Mock implements http.Client {}

void main() {
  late MockHttpClient mockHttpClient;
  late AuthRemoteDataSourceImpl remoteDatasource;

  setUp(() {
    mockHttpClient = MockHttpClient();
    remoteDatasource = AuthRemoteDataSourceImpl(httpClient: mockHttpClient);
  });

  void setUpMockHttpResponse(String fixture, int code) {
    when(() => mockHttpClient.get(
            Uri.parse(UserApiRoutes.signUpRoutes),
            headers: any(named: 'headers')))
        .thenAnswer((invocation) async => http.Response(fixture, 200));
  }

  group("loginUser", () {
    test('''check if loginUser performs a get request 
            with "'Content-Type': 'application/json'" and
             "'authentication': 'Bearer token.accessToken'"
            ''', () async {
      // assert
      setUpMockHttpResponse(
          fixture('user/remote_business_user_response.json'), 403);
      // act
      remoteDatasource.signin(SignInParam(email: 'email', password: 'password'));
      // assert
      verify(() => Future.value(mockHttpClient
              .post(Uri.parse(UserApiRoutes.loginRoutes),
                headers: {
                  'Content-Type': 'application/json',
                },
                body: SignInParam(email: 'email', password: 'password')
              )));
    });

    test('should return success when request is throws the right exception', () async {
      // assert
      setUpMockHttpResponse('I have an error', 500);
      // act
      final call = remoteDatasource.signin(SignInParam(email: 'email', password: 'password'));
      // assert
      expect(() => call, throwsA(const TypeMatcher<ServerException>()));
    });
  });
}
