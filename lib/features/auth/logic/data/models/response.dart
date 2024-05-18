
import 'package:bybuapp/features/auth/logic/data/models/model.dart';
import 'package:bybuapp/shared/core/interface/error/failures.dart';
import 'package:bybuapp/shared/core/interface/response/response_handler.dart';

class AuthResponseModel extends Response<AuthModel> {
  const AuthResponseModel({required super.status, super.data, super.error});

  factory AuthResponseModel.fromMap(Map<String, dynamic> jsonMap) {
    AuthModel? userModel =
        jsonMap['data'] == null ? null : AuthModel.fromMap(jsonMap['data']);

    List<ErrorModel>? error;
    if (jsonMap['error'] != null) {
      error = [];
      jsonMap['error'].forEach((err) {
        error!.add(ErrorModel.fromMap(err));
      });
    }

    return AuthResponseModel(
        status: jsonMap['status'],
        data: userModel,
        error: error
    );
  }
}
