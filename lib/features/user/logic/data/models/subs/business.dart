

import 'package:bybuapp/features/user/logic/data/models/user.dart';
import 'package:bybuapp/features/user/logic/domain/entities/sub/business.dart';

class ProofOfBusinessModel extends ProofOfBusiness {
  const ProofOfBusinessModel({required super.type, required super.source});

  factory ProofOfBusinessModel.fromMap(Map<String, dynamic> jsonMap) {
    return ProofOfBusinessModel(
        type: jsonMap['type'], source: jsonMap['source']);
  }

  Map<String, dynamic> toMap() {
    return {type: type, source: source};
  }
}

class BusinessModel extends Business {
  const BusinessModel(
      {required super.businessName,
      required super.contactPhoneNumber,
      super.businessRegistrationNumber,
      required super.businessAddress,
      super.businessWebsite,
      required super.businessType,
      super.sourceOfFund,
      super.purposeOfAccount,
      required super.proofOfBusiness,
      required super.verificationStatus});

  factory BusinessModel.fromMap(Map<String, dynamic> jsonMap) {
    List<ProofOfBusinessModel> proofOfBusiness = [];
    jsonMap['proof_of_business'].forEach((proofOfBusinessJsonMap) {
      proofOfBusiness.add(ProofOfBusinessModel.fromMap(proofOfBusinessJsonMap));
    });
    return BusinessModel(
        businessName: jsonMap['business_name'],
        contactPhoneNumber: jsonMap['contact_phone_number'],
        businessRegistrationNumber: jsonMap['business_registration_number'],
        businessAddress: jsonMap['business_address'],
        businessWebsite: jsonMap['business_website'],
        businessType: jsonMap['business_type'],
        sourceOfFund: jsonMap['source_of_fund'],
        purposeOfAccount: jsonMap['purpose_of_account'],
        proofOfBusiness: proofOfBusiness,
        verificationStatus: convertStringToVerificationStatusEnum(
            jsonMap['verification_status']));
  }

  Map<String, dynamic> toMap() {
    List<Map<String, dynamic>> proofOfBusiness = [];
    for (var e in this.proofOfBusiness) {
      proofOfBusiness
          .add(ProofOfBusinessModel(type: e.type, source: e.source).toMap());
    }
    Map<String, dynamic> jsonMap = {
      'business_name': businessName,
      'contact_phone_number': contactPhoneNumber,
      'business_registration_number': businessRegistrationNumber,
      'business_address': businessAddress,
      'business_website': businessWebsite,
      'business_type': businessType,
      'source_of_fund': sourceOfFund,
      'purpose_of_account': purposeOfAccount,
      'proof_of_business': proofOfBusiness,
      'verification_status': convertVerificationStatusEnumToString(verificationStatus),
    };
    jsonMap.removeWhere((key, value) => value == null);
    return jsonMap;
  }
}
