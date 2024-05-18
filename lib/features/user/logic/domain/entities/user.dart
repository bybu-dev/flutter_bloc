// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bybuapp/features/user/logic/domain/entities/sub/business.dart';
import 'package:bybuapp/features/user/logic/domain/entities/sub/kyc.dart';
import 'package:bybuapp/features/user/logic/domain/entities/sub/personal.dart';
import 'package:bybuapp/features/user/logic/domain/entities/sub/setting.dart';
import 'package:equatable/equatable.dart';

enum AccountTypeEnum { personnal, business }

enum VerificationStatusEnum {
  unverified,
  pending,
  verified,
  rejected,
  expired,
  suspended,
  cancelled
}

class User extends Equatable {
  final String id;
  final AccountTypeEnum accountType;
  final Personal personal;
  final Business? business;
  final KYC kyc;
  final Setting setting;
  final DateTime createdAt;
  final DateTime updatedAt;

  const User({
      required this.id,
      required this.accountType,
      required this.personal,
      this.business,
      required this.kyc,
      required this.setting,
      required this.createdAt,
      required this.updatedAt
  });

  @override
  List<Object?> get props {
    return [
      id,
      accountType,
      personal,
      business,
      kyc,
      setting,
      createdAt,
      updatedAt,
    ];
  }
}