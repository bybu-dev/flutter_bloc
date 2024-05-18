
import 'package:equatable/equatable.dart';

class Personal extends Equatable {
  final String name;
  final String email;
  final String? profileImage;

  const Personal({
    required this.name,
    required this.email,
    this.profileImage,
  });

  @override
  List<Object?> get props {
    return [
      name,
      email,
      profileImage,
    ];
  }
}
