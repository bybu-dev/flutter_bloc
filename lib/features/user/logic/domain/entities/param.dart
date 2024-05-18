import 'package:equatable/equatable.dart';

class UpdateMeParam extends Equatable {
  final String? name;
  final String? emailAddress;
  final String? profilePicture;

  const UpdateMeParam({required this.name, required this.emailAddress, required this.profilePicture});

  @override
  List<Object?> get props => [];
}
