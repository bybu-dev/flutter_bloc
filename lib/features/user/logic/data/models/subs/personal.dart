


import 'package:bybuapp/features/user/logic/domain/entities/sub/personal.dart';

class PersonalModel extends Personal {
  const PersonalModel({required super.name, required super.email, super.profileImage});

  factory PersonalModel.fromMap(Map<String, dynamic> jsonMap) {
    return PersonalModel(
      name: jsonMap['name'],
      email: jsonMap['email'],
      profileImage: jsonMap['profile_image']
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'profile_image': profileImage
    }..removeWhere((key, value) => value == null);
  }
}