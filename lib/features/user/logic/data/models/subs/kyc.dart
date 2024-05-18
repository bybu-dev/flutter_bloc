

import 'package:bybuapp/features/user/logic/data/models/user.dart';
import 'package:bybuapp/features/user/logic/domain/entities/sub/kyc.dart';

class KYCVerificationDocumentModel extends KYCVerificationDocument {
  const KYCVerificationDocumentModel(
      {required super.type, required super.source, required super.status});

  factory KYCVerificationDocumentModel.fromMap(Map<String, dynamic> jsonMap) {
    return KYCVerificationDocumentModel(
        source: jsonMap['source'],
        status: jsonMap['status'],
        type: jsonMap['type']);
  }

  Map<String, dynamic> toMap() {
    return {'source': source, 'status': status, 'type': type};
  }
}

class KYCModel extends KYC {
  const KYCModel(
      {required super.verificationStatus, required super.verificationDocument});

  factory KYCModel.fromMap(Map<String, dynamic> jsonMap) {
    List<KYCVerificationDocumentModel> verificationDocument = [];

    jsonMap['verification_document'].forEach((proofOfBusinessJsonMap) {
      verificationDocument
          .add(KYCVerificationDocumentModel.fromMap(proofOfBusinessJsonMap));
    });
    return KYCModel(
        verificationDocument: verificationDocument,
        verificationStatus: convertStringToVerificationStatusEnum(
            jsonMap['verification_status']));
  }

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> verificationDocument = [];
    for (var e in this.verificationDocument) {
      verificationDocument.add(KYCVerificationDocumentModel(
              type: e.type, source: e.source, status: e.status)
          .toMap());
    }
    return {
      'verification_document': verificationDocument,
      'verification_status':
          convertVerificationStatusEnumToString(verificationStatus)
    }..removeWhere((key, value) => value == null);
  }
}
