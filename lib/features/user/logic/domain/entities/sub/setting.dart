import 'package:equatable/equatable.dart';

class Setting extends Equatable {
  final bool emailReminder;
  final bool popUpNotification;
  final bool isInformationEditable;

  const Setting(
      {required this.emailReminder, required this.popUpNotification, required this.isInformationEditable});

  @override
  List<Object?> get props =>
      [emailReminder, popUpNotification, isInformationEditable];
}
