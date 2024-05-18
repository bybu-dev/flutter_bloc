
import 'package:bybuapp/features/user/logic/domain/entities/sub/setting.dart';

class SettingModel extends Setting {
  const SettingModel(
      {required super.emailReminder,
      required super.popUpNotification,
      required super.isInformationEditable});

  factory SettingModel.fromMap(Map<String, dynamic> jsonMap) {
    return SettingModel(
        emailReminder: jsonMap['email_reminder'],
        popUpNotification: jsonMap['pop_up_notification'],
        isInformationEditable: jsonMap['is_information_editable']);
  }

  Map<String, dynamic> toMap() {
    return {
      'email_reminder': emailReminder,
      'pop_up_notification': popUpNotification,
      'is_information_editable': isInformationEditable
    };
  }
}
