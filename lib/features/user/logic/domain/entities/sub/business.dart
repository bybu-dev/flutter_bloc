// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bybuapp/features/user/logic/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

class ProofOfBusiness extends Equatable {
  final String type;
  final String source;

  const ProofOfBusiness({
    required this.type,
    required this.source,
  });

  @override
  List<Object?> get props {
    return [type, source];
  }
}

class Business extends Equatable {
  final String businessName;
  final String contactPhoneNumber;
  final String? businessRegistrationNumber;
  final String businessAddress;
  final String? businessWebsite;
  final String businessType;
  final String? sourceOfFund;
  final String? purposeOfAccount;
  final List<ProofOfBusiness> proofOfBusiness;
  final VerificationStatusEnum verificationStatus;

  const Business({
    required this.businessName,
    required this.contactPhoneNumber,
    this.businessRegistrationNumber,
    required this.businessAddress,
    this.businessWebsite,
    required this.businessType,
    this.sourceOfFund,
    this.purposeOfAccount,
    required this.proofOfBusiness,
    required this.verificationStatus,
  });

  @override
  List get props {
    return [
      businessName,
      contactPhoneNumber,
      businessRegistrationNumber,
      businessAddress,
      businessWebsite,
      businessType,
      sourceOfFund,
      purposeOfAccount,
      proofOfBusiness,
      verificationStatus
    ];
  }
}
