import 'package:equatable/equatable.dart';

class Auth extends Equatable {
  final String userID;
  final String accessToken;
  final String refreshToken;

  const Auth(
      {required this.userID,
      required this.accessToken,
      required this.refreshToken});

  @override
  List<Object> get props => [userID, accessToken, refreshToken];
}
