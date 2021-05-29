part of 'settings_bloc.dart';

abstract class SettingsEvent  {
  const SettingsEvent();
}



 class GetCurrentRadiusEvent extends SettingsEvent {
}
 class UpdateCurrentRadiusEvent extends SettingsEvent {
  final int radius;

  UpdateCurrentRadiusEvent(this.radius);
}
