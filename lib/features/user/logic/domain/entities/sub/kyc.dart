// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bybuapp/features/user/logic/domain/entities/user.dart';
import 'package:equatable/equatable.dart';

enum KYCVerificationDocumentType {
  nationalIdentificationCard,
  ninSlip,
  bvn,
}

class KYCVerificationDocument extends Equatable {
  final KYCVerificationDocumentType type;
  final String source;
  final VerificationStatusEnum status;

  const KYCVerificationDocument(
      {required this.type, required this.source, required this.status});

  @override
  List<Object?> get props => [type, source, status];
}

class KYC extends Equatable {
  final VerificationStatusEnum verificationStatus;
  final List<KYCVerificationDocument> verificationDocument;

  const KYC({
    required this.verificationStatus,
    required this.verificationDocument,
  });
  
  @override
  List<Object?> get props => [ verificationStatus, verificationDocument ];
}
