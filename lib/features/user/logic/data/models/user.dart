import 'package:bybuapp/features/user/logic/data/models/subs/business.dart';
import 'package:bybuapp/features/user/logic/data/models/subs/kyc.dart';
import 'package:bybuapp/features/user/logic/data/models/subs/personal.dart';
import 'package:bybuapp/features/user/logic/data/models/subs/setting.dart';
import 'package:bybuapp/features/user/logic/domain/entities/user.dart';

String convertVerificationStatusEnumToString(VerificationStatusEnum status) {
  switch (status) {
    case VerificationStatusEnum.pending:
      return "Pending";
    case VerificationStatusEnum.cancelled:
      return "Cancelled";
    case VerificationStatusEnum.verified:
      return "Verified";
    case VerificationStatusEnum.rejected:
      return "Rejected";
    case VerificationStatusEnum.expired:
      return "Expired";
    case VerificationStatusEnum.suspended:
      return "Suspended";
    default:
      return "Unverified";
  }
}

VerificationStatusEnum convertStringToVerificationStatusEnum(String status) {
  switch (status) {
    case "Pending":
      return VerificationStatusEnum.pending;
    case "Cancelled":
      return VerificationStatusEnum.cancelled;
    case "Verified":
      return VerificationStatusEnum.verified;
    case "Rejected":
      return VerificationStatusEnum.rejected;
    case "Expired":
      return VerificationStatusEnum.expired;
    case "Suspended":
      return VerificationStatusEnum.suspended;
    default:
      return VerificationStatusEnum.unverified;
  }
}

String convertAccountTypeEnumToString(AccountTypeEnum accountTypeEnum) {
  switch (accountTypeEnum) {
    case AccountTypeEnum.business:
      return "Business";
    default:
      return "Personal";
  }
}

AccountTypeEnum convertStringToAccountTypeEnum(String accountType) {
  switch (accountType) {
    case "Business":
      return AccountTypeEnum.business;
    default:
      return AccountTypeEnum.personnal;
  }
}

class UserModel extends User {
  const UserModel(
      {required super.id,
      required super.accountType,
      super.business,
      required super.personal,
      required super.kyc,
      required super.setting,
      required super.createdAt,
      required super.updatedAt});

  factory UserModel.fromMap(Map<String, dynamic> jsonMap) {
    BusinessModel? businessInformartion =
        jsonMap['business_information'] == null
            ? null
            : BusinessModel.fromMap(jsonMap['business_information']);

    return UserModel(
        id: jsonMap['id'],
        accountType: convertStringToAccountTypeEnum(jsonMap['account_type']),
        personal:
            PersonalModel.fromMap(jsonMap['personal_information']),
        business: businessInformartion,
        kyc: KYCModel.fromMap(jsonMap['kyc_information']),
        setting: SettingModel.fromMap(jsonMap['setting']),
        createdAt: DateTime.parse(jsonMap['created_at']),
        updatedAt: DateTime.parse(jsonMap['updated_at']));
  }

  Map<String, dynamic> toMap() {
    Map<String, dynamic> personal = (this.personal as PersonalModel).toMap();
    Map<String, dynamic>? business = this.business == null
        ? null
        : (this.business as BusinessModel).toMap();
    Map<String, dynamic>? kyc = (this.kyc as KYCModel).toMap();
    Map<String, dynamic>? setting = (this.setting as SettingModel).toMap();

    return {
      'id': id,
      'account_type': convertAccountTypeEnumToString(accountType),
      'personal_information': personal,
      'business_information': business,
      'kyc_information': kyc,
      'setting': setting,
      'created_at': createdAt.toString(),
      'updated_at': updatedAt.toString()
    }..removeWhere((key, value) => value == null);
  }
}